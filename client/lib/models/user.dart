import 'image.dart';

class User {
  final int userID;
  final String name;
  final int birthday;
  final String email;
  final String password;
  final String place;
  final String githubURL;
  final String selfIntro;
  final Image icon;
  final String preference;
  final List<int> groupIDs;
  final List<int> followIDs;
  final List<int> directMessageIDs;

  User(
      {
      required this.userID,
      required this.name,
      required this.birthday,
      required this.email,
      required this.password,
      required this.place,
      required this.githubURL,
      required this.selfIntro,
      required this.icon,
      required this.preference,
      this.groupIDs = const [],
      this.directMessageIDs = const [],
      this.followIDs = const [],
      });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userID: json["ID"],
      name: json["Name"],
      birthday: json["Birthday"],
      email: json["Email"],
      password: json["Password"],
      place: json["Place"],
      githubURL: json["GithubURL"],
      selfIntro: json["SelfIntro"],
      icon: Image.fromJson(json["Image"]),
      preference: json["Preference"],
      followIDs: json["FollowIDs"] != null ? List<int>.from(json["FollowIDs"]) : [],
      groupIDs: json["GroupIDs"] != null ? List<int>.from(json["GroupIDs"]) : [],
      directMessageIDs: json["DirectMessageIDs"] != null ? List<int>.from(json["DirectMessageIDs"]) : [], // 修正: nullチェックを追加
    );
  }

}
