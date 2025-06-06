<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

# _Example of how to use kmsgx transport_

This document outlines how to use **kmsgx transport** in application.

To use the **kmsgx transport** we need to initialize the class `KmsgxTransport` with passing `portClient` object for ex. UsbPortClient, BlePortClient etc..

Different use of methods has been shown to the below documents, below documents is example of how to use **kmsgx transport** and in this example it's using UsbPortClient.

## Description

This example project utilizes the following Dart packages:

- `port_usb_linux_mac`: This package provides USB serial port communication capabilities.
- `kmsgx`: A package used for message exchange between applications.
- `kmsgx_packetize`: A package used for packetizing and depacketizing messages.
- `kmsgx_app_xyz.pb.dart`: Protocol buffer generated file for the XYZ application.
- `kmsgx_app_xyz.pbenum.dart`: Enum definitions for the XYZ application.
- `kmsgx_packages.pb.dart`: Protocol buffer generated file for packages.
- `kmsgx_packages.pbenum.dart`: Enum definitions for packages.

```dart
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:port_usb_linux_mac/port_usb_linux_mac.dart';

import 'package:kmsgx/kmsgx.dart';
import 'package:kmsgx/kmsgx_packetize.dart';

import 'package:kmsgx_xyz/kmsgx_app_xyz.pb.dart';
import 'package:kmsgx_xyz/kmsgx_app_xyz.pbenum.dart' as kmsgx_e_app_xyz;

import 'package:kmsgx_xyz/kmsgx_packages.pb.dart';
import 'package:kmsgx_xyz/kmsgx_packages.pbenum.dart' as kmsgx_e_packages_xyz;
```

Here we will declare oour main function and will write the further use of kmsgx transport inside this function.

```dart
void main(List<String> arguments) async {
```

`Completer<void> usbClientCompleter = Completer();` is creating a `Completer` object that is used to signal when a USB client connection has been established. The `Completer` class is a utility class in Dart that provides a way to create a `Future` object and complete it later with a value or an error. In this case, the `Completer` object is used to create a `Future` that resolves when data is received from the USB connection. The `void` type parameter indicates that the `Future` does not return a value.

```dart
Completer<void> usbClientCompleter = Completer();
```

This is initializing a new instance of the `UsbPortClient` class. It is used to establish a connection to a USB serial port device with the specified name (`/dev/cu.usbserial-FTFNY1I8` in this case). The `await` keyword is used because the `UsbPortClient.init()` method is asynchronous and returns a `Future` object that resolves to the `UsbPortClient` instance once the connection is established.

```dart
UsbPortClient usbPortClient = await UsbPortClient.init(
   name: '/dev/cu.usbserial-FTFNY1I8',
// name: '/dev/tty.usbmodem212301', // example of another usb-port name.
);
```

It is creating a `StreamController` object that will be used to listen to events related to the USB connection. The `usbPortClient.connect()` method returns a stream of events related to the USB connection, such as data received or connection status changes. The `StreamController` object is used to manage the stream of events and provide a way to listen to those events.

```dart
StreamController<UsbPortEvent> usbPortClientStreamController = usbPortClient.connect();
```

This code block is listening to events from the `usbPortClientStreamController` stream, which receives events related to the USB connection. It checks the type of each event and takes appropriate action based on the event type.

```dart
usbPortClientStreamController.stream.listen((event) {
  if (event is SerialDataReceived) {
  } else if (event is ConnectionSuccessful) {
    usbPortClient.sendData(Uint8List.fromList(("bypass\r\n").codeUnits));
    if (!usbClientCompleter.isCompleted) usbClientCompleter.complete(); // here it'll complete the usbClientCompleter on ConnectionSuccessful
    print("Connection successful during connect....");
  } else if (event is DeviceRemoved) {
    print("Device removed...");
  } else if (event is ConnectionRejected) {
    print("Connection rejected during connect....");
    usbClientCompleter
        .completeError("Connection rejected during connect....");
  } else if (event is DeviceDisconnected) {
    print("Device disconnected during connect....");
  } else {
    usbClientCompleter
        .completeError("Unknown event/error during connect....");
    print("Unknown event/error during connect....");
  }
});
```

This is waiting for the `usbClientCompleter` completer to complete, which happens when ConnectionSuccessful event is received from the USB connection. It then applies a timeout of 5 seconds using the `timeout` method. If the future does not complete within 5 seconds, it will throw a `TimeoutException`. The `onError` method is used to handle any errors that occur during the execution of the future. If an error occurs, it will print an error message and exit the program with a status code of 1.

```dart
await usbClientCompleter.future
    .timeout(const Duration(seconds: 5))
    .onError((error, stackTrace) {
  print("Error from completer : $error");
  exit(1);
});
```

This is creating an instance of the `KmsgxPacketize` class and assigning it to the variable `kmsgxPacketize`. This allows the use of the methods and properties defined in the `KmsgxPacketize` class.

```dart
KmsgxPacketize kmsgxPacketize = KmsgxPacketize();
```

Another use of KmsgxPacketize with timeout parameter.

```dart
KmsgxPacketize _kmsgxPacketize = KmsgxPacketize(kmsgxPacketTimeoutDuration: Duration(milliseconds: 500));
```

This is creating an instance of the `KmsgxTransport` class with the following parameters:

- `transport`: an object of a class that implements the `Transport` interface, which is used to
  send and receive data.
- `transportStreamController`: a `StreamController` object that is used to handle the stream of
  data received from the transport.
- `transportPacketizer`: a function that takes a `Uint8List` and returns a `Uint8List`, which
  is used to split the data into packets.
- `timeOut`: a `Duration` object that specifies the timeout for the transport.

```dart
final usbAdapter = KmsgxTransport(
    transport: usbPortClient,
    transportStreamController: usbPortClientStreamController,
    transportPacketizer: kmsgxPacketize.kmsgxPacket,
    timeOut: Duration(seconds: 5));
```

This is simple example of `KmsgxTransport` without transportPacketizer and timeOut parameters.

```dart
final usbAdapter2 = KmsgxTransport(
  transport: usbPortClient,
  transportStreamController: usbPortClientStreamController,
);
```

`usbAdapter.addPackageLookUp` is adding a lookup table for a specific package, service, and request type. In this case, it is adding a lookup table for the `KMSGX_APP_HOST_ADAPTER` package, `e_Request` service, and all the values of the `e_Request` enum. This lookup table will be used later to map the request type to its corresponding value when sending a request over the USB connection.

```dart
usbAdapter.addPackageLookUp(kmsgx_e_packages_xyz.e_PACKAGES.KMSGX_APP_HOST_ADAPTER,
    kmsgx_e_app_xyz.e_Request, kmsgx_e_app_xyz.e_Request.values);

usbAdapter.addPackageLookUp(kmsgx_e_packages_xyz.e_PACKAGES.KMSGX_APP_HOST_ADAPTER,
    kmsgx_e_app_xyz.e_EVENT, kmsgx_e_app_xyz.e_EVENT.values);
```

`final usbAdapterSrc1Dst2 = usbAdapter.srcDst(src: 48, dst: 16);` is creating a new instance of the `KmsgxTransport` class with the `src` and `dst` parameters set to `48` and `16`, respectively. This new instance is used to send messages over the USB connection with the specified source and destination addresses. The `srcDst` method is a convenience method provided by the `KmsgxTransport` class to create a new instance with the `src` and `dst` parameters set.

```dart
final usbAdapterSrc1Dst2 = usbAdapter.srcDst(src: 48, dst: 16);
```

This is creating an instance of a request for configuring a tone generator. It sets the configuration parameters for generating a tone with a frequency of 1200 Hz, amplitude of -10.5 dBV, duration of 200 ms, slope time of 40 ms, and off time of 200 ms. The tone will be generated on the left channel and will be repeated 3 times.

```dart
Request_ToneGenCfg toneGenCfgRequest = Request_ToneGenCfg.create();
toneGenCfgRequest.channels = e_TONE_GEN_CHANNELS.LEFT;
toneGenCfgRequest.amplitude = -10.5;
toneGenCfgRequest.amplitudeUnits = e_TONE_AMPLITUDE_UNITS.DBV;
toneGenCfgRequest.toneFreqHz = 1200;
toneGenCfgRequest.toneTimeMs = 200;
toneGenCfgRequest.toneSlopeTimeMs = 40;
toneGenCfgRequest.toneOffTimeMs = 200;
toneGenCfgRequest.count = 3;
```

## **Different UseCase of kmsgxRequestReply method.**

`Example of easy syntax of using kmsgxRequestReply method.`
This is using the `await` keyword to asynchronously send a request `toneGenCfgRequest` to a USB adapter `usbAdapterSrc1Dst2` and receive a reply `sampleReqReply`. The `kmsgxRequestReply` method is used to send the request and wait for the reply. The reply is then printed to the console using `print` statement. The `dynamic` keyword is used to indicate that the type of the reply can be any type. Since replyTimeout is not passed in parameters it'll take by default timeout value.

```dart
dynamic sampleReqReply =
    await usbAdapterSrc1Dst2.kmsgxRequestReply(toneGenCfgRequest);
print("\nsampleReqReply :: $sampleReqReply\n");
```

`Example of complex syntax of using kmsgxRequestReply method.`
This is using the `kmsgxRequestReply` method of the `usbAdapterSrc1Dst2` object to send a request of type `Request_ToneGenCfg` with a timeout of 10 seconds. It then waits for a reply and prints it to the console if it receives one. If an error occurs, it prints the error message to the console.

```dart
await usbAdapterSrc1Dst2
    .kmsgxRequestReply<Request_ToneGenCfg>(toneGenCfgRequest,
        replyTimeout: Duration(seconds: 10))
    .then((reply) => print("Reply is : $reply"),
        onError: (e) => print("Error on Reply is : $e"));
```

## **Listening events using kmsgxEventListen method.**

`Example of easy syntax of using kmsgxEventListen method.`
This is listening to events of type `Event_BatteryReport` from a `usbAdapterSrc1Dst2` object and printing out information about the battery report when an event is received. The information printed includes the battery voltage in millivolts, the battery percentage, and the charging state.
This example will keep listening for event forever, since we've not passed any cancelTimeout.

```dart
usbAdapterSrc1Dst2
    .kmsgxEventListen(Event_BatteryReport())
    .stream
    .listen((event) {
  print("\nEvent Battery Report ${event.batteryMV}");
  print("Event Battery Report ${event.batteryPercentage}");
  print("Event Battery Report ${event.chargeState}");
});
```

`Example of easy syntax of using kmsgxEventListen method`
This example will wait for 30 seconds if no event received then it will receive timeout error. If it gets events before 30 seconds then it'll move on to next line.

```dart
usbAdapterSrc1Dst2
    .kmsgxEventListen(Event_BatteryReport(),
        cancelTimeout: Duration(seconds: 30))
    .stream
    .listen((event) {
  print("\nEvent Battery Report ${event.batteryMV}");
  print("Event Battery Report ${event.batteryPercentage}");
  print("Event Battery Report ${event.chargeState}");
});
```

`Example of easy syntax of using kmsgxEventListen method`
This example will keep listening for events forever. because cancelTimeout is not passed in parameters.

```dart
usbAdapterSrc1Dst2
    .kmsgxEventListen(Event_BatteryReport())
    .stream
    .listen((event) {
  print("\nEvent Battery Report ${event.batteryMV}");
  print("Event Battery Report ${event.batteryPercentage}");
  print("Event Battery Report ${event.chargeState}");
});
```

This is listening to an event of type `Event_BatteryReport` using the `kmsgxEventListen` method from the `usbAdapterSrc1Dst2` object. It sets a timeout of 10 minutes for the event to be cancelled if it doesn't occur. Once the event is received, it prints the battery report information to the console and close the stream.

```dart
usbAdapterSrc1Dst2
    .kmsgxEventListen<Event_BatteryReport>(Event_BatteryReport(),
        cancelTimeout: Duration(minutes: 10))
    .stream
    .listen((batteryReport) {
  print("Battery Report is ..... $batteryReport");
});
```

`Example of complex syntax of using kmsgxEventListen method.`
This is creating a `StreamController` that listens for events of type `Event_BatteryReport` from a USB adapter. It sets a timeout of 45 seconds for the subscription to be cancelled if no events are received. and it'll shutdown the stream if a event received before 45 seconds. as cancelTimeout is passed, it'll wait to get only 1st event and then it'll close the stream. if cancelTimeout is not passed then it'll keep listening for events forever. You can manually close the stream by calling `batteryReportSubscription.close()` (please refer to the below code for more details).

```dart
StreamController<Event_BatteryReport> batteryReportSubscription =
    usbAdapterSrc1Dst2.kmsgxEventListen<Event_BatteryReport>(
        Event_BatteryReport(),
        cancelTimeout: Duration(seconds: 45));
```

This is setting up a listener for a stream of battery reports. Whenever a new battery report is received, the listener will print the report to the console. If there is an error while listening to the stream, the error message will be printed to the console. If the stream is closed, the listener will print a message indicating that it has been closed.

```dart
batteryReportSubscription.stream.listen(
  (Event_BatteryReport batteryReport) {
    print("Battery Report is  : ${batteryReport.toString()}");
  },
  onError: (error) {
    print("Error while listening event for Battery Report is : $error");
  },
  cancelOnError: true,
  onDone: () => print("Battery Report Listener is closed"),
);
```

This is using the `Future.delayed` method to create a delayed future that will resolve after 10 minutes. Once the future resolves, the `then` method is called with a callback function that will close a `batteryReportSubscription`. batteryReportSubscription.close() will close the stream which was listening to the event of <Event_BatteryReport> it'll not shutdown the main transport stream.

```dart
await Future.delayed(Duration(minutes: 10));
batteryReportSubscription.close();
```

This is using the `Future.delayed` method to delay the execution of the next line of code for 10 minutes. After the delay, it will execute the next line of code which is closing a `StreamController` named `usbPortClientStreamController`. This usbPortClientStreamController.close() close the main transport stream and all the other streams which are listening to this stream inside the kmsgxTransport class will be closed.

```dart
await Future.delayed(Duration(minutes: 10));
usbPortClientStreamController.close();
```

}

================================================================================
================================================================================
## Note:
To generated the latest proto dart generated classes
Use common json & script
`proto_generate_all.json` & `proto_generate_all.ps1`

# we are no longer storing the any proto generated dart classes in repository
