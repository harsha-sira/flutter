import 'package:flutter_java_version/Utility/db_helper.dart';
import 'package:flutter_java_version/model/Location.dart';

class CallBackService {
  static DBHelper dbHelper;

  static void init() {
    if (dbHelper == null) {
      dbHelper = new DBHelper();
    }
  }

  static void run() async {
    //inserting dummy location values for now
    Location loc = Location(1.1, 9.9, DateTime.now().toIso8601String(), 0);
    await setDataToSQLite(loc);
  }

  static Future<void> setDataToSQLite(Location data) async {
    final date = DateTime.now();
    if (dbHelper == null) {
      print("db helper null");
      dbHelper = new DBHelper();
    }
    await dbHelper.addLocation(data);
  }
}
