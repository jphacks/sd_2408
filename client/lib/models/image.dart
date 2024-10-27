class Image {
  final int id;
  final String filePath;

  Image({required this.id, required this.filePath});

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      id: json["ID"],
      filePath: json["FilePath"],
    );
  }
}
