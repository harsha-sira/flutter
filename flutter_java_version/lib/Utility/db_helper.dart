import 'package:flutter/material.dart';
import 'package:flutter_java_version/model/Location.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  Future<Database> getConnection() async {
    // Open the database and store the reference.
    final Future<Database> database = openDatabase(
        // Set the path to the database. Note: Using the `join` function from the
        // `path` package is best practice to ensure the path is correctly
        // constructed for each platform.
        join(await getDatabasesPath(), 'location_app.db'),
        onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE location (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, longtitude DOUBLE, latitude DOUBLE,datetime DATETIME, updated INTEGER)",
      );
    }, version: 1);

    return database;
  }

  //add locations
  Future<void> addLocation(Location location) async {
    final Database db = await getConnection();
    // Insert the Location into the correct table. Also specify the
    // `conflictAlgorithm`. In this case, if the same dog is inserted
    // multiple times, it replaces the previous data.
    print('add location start');
    await db.insert(
      'location',
      location.toMap(),
    );
  }

  // get locations
  Future<List<Location>> getLocations() async {
    final Database db = await getConnection();

    final List<Map<String, dynamic>> locations = await db.query('location');

    List<Location> employees = [];
    if (locations.length > 0) {
      for (int i = 0; i < locations.length; i++) {
        debugPrint(Location.fromMap(locations[i]).toString());
        employees.add(Location.fromMap(locations[i]));
      }
    }
    return employees;
  }

  //update locations
  Future<void> updateLocation(Location location) async {
    // Get a reference to the database.
    final Database db = await getConnection();

    await db.update(
      'location',
      location.toMap(),
      where: "id = ?",
      // Pass the Location's id as a whereArg to prevent SQL injection.
      whereArgs: [location.id],
    );
  }

  //delete location
  Future<void> deleteLocation(int id) async {
    // Get a reference to the database.
    final db = await getConnection();

    // Remove the Dog from the database.
    await db.delete(
      'location',
      // Use a `where` clause to delete a specific location.
      where: "id = ?",
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }

  //delete location
  Future<void> deleteAllLocation() async {
    // Get a reference to the database.
    final db = await getConnection();
    await db.delete('location');
  }

  //close connection
  Future close() async {
    var dbClient = await getConnection();
    dbClient.close();
  }
}
