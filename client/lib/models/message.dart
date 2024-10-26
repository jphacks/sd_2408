class Message {
  final int messageID;
  final int userID;
  final String message;

  Message({
    required this.messageID,
    required this.userID,
    required this.message,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      message: json["message"],
      messageID: json["messageID"],
      userID: json["userID"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "message": message,
      "messageID": messageID,
      "userID": userID,
    };
  }
}
