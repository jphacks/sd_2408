import 'user.dart';
import 'message.dart';

class Group {
  final int groupID;
  final List<User> users;
  final List<Message> messages;
  final String name;

  Group(
      {required this.groupID,
      required this.users,
      required this.name,
      required this.messages});

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
        groupID: json["groupID"],
        users: json["users"],
        name: json["name"],
        messages: json["messages"]);//多分修正の必要あり
  }
}
