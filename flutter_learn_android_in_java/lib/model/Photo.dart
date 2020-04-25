class Photo {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Photo({this.title, this.id, this.albumId, this.thumbnailUrl, this.url});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      albumId: json["albumId"] as int,
      id: json["id"] as int,
      title: json["title"] as String,
      url: json["url"] as String,
      thumbnailUrl: json["thumbnailUrl"] as String,
    );
  }
}
