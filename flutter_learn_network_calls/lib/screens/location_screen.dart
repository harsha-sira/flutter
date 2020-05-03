import 'package:flutter/material.dart';
import 'package:flutter_learn_network_calls/Utility/db_helper.dart';
import 'package:flutter_learn_network_calls/model/Location.dart';
import 'package:flutter_learn_network_calls/screens/alarm_manager.dart';
import 'package:flutter_learn_network_calls/screens/location_background.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  Future<List<Location>> locationsList;
  var dbHelper;

  double lontitude;
  double latitude;
  String dateTime = new DateTime.now().toIso8601String();
  int id;

  bool isUpdating = false;

  final formKey = new GlobalKey<FormState>();
  TextEditingController lontitudeController = TextEditingController();
  TextEditingController latitudeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
    isUpdating = false;
    refreshList();
  }

  clearName() {
    lontitudeController.text = '';
    latitudeController.text = '';
  }

  refreshList() {
    setState(() {
      locationsList = dbHelper.getLocations();
      debugPrint('location list' + locationsList.asStream().length.toString());
    });
  }

  validate() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      if (isUpdating) {
        Location e = Location.allVariable(id, lontitude, latitude, dateTime, 0);
        dbHelper.updateLocation(e);
        setState(() {
          isUpdating = false;
        });
      } else {
        Location e = Location(lontitude, latitude, dateTime, 0);
        debugPrint(e.toString());
        dbHelper.addLocation(e);
      }
      clearName();
      refreshList();
      FocusScope.of(context).unfocus();
    }
  }

  form() {
    return Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            TextFormField(
              controller: lontitudeController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: 'Lontitude'),
              onSaved: (val) {
                lontitude = double.parse(val);
                debugPrint(lontitude.toString());
                // FocusScope.of(context).unfocus();
              },
            ),
            TextFormField(
              controller: latitudeController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: 'Latitude'),
              onSaved: (val1) {
                latitude = double.parse(val1);
                debugPrint(latitude.toString());
                // FocusScope.of(context).unfocus();
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(
                  onPressed: validate,
                  child: Text(isUpdating ? 'UPDATE' : 'ADD'),
                ),
                FlatButton(
                  onPressed: () {
                    setState(() {
                      isUpdating = false;
                    });
                    clearName();
                  },
                  child: Text('CANCEL'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  SingleChildScrollView dataTable(List<Location> locationList) {
    return SingleChildScrollView(
      // scrollDirection: Axis.vertical,
      child: DataTable(
        columns: [
          DataColumn(
            label: Text('Lon / Lat'),
          ),
          // DataColumn(
          //   label: Text('Latitude'),
          // ),
          DataColumn(
            label: Text('Date/Time'),
          ),
          DataColumn(
            label: Text('DELETE'),
          ),
        ],
        rows: locationList
            .map(
              (location) => DataRow(cells: [
                DataCell(
                  Text(location.longtitude.toString() +
                      "/" +
                      location.latitude.toString()),
                  // onTap: () {
                  //   setState(() {
                  //     isUpdating = true;
                  //     id = location.id;
                  //   });
                  //   lontitudeController.text = location.longtitude.toString();
                  // },
                ),
                DataCell(
                  Text(location.datetime.toString().substring(0, 17)),
                  // onTap: () {
                  //   setState(() {
                  //     isUpdating = true;
                  //     id = location.id;
                  //   });
                  //   latitudeController.text = location.latitude.toString();
                  // },
                ),
                DataCell(IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    dbHelper.deleteLocation(location.id);
                    refreshList();
                  },
                )),
              ]),
            )
            .toList(),
      ),
    );
  }

  list() {
    return Expanded(
      child: FutureBuilder(
        future: locationsList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return dataTable(snapshot.data);
          }
          if (null == snapshot.data || snapshot.data.length == 0) {
            return Text("No Data Found");
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Locations',
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AlarmManager()),
          );
        },
        label: Text('Location Service'),
        icon: Icon(Icons.location_on),
        backgroundColor: Colors.pink,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
                  child: Text('Delete All Locations'),
                  textColor: Colors.red,
                  onPressed: () {
                    print("delete all -> ");
                    dbHelper.deleteAllLocation();
                    refreshList();
                  },
                ),
                RaisedButton(
                  child: Text('Refresh'),
                  textColor: Colors.blue[400],
                  onPressed: () {
                    refreshList();
                  },
                ),
              ],
            ),
            // form(),
            list(),
          ],
        ),
      ),
    );
  }
}
