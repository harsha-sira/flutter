class Location {
  int id = 1;
  double longtitude;
  double latitude;
  String datetime;
  int updated = 0;

  Location.all(
      {this.id, this.longtitude, this.latitude, this.datetime, this.updated});

  Location.allVariable(int id, double longtitude, double latitude,
      String datetime, int updated) {
    this.id = id;
    this.longtitude = longtitude;
    this.latitude = latitude;
    this.datetime = datetime;
    this.updated = updated;
  }

  Location(double longtitude, double latitude, String datetime, int updated) {
    this.longtitude = longtitude;
    this.latitude = latitude;
    this.datetime = datetime;
    this.updated = updated;
  }

  Map<String, dynamic> toMap() {
    return {
      'longtitude': longtitude,
      'latitude': latitude,
      'datetime': datetime,
      'updated': updated,
    };
  }

  Location.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    longtitude = map['longtitude'];
    latitude = map['latitude'];
    datetime = map['datetime'];
    updated = map['updated'];
  }

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location.all(
        id: json["id"] as int,
        longtitude: json["longtitude"] as double,
        latitude: json["latitude"] as double,
        datetime: json["datetime"] as String,
        updated: json["updated"] as int);
  }

  @override
  String toString() {
    // TODO: implement toString
    return this.id.toString() +
        "->" +
        this.longtitude.toString() +
        "-" +
        this.latitude.toString() +
        "-" +
        this.datetime.toString();
  }
}
