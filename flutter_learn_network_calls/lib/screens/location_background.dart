import 'dart:async';
import 'dart:isolate';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:background_locator/background_locator.dart';
import 'package:background_locator/location_dto.dart';
import 'package:background_locator/location_settings.dart';
import 'package:flutter_learn_network_calls/Utility/db_helper.dart';
import 'package:flutter_learn_network_calls/Utility/file_manager.dart';
import 'package:flutter_learn_network_calls/model/Location.dart';
import 'package:location_permissions/location_permissions.dart';

class LocationBackgrond extends StatefulWidget {
  LocationBackgrond({Key key}) : super(key: key);

  @override
  _LocationBackgrondState createState() => _LocationBackgrondState();
}

class _LocationBackgrondState extends State<LocationBackgrond> {
  ReceivePort port = ReceivePort();

  String logStr = '';
  bool isRunning;
  static LocationDto lastLocation;
  DateTime lastTimeLocation;
  static const String _isolateName = 'LocatorIsolate';
  static DBHelper dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = new DBHelper();
    print('DBHelper: ' + dbHelper.toString());
    if (IsolateNameServer.lookupPortByName(_isolateName) != null) {
      IsolateNameServer.removePortNameMapping(_isolateName);
    }

    IsolateNameServer.registerPortWithName(port.sendPort, _isolateName);

    port.listen(
      (dynamic data) async {
        await updateUI(data);
      },
    );
    initPlatformState();
  }

  static double dp(double val, int places) {
    double mod = pow(10.0, places);
    return ((val * mod).round().toDouble() / mod);
  }

  static String formatDateLog(DateTime date) {
    return date.hour.toString() +
        ":" +
        date.minute.toString() +
        ":" +
        date.second.toString();
  }

  static String formatLog(LocationDto locationDto) {
    return dp(locationDto.latitude, 4).toString() +
        " " +
        dp(locationDto.longitude, 4).toString();
  }

  static Future<void> setLog(LocationDto data) async {
    final date = DateTime.now();
    await FileManager.writeToLogFile(
        '${formatDateLog(date)} --> ${formatLog(data)}\n');
  }

  static Future<void> setDataToSQLite(LocationDto data) async {
    final date = DateTime.now();
    Location e =
        Location(data.latitude, data.longitude, date.toIso8601String(), 0);
    if (dbHelper == null) {
      print("db helper null");
      dbHelper = new DBHelper();
    }
    await dbHelper.addLocation(e);
  }

  Future<void> updateUI(LocationDto data) async {
    final log = await FileManager.readLogFile();
    setState(() {
      lastLocation = data;
      lastTimeLocation = DateTime.now();
      logStr = log;
    });
  }

  Future<void> initPlatformState() async {
    print('Initializing...');
    await BackgroundLocator.initialize();
    logStr = await FileManager.readLogFile();
    print('Initialization done');
    final _isRunning = await BackgroundLocator.isRegisterLocationUpdate();
    setState(() {
      isRunning = _isRunning;
    });
    print('Running ${isRunning.toString()}');
  }

  static void callback(LocationDto locationDto) async {
    print('location in dart: ${locationDto.toString()}');
    await setLog(locationDto);
    await setDataToSQLite(locationDto);
    final SendPort send = IsolateNameServer.lookupPortByName(_isolateName);
    send?.send(locationDto);
  }

  static void notificationCallback() {
    print('notificationCallback');
  }

  void _checkLocationPermission() async {
    final access = await LocationPermissions().checkPermissionStatus();
    switch (access) {
      case PermissionStatus.unknown:
      case PermissionStatus.denied:
      case PermissionStatus.restricted:
        final permission = await LocationPermissions().requestPermissions(
          permissionLevel: LocationPermissionLevel.locationAlways,
        );
        if (permission == PermissionStatus.granted) {
          _startLocator();
        } else {
          // show error
        }
        break;
      case PermissionStatus.granted:
        _startLocator();
        break;
    }
  }

  void _startLocator() {
    BackgroundLocator.registerLocationUpdate(
      callback,
      androidNotificationCallback: notificationCallback,
      settings: LocationSettings(
          notificationTitle: "Start Location Tracking example",
          notificationMsg: "Track location in background exapmle",
          wakeLockTime: 20,
          autoStop: false,
          interval: 10),
    );
    setState(() {
      isRunning = true;
    });
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text("Location Background"),
  //     ),
  //     body: Container(
  //       child: Column(
  //         children: <Widget>[
  //           FlatButton(
  //             child: Text("Register"),
  //             onPressed: () {
  //               BackgroundLocator.registerLocationUpdate(callback)
  //             },
  //           ),
  //           FlatButton(
  //             child: Text("Unregister"),
  //             onPressed: () {
  //               BackgroundLocator.unRegisterLocationUpdate();
  //             },
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final start = SizedBox(
      width: double.maxFinite,
      child: RaisedButton(
        child: Text('Start'),
        onPressed: () {
          _checkLocationPermission();
        },
      ),
    );
    final stop = SizedBox(
      width: double.maxFinite,
      child: RaisedButton(
        child: Text('Stop'),
        onPressed: () {
          BackgroundLocator.unRegisterLocationUpdate();
          setState(() {
            isRunning = false;
          });
        },
      ),
    );
    final clear = SizedBox(
      width: double.maxFinite,
      child: RaisedButton(
        child: Text('Clear Log'),
        onPressed: () {
          FileManager.clearLogFile();
          setState(() {
            logStr = '';
          });
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

    final log = Text(
      logStr,
    );

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter background Locator'),
        ),
        body: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.all(22),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[start, stop, clear, status, log],
            ),
          ),
        ),
      ),
    );
  }
}
