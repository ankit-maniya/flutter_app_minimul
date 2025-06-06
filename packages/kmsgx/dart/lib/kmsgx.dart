library kmsgx;

import 'dart:async';
import 'dart:collection';
import 'dart:typed_data';
import 'package:protobuf/protobuf.dart' as $pb;

import 'package:kmsgx/kmsgx_common.pbenum.dart';

/// Kmsgx request will be list of bytes and it'll be at least 5 which includes [flag, src, dst, service, id, data (optional) ]
/// e_POSITION enum has 6 values FLAG, SRC, DST, PACKAGE, ID, STATUS, but request does not have status so we will have 5 values
/// which represents the Kmsgx request length , so we will use e_POSITION.values.length - 1
final int KMSGX_REQUEST_LENGTH = e_POSITION.values.length - 1;

/// Kmsgx reply will be list of bytes and it'll be at least 6 which includes [flag, dst, src, service, id, status, data (optional) ]
/// e_POSITION enum has 6 values FLAG, SRC, DST, PACKAGE, ID, STATUS, which represents the Kmsgx reply length
final int KMSGX_REPLY_LENGTH = e_POSITION.values.length;

/// Kmsgx event will be list of bytes and it'll be at least 5 which includes [flag, src, dst, service, id, data (optional) ]
/// e_POSITION enum has 6 values FLAG, SRC, DST, PACKAGE, ID, STATUS, but event does not have status so we will have 5 values
/// which represents the Kmsgx event length , so we will use e_POSITION.values.length - 1
final int KMSGX_EVENT_LENGTH = e_POSITION.values.length - 1;

const int a = 7;

class KmsgxTransport<T> {
  final Duration timeOut;
  final dynamic transport;

  /// This is defining a function named `transportPacketizer` that takes in three parameters:
  /// `msg` of type `Uint8List`, `isSending` of type `bool`, and an optional `rxStreamController` of type
  /// `StreamController<Uint8List>`. The function returns a nullable function that takes in the same
  /// parameters and returns a `Uint8List` or null. The purpose of this function is to handle the
  /// packetization of data for transport over the communication medium.
  final Uint8List? Function(Uint8List msg, bool isSending,
      [StreamController<Uint8List>? streamController])? transportPacketizer;

  /// This is defining a class `KmsgxTransport` with four parameters: `timeOut`,
  /// `transportPacketizer`, `transport`
  KmsgxTransport({
    this.timeOut =
        const Duration(milliseconds: 1000), // default timeout is 1000ms
    this.transportPacketizer,
    required this.transport,
  });

  final Map _packagesId = HashMap<String, int>();
  final Map _packagesReqEvnt = HashMap<String, int>();

  /// This function adds package and request event information to two separate hashmaps.
  ///
  /// Args:
  ///   package (dynamic): The package parameter is a dynamic variable that represents a package object.
  ///   reqEvt (dynamic): It is a dynamic variable representing the required event.
  ///   reqEvtValue (dynamic): reqEvtValue is a dynamic variable that contains a list of elements. The
  /// function iterates through this list and creates a lookup key for each element based on the package
  /// name, element name, and the value of reqEvt. It then adds this key-value pair to the
  /// packagesReqEvnt hashmap.
  /// Note: here we had to add an extra parameter called `reqEvtValue` to get the class members because,
  ///      from the paramtere `reqEvt` we can't access the memeber which are defined in the class reqEvt.
  addPackageLookUp(
    dynamic package,
    dynamic reqEvtValue,
  ) {
    try {
      /// Extracts `packageRunTimeType` from the proto file.
      ///
      /// **Example:**
      /// `"e_PACKAGES"`
      String packageRunTimeType = package.runtimeType.toString();

      /// Extracts `packageName` from the proto file.
      ///
      /// **Example:**
      /// kmsgxPkgBis
      String packageName = package.name.toString();

      /// Regex to identify a specific string pattern.
      ///
      /// **Example:**
      /// `List<e_Request>`
      RegExp regExp = RegExp(r'<(.+?)>');
      Match? match = regExp.firstMatch(reqEvtValue.runtimeType.toString());

      /// Extracts the inner value from brackets.
      ///
      /// **Example:**
      /// Input: `List<e_Request>`
      /// Output: `e_Request`
      String reqEvtClassName = match!.group(1)!;

      /// Checks if the "package" and one of the `[request/reply/event]` class names are available
      /// before using this function.
      if (packageRunTimeType != 'e_PACKAGES') {
        throw Exception(
            "addPackageLookUp() : The package class name must be e_PACKAGES, errorCode : ${e_STATUS.NOT_SUPPORTED.value}");
      } else if (reqEvtClassName != 'e_Request' &&
          reqEvtClassName != 'e_Reply' &&
          reqEvtClassName != 'e_Event') {
        throw Exception(
            "addPackageLookUp() : The request/reply/event class must be e_REQUEST, e_REPLY, or e_EVENT, errorCode: ${e_STATUS.NOT_SUPPORTED.value}");
      }

      /// Formats the `reqEvtClassName` into a specified format for storage in the `_packagesId` map.
      ///
      /// - The `reqEvtClassName` is modified by removing the `"e_"` prefix if present.
      ///
      /// **Example:**
      /// "e_Reply" → "Reply"
      ///
      reqEvtClassName = reqEvtClassName.split('e_')[1];

      // Below will return the integer value of package from proto sequence number
      int packageValue = package.value;

      /// Checks if the `_packagesId` map does not already contain the key `packageName`.
      ///
      /// - If the key does not exist, a new key-value pair is added where:
      ///   - **Key**: `packageName`
      ///   - **Value**: `packageValue`
      ///
      /// **Example:**
      /// _packagesId = {
      ///   "protobuf packageName": sequenceIdFromProto
      /// };
      ///
      if (!_packagesId.containsKey(packageName)) {
        _packagesId[packageName] = packageValue;
      }

      /// Iterates through a list of elements and creates a key-value pair for each element.
      ///
      /// - **Key**: A string generated by concatenating the package name, element name, and class name.
      /// - **Value**: An integer assigned to the element.
      /// - If the key does not already exist in the `_packagesReqEvnt` map,
      ///   the key-value pair is added to the map.
      reqEvtValue.forEach((element) {
        /// Creates a string variable `reqEvtKey` by concatenating the `packageName`,
        /// `reqEvtClassName`, and `element.name` with underscores in between.
        ///
        /// - `element.name` represents the actual enum name.
        /// - Syntax for the protobuf message: `[protobuf message]`
        ///   - Example: `"Reply_DatabaseRecord"`, `"NoneRequest"`
        ///
        /// The final `reqEvtKey` will follow this syntax:
        /// - `[protobuf package].[protobuf type]_[protobuf message]`
        ///   - Example: `kmsgxPkgBis.Request_NoneRequest`

        String reqEvtKey =
            "$packageName.${reqEvtClassName}_${element.name.toString()}";

        // below will return the integer value of element
        int reqEvtVal = element.value;

        if (!_packagesReqEvnt.containsKey(reqEvtKey)) {
          /// `_kmsgxTransport._packagesReqEvnt` will have the following structure:
          ///
          /// - Syntax: `{ [protobuf package].[protobuf message]: [sequence id from proto] }`
          /// - Example:
          ///   {
          ///     kmsgxPkgBis.Request_Reply_DatabaseRecord: 0,
          ///     kmsgxPkgBis.Request_EventMask: 1
          ///   }
          ///
          _packagesReqEvnt[reqEvtKey] = reqEvtVal;
        }
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  /// The function returns a SourceDst object with the given source and destination integers and a
  /// reference to the current kmsgxTransport object.
  ///
  /// Args:
  ///   src (int): "src" is an integer parameter that represents the source of a message or data. It is
  /// used in the context of a communication system where data is transmitted from one point to another.
  ///   dst (int): dst is a required integer parameter that represents the destination of a message or
  /// data being transported. It is used in the creation of a SourceDst object, which is used for
  /// transporting data using the kmsgxTransport.
  ///
  /// Returns:
  ///   A `SourceDst` object is being returned, which is created using the `SourceDst` constructor and
  /// initialized with the `src`, `dst`, and `kmsgxTransport` values.
  SourceDst srcDst({required int src, required int dst}) {
    return SourceDst(
      src: src,
      dst: dst,
      kmsgxTransport: this,
    );
  }

  /// If the transportPacketizer function is not null, the function encodes the data using the transportPacketizer function.
  /// and then sends the data using the transport object.
  ///
  /// Args:
  ///   requestData (Uint8List): A Uint8List containing the data to be sent over the transport layer.
  void _sendData(Uint8List requestData) {
    late Uint8List? data;
    if (transportPacketizer != null) {
      data = transportPacketizer!(requestData, true);
    } else {
      data = requestData;
    }

    // txDataStreamController is a stream controller and it receives the data type of Uint8List
    transport.txDataStreamController().add(data);
  }

  /// This function listens to a stream of data, decodes it using a packetizer function, and adds the
  /// decoded data to a clone of the original stream.
  ///
  /// Returns:
  ///   The stream called `rxDataStreamController` returns a event as `Stream<T>`.
  Stream<T> _transportStream() {
    final StreamController<T> transportStreamClone = StreamController();

    /// This is listening to a stream of data (from a serial port) and decoding it
    /// using a packetizer function. If the packetizer function is not null, it is used to decode the
    /// data and the decoded data is sent to a data receiver controller. The decoded data is then
    /// added to a clone of the original stream. If the packetizer function is null,
    /// the original event is added to the clone stream without decoding.
    StreamSubscription<dynamic>? transportStreamSubscription;
    StreamSubscription<Uint8List>? transportPacketStreamSubscription;
    StreamController<Uint8List>? transportPacketStreamController =
        StreamController();
    transportStreamSubscription =
        transport.rxDataStreamController().stream.listen((eventData) {
      if (eventData is Uint8List) {
        print("KmsgX received data : $eventData");
        Uint8List encodedData = eventData;
        if (transportPacketizer != null) {
          transportPacketizer!(
            encodedData,
            false,
            transportPacketStreamController,
          );
          transportPacketStreamSubscription =
              transportPacketStreamController.stream.listen((pkt) {
            if (pkt != null) {
              Uint8List pktData = pkt;
              transportStreamClone.add(pktData as T);
            }
          });
        } else {
          transportStreamClone.add(eventData as T);
        }
      } else {
        transportStreamClone.add(eventData);
      }
      if (transportStreamSubscription != null) {
        transportStreamSubscription
            ?.cancel(); // Cancel the subscription after the first event
        transportStreamSubscription = null; // Reset the subscription to null
      }
    });
    return transportStreamClone.stream;
  }

  /// This function creates a stream controller that listens to a transport stream and uses a packetizer
  /// to split the data into packets before adding it to a clone of the transport stream.
  ///
  /// Returns:
  ///   A StreamController of type T is being returned.
  StreamController<T> _transportStreamController() {
    final StreamController<T> transportStreamClone = StreamController();
    StreamSubscription<Uint8List>? transportPacketStreamSubscription;
    StreamController<Uint8List>? transportPacketStreamController =
        StreamController<Uint8List>.broadcast();

    /// This is listening to a stream of events from a transport stream controller. If the
    /// event is of type `Uint8List`, it extracts the encoded data from the event and passes it
    /// to a `transportPacketizer` function along with a `transportPacketStreamController`. It then
    /// listens to the `transportPacketStreamController` for packets of data and adds them to a
    /// `transportStreamClone`. If the event is not of type `Uint8List`, it simply adds the
    /// event to the `transportStreamClone`.
    transport.rxDataStreamController().stream.listen((eventData) {
      print("Looking for event message!");
      if (eventData is Uint8List) {
        Uint8List encodedData = eventData;
        if (transportPacketizer != null) {
          transportPacketizer!(
            encodedData,
            false,
            transportPacketStreamController,
          );
          transportPacketStreamSubscription =
              transportPacketStreamController.stream.listen((pkt) {
            if (pkt != null) {
              Uint8List pktData = pkt;
              if (!transportStreamClone.isClosed) {
                transportStreamClone.add(pktData as T);
                transportPacketStreamSubscription?.cancel();
              }
            }
          });
        } else {
          if (!transportStreamClone.isClosed) {
            transportStreamClone.add(eventData as T);
          }
        }
      } else {
        if (!transportStreamClone.isClosed) {
          transportStreamClone.add(eventData);
        }
      }
    });
    return transportStreamClone;
  }
}

class SourceDst {
  final int _src;
  final int _dst;
  final KmsgxTransport _kmsgxTransport;

  SourceDst({
    required int src,
    required int dst,
    required KmsgxTransport kmsgxTransport,
  })  : _src = src,
        _dst = dst,
        _kmsgxTransport = kmsgxTransport;

  Future<Uint8List> _sendDataWaitReply(
      Uint8List requestData, int packageId, int reqId,
      {Duration? replyTimeout}) async {
    try {
      StreamController<Uint8List> completeUint8ListDataStreamController =
          StreamController<Uint8List>.broadcast();
      StreamSubscription<dynamic>? transportStreamSubscription;

      // we have removed async from _sendData function as now it will send requestData in stream.
      // our stream is syncronous.
      _kmsgxTransport._sendData(requestData);

      replyTimeout ??= _kmsgxTransport.timeOut;

      /// This is creating a `Timer` object named `replyTimeoutTimer` that will execute the
      /// function passed as the first argument (`replyTimeout`) after a certain amount of time has
      /// elapsed. The function passed to the `Timer` constructor will add an error to a
      /// `StreamController` named `completeUint8ListDataStreamController` if it has not been closed
      /// before the timer expires. Specifically, it will add a `TimeoutException` with the message "Did
      /// not receive a reply in time."
      Timer replyTimeoutTimer = Timer(replyTimeout, () {
        if (!completeUint8ListDataStreamController.isClosed) {
          completeUint8ListDataStreamController.addError(TimeoutException(
              'Did not receive a reply in time, errorCode: ${e_STATUS.TIMEOUT_OPERATION.value}'));
        }
      });

      /// The function cancels an active timer for a reply timeout.
      void cancelTimeout() {
        if (replyTimeoutTimer.isActive) {
          replyTimeoutTimer.cancel();
        }
      }

      transportStreamSubscription = _kmsgxTransport.transport
          .rxDataStreamController()
          .stream
          .listen((eventData) {
        if (eventData is Uint8List) {
          Uint8List receivedData = eventData;
          List<String> failedConditions = [];

          print("Listener received data : $receivedData");
          if (receivedData[e_POSITION.FLAG.value] == e_FLAG.TYPE_REPLY.value &&
              receivedData[e_POSITION.STATUS.value] != e_STATUS.OK.value) {
            print(
                "Listener received data with wrong flag and status : $receivedData");
          }

          /// This is checking if the received data is a reply to a request, and if it
          /// meets certain conditions such as having the correct source and destination addresses,
          /// package ID, message ID, and status. If the conditions are met, it sends the received data
          /// to a data stream controller. If the conditions are not met, it adds error messages to a
          /// list of failed conditions. It also cancels a timeout and a subscription to a transport
          /// stream.
          if (receivedData[e_POSITION.FLAG.value] == e_FLAG.TYPE_REPLY.value) {
            bool isValid = true;

            if (receivedData.isNotEmpty &&
                receivedData.length >= KMSGX_REPLY_LENGTH &&
                receivedData[e_POSITION.SRC.value] == _dst &&
                receivedData[e_POSITION.DST.value] == _src &&
                receivedData[e_POSITION.PACKAGE.value] == packageId &&
                receivedData[e_POSITION.ID.value] == reqId &&
                receivedData[e_POSITION.STATUS.value] == e_STATUS.OK.value) {
              if (receivedData.length > KMSGX_REPLY_LENGTH) {
                completeUint8ListDataStreamController
                    .add(receivedData.sublist(KMSGX_REPLY_LENGTH));
              } else if (receivedData.length == KMSGX_REPLY_LENGTH) {
                completeUint8ListDataStreamController.add(Uint8List(0));
              } else {
                completeUint8ListDataStreamController.addError(TimeoutException(
                    "Didn't get the full data in time, errorCode: ${e_STATUS.TIMEOUT_OPERATION.value}"));
              }
            } else {
              isValid = false;

              if (receivedData.isEmpty) {
                failedConditions.add(
                    'receivedData is empty, errorCode: ${e_STATUS.NULL_POINTER.value}');
              }
              if (receivedData.length < KMSGX_REPLY_LENGTH) {
                failedConditions.add(
                    'receivedData length is less than e_POSITION.values length, errorCode: ${e_STATUS.INVALID_LENGTH.value}');
              }

              if (receivedData[e_POSITION.SRC.value] != _dst) {
                failedConditions.add(
                    'Received SRC(${receivedData[e_POSITION.SRC.value]}) is not equal to $_dst, errorCode: ${e_STATUS.INVALID_CONTENTS.value}');
              }
              if (receivedData[e_POSITION.DST.value] != _src) {
                failedConditions.add(
                    'Received DST(${receivedData[e_POSITION.DST.value]}) is not equal to $_src, errorCode: ${e_STATUS.INVALID_CONTENTS.value}');
              }
              if (receivedData[e_POSITION.PACKAGE.value] != packageId) {
                failedConditions.add(
                    'Received PackageID(${receivedData[e_POSITION.PACKAGE.value]}) is not equal to $packageId, errorCode: ${e_STATUS.AUTHENTICATION_FAILED.value}');
              }
              if (receivedData[e_POSITION.ID.value] != reqId) {
                failedConditions.add(
                    'Received MsgID(${receivedData[e_POSITION.ID.value]}) is not equal to $reqId, errorCode: ${e_STATUS.INVALID_REQ_EVT_ID.value}');
              }
              if (receivedData[e_POSITION.STATUS.value] != e_STATUS.OK.value) {
                failedConditions.add(
                    'Received STATUS(${receivedData[e_POSITION.STATUS.value]}) is not equal to OK (${e_STATUS.OK.value}) , errorCode: ${receivedData[e_POSITION.STATUS.value]} ${e_STATUS.valueOf(receivedData[e_POSITION.STATUS.value])}');
              }
            }

            // will this cause to Future to exit? possible risk that timer will not be cancelled
            if (!isValid) {
              print(
                  "TYPE_REPLY Validation failed. Reason: \n $failedConditions \n");
              completeUint8ListDataStreamController.addError(Exception(
                  "TYPE_REPLY Validation failed. Reason: \n $failedConditions \n"));
              // throw Exception("Validation failed. Reason: \n $failedConditions \n");
            }

            cancelTimeout();
            if (transportStreamSubscription != null) {
              transportStreamSubscription?.cancel();
              transportStreamSubscription = null;
            }
          } else {
            print("I am not a Reply ${receivedData.length}");
          }
        }
      });
      return completeUint8ListDataStreamController.stream.first;
    } catch (e) {
      /// runtype of e will be BlueZFailedException if the error is coming from BlueZ, when performing BLE operations
      throw Exception(
          "Error occurred while sending or receiving data to transport, error: $e");
    }
  }

  /// The `kmsgxRequestReply` function sends a request message over a transport connection and waits for
  /// a reply, then parses and returns the reply data.
  ///
  /// Args:
  ///   msgData (dynamic): The `msgData` parameter is a dynamic object that represents the message data
  /// to be sent over the transport connection. It contains information about the message, such as its
  /// qualified name and any data that needs to be serialized and sent with the message.
  ///   replyObj (T): `replyObj` is an optional parameter of type `T` that represents the
  /// expected reply message data. If provided, the reply message received from the server will be
  /// parsed and deserialized into an object of type `T` and returned by the `kmsgxRequestReply`
  /// function.
  ///   replyTimeout (Duration): `replyTimeout` is an optional parameter of type `Duration` that
  /// specifies the maximum amount of time to wait for a reply to the request message. If a reply
  /// is not received within this time, a timeout exception will be thrown. If `replyTimeout` is not
  /// provided, the default timeout value
  ///
  /// Returns:
  ///   a `Future<T>` object, where `T` is the type of the `replyObj` parameter passed to the
  /// function. The returned value is the parsed reply data received from the transport, which is of
  /// type `T`.
  Future<T> kmsgxRequestReply<T>(dynamic msgData,
      {T? replyObj, Duration? replyTimeout}) async {
    late int _packageId;
    late int _reqId;
    try {
      /// Below qualifiedMessageName will be in this format [porotbuf package].[protobuf message]
      /// ex: kmsgxPkgBis.Request_Reply_DatabaseRecord
      String qualifiedMessageName =
          msgData.info_.qualifiedMessageName.toString();

      /// following will get the [porotbuf package] name
      String packageName = qualifiedMessageName.split(".")[0];

      /// This is assigning values to the variables `packageId` and `reqEvntId` by getting it from the _kmsgxTransport's _packagesId and _packagesReqEvnt maps.
      /// This will look for the packageId & _reqId what ever sequence it is define in proto files
      /// ex: _kmsgxTransport._packagesId will have { [packageName]: [sequnce id from proto] }
      /// ex: _kmsgxTransport._packagesReqEvnt will have { [porotbuf package].[protobuf message]: [sequnce id from proto] }
      _packageId = _kmsgxTransport._packagesId[packageName];
      _reqId = _kmsgxTransport._packagesReqEvnt[qualifiedMessageName];

      /// debug statements
      /// print("\n$packageName: $_packageId");
      /// print("$qualifiedMessageName: $_reqId");
    } catch (e) {
      throw Exception(
          "Error occurred while getting packageId or reqEvntId: $e, errorCode: ${e_STATUS.INVALID_CONTENTS.value}");
    }

    /// This code is creating a `Uint8List` object named `transportRequestData` by concatenating
    /// several values into a single byte array. The values being concatenated are `flag`, `src`, `dst`,
    /// `serviceId`, `msgid`, and the serialized message data returned by the `_serializeMessage`
    /// function when passed the `msgData` parameter. The `...` operator is used to spread the serialized
    /// message data into the list of values being concatenated. The resulting `Uint8List` object
    /// represents the data that will be sent over the transport.
    Uint8List transportRequestData = Uint8List.fromList([
      e_FLAG.TYPE_REQUEST.value,
      _src,
      _dst,
      _packageId,
      _reqId,
      ..._serializeMessage(msgData),
    ]);

    Uint8List requestData = transportRequestData;

    /// This code is sending a request message over a transport connection and waiting for a reply. The
    /// reply is received as a byte array and is converted to an `UnmodifiableListView<int>` object named
    /// `replyData`. The `UnmodifiableListView` class is used to create a read-only view of the
    /// `replyData` list, which prevents the list from being modified accidentally.
    UnmodifiableListView<int> replyData = UnmodifiableListView<int>(
        await _sendDataWaitReply(requestData, _packageId, _reqId,
            replyTimeout: replyTimeout));

    /// here we are checking if replyObj is passed or not
    /// if it's not getting passed (which means bydefault it's dynamic) then we are making it to same type as msgData by creating empty instance of it
    if (T != dynamic && replyObj == null) {
      replyObj = msgData.createEmptyInstance();
    }
    return _kmsgxParse<T>(replyData, replyObj);
  }

  // This listens for kmsgx protobuf event message
  StreamController<T> kmsgxEventListen<T>(dynamic eventPbObj,
      {Duration? cancelTimeout}) {
    StreamController<T> eventStreamController = StreamController<T>();
    StreamController<dynamic> transportStreamController =
        _kmsgxTransport._transportStreamController();

    int eventCount = 0;

    StreamSubscription<dynamic>? timeoutSubscription;

    if (cancelTimeout != null) {
      timeoutSubscription =
          Stream<void>.periodic(cancelTimeout, (_) {}).take(1).listen((_) {
        transportStreamController.close();
        if (eventCount == 0) {
          eventStreamController.addError(TimeoutException(
              'No events received within the specified timeout, errorCode: ${e_STATUS.TIMEOUT_OPERATION.value}'));
        }
        eventStreamController.close();
      });
    }

    int packageId;
    int reqEvntId;

    /// This is trying to extract the package name and event ID from an object or
    /// function's qualified message name. It splits the qualified message name by "." to get the
    /// package name and then uses the package name to retrieve the corresponding package ID from a
    /// map. It also retrieves the event ID for the qualified message name from another map.
    /// If an error occurs during this process, it throws an exception with an error message. The
    /// extracted package ID and event ID are then printed to the console.
    try {
      // The only reason we have eventPbObj parameter is to extract the package ID and event ID
      // We had hope we could instanciate <T> but dart lanuguage does not allows us to do that
      // See https://github.com/dart-lang/sdk/issues/53130

      String qualifiedMessageName =
          eventPbObj.info_.qualifiedMessageName.toString();
      String packageName = qualifiedMessageName.split(".")[0];
      packageId = _kmsgxTransport._packagesId[packageName];
      reqEvntId = _kmsgxTransport._packagesReqEvnt[qualifiedMessageName];
      print("$packageName: $packageId");
      print("$qualifiedMessageName: $reqEvntId");
    } catch (e) {
      throw Exception(
          "Error occurred while getting packageId or reqEvntId: $e, errorCode: ${e_STATUS.INVALID_CONTENTS.value}");
    }

    /// This is setting up a stream pipeline to receive and process data from a USB port. It
    /// uses a `StreamTransformer` to handle incoming `UsbPortEvent` data, filters the data based on
    /// certain conditions, and then passes it through to an `eventStreamController` for further
    /// processing. The `asyncExpand` method is used to ensure that each event is processed in order,
    /// and the `takeWhile` method is used to keep the stream open until the `eventStreamController`
    /// is closed. Finally, the `listen` method is used to add the processed data to the `
    transportStreamController.stream
        .transform(StreamTransformer<dynamic, Uint8List>.fromHandlers(
            handleData: (eventData, sink) {
          if (eventData is Uint8List) {
            Uint8List receivedData = eventData;
            if (receivedData.isNotEmpty &&
                receivedData.length >= KMSGX_REPLY_LENGTH &&
                receivedData[e_POSITION.FLAG.value] ==
                    e_FLAG.TYPE_EVENT.value &&
                receivedData[e_POSITION.SRC.value] == _dst &&
                receivedData[e_POSITION.DST.value] == _src &&
                receivedData[e_POSITION.PACKAGE.value] == packageId &&
                receivedData[e_POSITION.ID.value] == reqEvntId) {
              eventCount++;
              // All conditions passed
              if (receivedData.length > KMSGX_EVENT_LENGTH) {
                sink.add(receivedData.sublist(KMSGX_EVENT_LENGTH));
              } else if (receivedData.length == KMSGX_EVENT_LENGTH) {
                sink.add(Uint8List(0)); // Empty data case
              }
            }
          }
        }))
        .asyncExpand((event) =>
            Stream.fromFuture(Future.delayed(Duration.zero, () => event)))
        .takeWhile((_) => !eventStreamController.isClosed)
        .listen((event) {
          eventStreamController.add(_kmsgxParse<T>(
              UnmodifiableListView(event), eventPbObj.createEmptyInstance()));
          if (cancelTimeout != null) {
            transportStreamController.close();
            eventStreamController.close();
          }
        }, onDone: () {
          timeoutSubscription?.cancel();
        });

    return eventStreamController;
  }
}

/// This function serializes a protobuf message into a byte buffer.
///
/// Args:
///   msg (dynamic): The `msg` parameter is a dynamic variable that can hold any type of data. However,
/// the function expects it to be an instance of a protobuf `GeneratedMessage` class. If it is not, the
/// function will throw an `ArgumentError`.
///
/// Returns:
///   The function `_serializeMessage` returns a `Uint8List` which is the protobuf message buffer format
/// of the input `msg`.
Uint8List _serializeMessage(dynamic msg) {
  if (msg is $pb.GeneratedMessage) {
    return msg
        .writeToBuffer(); // convert class message in to protobuf message buffer format
  } else {
    throw ArgumentError(
        'Invalid message type. Expected a protobuf GeneratedMessage, errorCode: ${e_STATUS.INVALID_PARAMETERS.value}');
  }
}

/// The function takes in a message in byte format and a buffer, and returns the buffer with the message
/// merged into it if it is a protobuf message, otherwise it throws an error.
///
/// Args:
///   msg (Uint8List): msg is an instance of Uint8List, which is an array of bytes representing a
/// message in binary format. This function is designed to parse this binary message and convert it into
/// a class message.
///   buffer (T): The `buffer` parameter is an optional parameter of generic type `T`. It is used to
/// specify the type of the message that the `msg` parameter should be parsed into. If `buffer` is not
/// provided or is `null`, the `msg` parameter is returned as is. `
///
/// Returns:
///   either the input `msg` as a dynamic type or a protobuf message buffer converted into a class
/// message of type `T`.
T _kmsgxParse<T>(UnmodifiableListView<int> msg, [T? buffer]) {
  if (buffer == null) {
    return msg as dynamic;
  } else {
    if (buffer is $pb.GeneratedMessage) {
      return buffer
        ..mergeFromBuffer(
            msg); // convert  protobuf message buffer format in to class message
    }
    throw ArgumentError.value(buffer,
        'Is not a protobuf buffer, errorCode: ${e_STATUS.NOT_SUPPORTED.value}');
  }
}
