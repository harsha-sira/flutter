class Album {
  int userId;
  int id;
  String title;
  String body;

  Album({this.userId, this.id, this.title, this.body});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json["userId"] as int,
      id: json["id"] as int,
      title: json["title"] as String,
      body: json["body"] as String,
    );
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
    return map;
  }

  Album.fromMap(Map<String, dynamic> map) {
    userId = map['userId'];
    id = map['id'];
    title = map['title'];
    body = map['body'];
  }
}
