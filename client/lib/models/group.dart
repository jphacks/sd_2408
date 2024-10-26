import 'user.dart';

class Group {
  final int groupID;
  final List<User> users;
  final String name;

  Group({required this.groupID, required this.users, required this.name});

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      groupID: json["groupID"],
      users: json["users"],
      name: json["name"]
    );
  }
}
