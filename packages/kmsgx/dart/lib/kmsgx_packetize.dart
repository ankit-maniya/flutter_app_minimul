import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:core';
// import 'package:logging/logging.dart';

// Define packet constants
final _kmsgxSOH = 1; // kmsgx Start of Header (SOH) character
final _kmsgxACK = 6; // kmsgx acknowledgement (ACK) character
final _kmsgxNAK = 21; // kmsgx negative acknowledgement (NAK) character

/// `enum _kmsgxRxState` is defining a custom enumerated data type in Dart programming language. It is
/// used to represent the different states of a kmsgx packet receive state machine. The four states
/// defined are `sohSearching`, `lengthSearching`, `dataCollecting`, and `checksumSearching`. These
/// states are used to keep track of the progress of decoding a kmsgx packet and to determine what
/// action needs to be taken next based on the current state.
enum _kmsgxRxState {
  sohSearching,
  lengthSearching,
  dataCollecting,
  checksumSearching
}

/// The class defines a static logger instance for logging packets with the tag "kmsgxPkt".
class KmsgxPktLogger {
  static final log = print('kmsgxPkt');
  // static final log = Logger("kmsgxPkt");
}

class KmsgxPacketize {
  int _kmsgxLength = 0;
  int _kmsgxLengthCollected = 0;
  List<int> _kmsgxDataCollected = [];
  Duration? kmsgxPacketTimeoutDuration;
  var _kmsgxPacketTimeout; // For Timer object.

  KmsgxPacketize(
      {this.kmsgxPacketTimeoutDuration = const Duration(milliseconds: 500)}) {
    _kmsgxPacketInit();
  }

// kmsgx rx is stateful, use this to track present state.
  _kmsgxRxState _kmsgxPresentRxState = _kmsgxRxState.sohSearching;

// This allows one to reset the kmsgx receive state machine.
// This is called at the end of each kmsgx packet decoded.
// If there was a timeout, it would have 'full_reset' true
//  This would then also flush out any _kmsgxDataRemnant.
  void _kmsgxRxReset([bool full_reset = false, bool kmsgxInit = false]) {
    if ((full_reset == true) && (kmsgxInit == false)) {
      // KmsgxPktLogger.log.warning('Decode packet receive timeout !');
    }

    _kmsgxPresentRxState = _kmsgxRxState.sohSearching;
    _kmsgxLength = 0;
    _kmsgxLengthCollected = 0;
    _kmsgxDataCollected = [];
  }

// This timer is for kmsgx receive state machine. If a full kmsgx packet
// is not received in the _kmsgxPacketTimeoutDuration timeframe, then
// we will autmatically reset our kmsgx Rx packet state machine.
  void _kmsgxTimerStart(bool enable) {
    // print('_kmsgxTimerStart ($enable)');
    if (enable == true) {
      Duration t;
      t = kmsgxPacketTimeoutDuration ?? Duration(milliseconds: 500);

      _kmsgxPacketTimeout = Timer(t, () => _kmsgxRxReset(true));
    } else {
      _kmsgxPacketTimeout.cancel();
    }
  }

// Recommended to call this between UTC tests ...
  void _kmsgxPacketInit([Duration? decodeTimeoutDuration]) {
    if (decodeTimeoutDuration == null) {
      kmsgxPacketTimeoutDuration = Duration(milliseconds: 500);
    }
    // 2nd parameter indicates we are resetting due to kmsgxPacketInit()
    // not from a _kmsgxPacketTimeout timeout event
    _kmsgxRxReset(true, true);
  }

// If doing 'decode' operation, must pride rxStreamController object.
  Uint8List? kmsgxPacket(Uint8List msg, bool isSending,
      [StreamController<Uint8List>? rxStreamController]) {
    if (isSending == true) {
      // kmsgxEncodedBytes is a Uint8List bytes that will be returned to the caller
      // and it will be a kmsgx packetization of above supplied 'msg' data.
      var kmsgxEncodedBytes = BytesBuilder();

      // kmsgx packet starts with SOH and Length fields
      kmsgxEncodedBytes.addByte(_kmsgxSOH);
      kmsgxEncodedBytes.addByte(msg.length);

      // ... followed by the actual msg data
      kmsgxEncodedBytes.add(msg);

      // ... followed by the checksum byte
      var ckSum = 0;
      for (var i = 0; i < msg.length; i++) {
        ckSum += msg[i];
      }
      ckSum ^= 0xFF;
      ckSum += 1;
      kmsgxEncodedBytes.addByte(ckSum);

      // Return to caller the original 'msg' packetized into a full kmsgx packet
      return kmsgxEncodedBytes.toBytes();
    } else {
      // This is where the kmsgx Decode processing starts.
      //
      // Uint8List 'msg' is bytes of data received, where we need to extract kmsgx packets.
      //
      // Any packet found is added to rxStreamController
      // If kmsgx packet is found, we return the actual desired 'msg' data, having
      // stripped off kmsgx packetization information.
      // We don't return data via this method. It just returns null
      //
      // ** Note that kmsgx can be spread across multiple calls to kmsgPacket() decoding.
      // So it is important that we maintain state. Even when a kmsgx packet is found
      // and there are still remaining bytes, we must preserve those bytes for the
      // next call to kmsgPacket() decoding.
      //
      // But in case the Decode state machine gets stuck in a non-idle state,
      // we will reset the Decode state machine if no more calls to kmsgPacket() decoding
      // within the specified timeout

      // kmsgx is a byte-orientated protocol. So we will process each byte individually.
      // 1st, if there were any remaning bytes from previous kmsgPacket() decoding,
      // we need to append them to this processing.

      // IMPORTANT: this processing can handle multiple kmsgx packets in one
      // processing loop. If BLE rx link is busy, it can easily have more than 1 packet.

      // Restart kmsgx packet receive timer on every decoding call ...
      if (_kmsgxPresentRxState != _kmsgxRxState.sohSearching) {
        _kmsgxTimerStart(false);
      }
      // Now let us process all of the kmsgBytes ...
      for (var i = 0; i < msg.length; i++) {
        switch (_kmsgxPresentRxState) {
          case _kmsgxRxState.sohSearching: // looking for _kmsgSOH
            if (msg[i] == _kmsgxSOH) {
              _kmsgxPresentRxState = _kmsgxRxState.lengthSearching;
            } else {
              if (msg[i] == _kmsgxACK) {
                // KmsgxPktLogger.log.config('kmsgx: Decode ACK received');
                // print('kmsgx: Decode ACK received');
              } else if (msg[i] == _kmsgxNAK) {
                // KmsgxPktLogger.log.config('kmsgx: Decode NAK received -> bad checksum');
                // print('kmsgx: Decode NAK received -> bad checksum');
              } else {
                // KmsgxPktLogger.log.config('kmsgx: Decode random byte received --> ${msg[i]}');
                // print('kmsgx: Decode random byte received --> ${msg[i]}');
              }
            }
            break;

          case _kmsgxRxState.lengthSearching: // looking for Length file
            _kmsgxLength = msg[i];
            _kmsgxPresentRxState = _kmsgxRxState.dataCollecting;
            break;

          case _kmsgxRxState.dataCollecting: // collecting msg data bytes
            _kmsgxLengthCollected++;
            _kmsgxDataCollected.add(msg[i]); // add this data byte
            if (_kmsgxLengthCollected == _kmsgxLength) {
              // We have collected proper number of bytes. Next byte is checksum
              _kmsgxPresentRxState = _kmsgxRxState.checksumSearching;
            } else {}
            break;

          case _kmsgxRxState.checksumSearching: // looking for checksum
            // Calculate expected checksum
            int expectedChecksum = msg[i];
            _kmsgxDataCollected.forEach((value) {
              expectedChecksum += value;
            });
            // Limit expectedChecksum to byte value.
            expectedChecksum &= 0xff;
            // If kmsgx packet is good, 'expectedChecksum' value should be 0

            // Obtain  list from _kmsgDataCollected
            var kmsgxAdd = Uint8List.fromList(_kmsgxDataCollected);

            // Now we can safely reset the receive handler state machine ...
            _kmsgxRxReset();
            if (expectedChecksum == 0) {
              // Now add this to the Uint8List stream controller.
              // KmsgxPktLogger.log.info('Received data: $kmsgxAdd');
              // print('Received data: $kmsgxAdd');
              rxStreamController?.add(kmsgxAdd);
            } else {
              // KmsgxPktLogger.log.warning('kmsgx: Receive Packet decoding: Bad checksum: $expectedChecksum');
              // print(
              //     'kmsgx: Receive Packet decoding: Bad checksum: $expectedChecksum');
            }
            break;

          default:
            break;
        }
      }
      // If here, we have finished processing all 'msg' bytes
      // print(_kmsgxPresentRxState);
      // If we are in middle of a kmsgx packet reception then start the kmsgx expiry timer.
      if ((_kmsgxPresentRxState != _kmsgxRxState.sohSearching)) {
        _kmsgxTimerStart(true);
      }
      return null;
    }
  }
}
