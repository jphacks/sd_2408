class Image {
  final int imageID;
  final int userID;
  final String url;

  Image({required this.imageID, required this.userID, required this.url});

  factory Image.fromJson(Map<String, dynamic> json) {//多分取得だけで良い
    return Image(
      imageID: json["imageID"],
      userID: json["userID"],
      url: json["url"]
    );
  }
}
