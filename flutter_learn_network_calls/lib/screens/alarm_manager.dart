import 'dart:isolate';
import 'dart:ui';

import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_learn_network_calls/screens/Call_back_operations.dart';
// import 'package:foreground_service/foreground_service.dart';

class AlarmManager extends StatefulWidget {
  AlarmManager({Key key}) : super(key: key);

  @override
  _AlarmManagerState createState() => _AlarmManagerState();
}

class _AlarmManagerState extends State<AlarmManager> {
  static const platform = const MethodChannel('alarm');
  bool isRunning;
  final int helloAlarmID = 0;
  DateTime strt = DateTime(2020, 4, 19, 9, 25);
  ReceivePort port = ReceivePort();

  /// The name associated with the UI isolate's [SendPort].
  String isolateName = 'isolate';

  /// A port used to communicate from a background isolate to the UI isolate.
  final ReceivePort port1 = ReceivePort();

  @override
  void initState() {
    super.initState();
    CallBackService.init();
    initPlatformStateAlarm();
  }

  // The callback for our alarm
  static Future<void> callbackAlarm() async {
    print('Alarm fired!' + DateTime.now().toIso8601String());
    // CallBackService.run();
    //check need for platform type
    //This is for android
    try {
      await platform.invokeMethod(
        'foregroundService',
      );
    } on PlatformException catch (e) {
      print("Failed to get battery level: '${e.message}'.");
    }
  }

  Future<void> initPlatformStateAlarm() async {
    print('Initializing...');
    // Register the UI isolate's SendPort to allow for communication from the
    // background isolate.
    IsolateNameServer.registerPortWithName(
      port.sendPort,
      isolateName,
    );

    AndroidAlarmManager.initialize();
    print('Initialization done');
  }

  void _runAlarmManager() async {
    // startAt: strt,
    print("starting alarm ...");
    await AndroidAlarmManager.periodic(
        const Duration(minutes: 1), helloAlarmID, callbackAlarm,
        exact: true, wakeup: true, rescheduleOnReboot: true);

    print("started alarm ...");

    setState(() {
      isRunning = true;
    });
  }

  void _stopAlarmManager() async {
    await AndroidAlarmManager.cancel(helloAlarmID);
    print("cancelled alarm");
    setState(() {
      isRunning = false;
    });
  }

  // //use an async method so we can await
  // static void maybeStartFGS() async {
  //   ///if the app was killed+relaunched, this function will be executed again
  //   ///but if the foreground service stayed alive,
  //   ///this does not need to be re-done
  //   if (!(await ForegroundService.foregroundServiceIsStarted())) {
  //     await ForegroundService.setServiceIntervalSeconds(5);

  //     //necessity of editMode is dubious (see function comments)
  //     await ForegroundService.notification.startEditMode();

  //     await ForegroundService.notification
  //         .setTitle("Example Title: ${DateTime.now()}");
  //     await ForegroundService.notification
  //         .setText("Example Text: ${DateTime.now()}");

  //     await ForegroundService.notification.finishEditMode();

  //     await ForegroundService.startForegroundService(foregroundServiceFunction);
  //     await ForegroundService.getWakeLock();
  //   }

  //   ///this exists solely in the main app/isolate,
  //   ///so needs to be redone after every app kill+relaunch
  //   await ForegroundService.setupIsolateCommunication((data) {
  //     debugPrint("main received: $data");
  //   });
  // }

  // static void foregroundServiceFunction() {
  //   debugPrint("The current time is: ${DateTime.now()}");
  //   ForegroundService.notification.setText("The time was: ${DateTime.now()}");

  //   if (!ForegroundService.isIsolateCommunicationSetup) {
  //     ForegroundService.setupIsolateCommunication((data) {
  //       debugPrint("bg isolate received: $data");
  //     });
  //   }

  //   ForegroundService.sendToPort("message from bg isolate");
  // }

  @override
  Widget build(BuildContext context) {
    final start = SizedBox(
      width: double.maxFinite,
      child: RaisedButton(
        child: Text('Start'),
        onPressed: () {
          _runAlarmManager();
        },
      ),
    );
    final stop = SizedBox(
      width: double.maxFinite,
      child: RaisedButton(
        child: Text('Stop'),
        onPressed: () {
          _stopAlarmManager();
        },
      ),
    );
    String msgStatus = "-";
    if (isRunning != null) {
      if (isRunning) {
        msgStatus = 'Is running';
      } else {
        msgStatus = 'Is not running';
      }
    }
    final status = Text("Status: $msgStatus");

    return Scaffold(
      appBar: AppBar(title: Text("Alarm Manager")),
      body: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.all(22),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              start,
              stop,
              status,
            ],
          ),
        ),
      ),
    );
  }
}
