import 'dart:isolate';
import 'dart:ui';

import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn_network_calls/Utility/db_helper.dart';

class AlarmManager extends StatefulWidget {
  AlarmManager({Key key}) : super(key: key);

  @override
  _AlarmManagerState createState() => _AlarmManagerState();
}

class _AlarmManagerState extends State<AlarmManager> {
  bool isRunning;
  final int helloAlarmID = 0;
  DateTime strt = DateTime(2020, 4, 19, 9, 25);
  ReceivePort port = ReceivePort();

  /// The name associated with the UI isolate's [SendPort].
  String isolateName = 'isolate';

  /// A port used to communicate from a background isolate to the UI isolate.
  final ReceivePort port1 = ReceivePort();
  static DBHelper dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = new DBHelper();
    print('DBHelper: ' + dbHelper.toString());
    initPlatformStateAlarm();
  }

  // The callback for our alarm
  static Future<void> callbackAlarm() async {
    print('Alarm fired!' + DateTime.now().toIso8601String());
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
