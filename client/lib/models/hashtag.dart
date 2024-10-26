class Hashtag {
  final int hashtagID;
  final String name;
  final List<int> groupIDs;

  Hashtag({
    required this.hashtagID,
    required this.groupIDs,
    required this.name,
  });

  factory Hashtag.fromJson(Map<String, dynamic> json) {
    return Hashtag(
      hashtagID: json["hashtagID"],
      groupIDs: json["groupIDs"],
      name: json["name"]
    );
  }
}
