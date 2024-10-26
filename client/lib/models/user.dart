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

  User(
      {required this.userID,
      required this.name,
      required this.birthday,
      required this.email,
      required this.password,
      required this.place,
      required this.githubURL,
      required this.selfIntro,
      required this.icon,
      required this.preference,
      required this.groupIDs});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        userID: json["userID"],
        name: json["name"],
        birthday: json["birthday"],
        email: json["email"],
        password: json["password"],
        place: json["place"],
        githubURL: json["githubURL"],
        selfIntro: json["selfIntro"],
        icon: json["icon"],
        preference: json["preference"],
        groupIDs: json["groupIDs"]
    );
  }
}
