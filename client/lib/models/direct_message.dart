class DirectMessage {
  final int directMessageID;
  final int firstUserID;
  final int secondUserID;
  final List<Message> messages;

  DirectMessage({
    required this.directMessageID,
    required this.firstUserID,
    required this.secondUserID,
    required this.messages,
  });

  factory DirectMessage.fromJson(Map<String, dynamic> json){
    return DirectMessage(
      directMessageID: json["directMessageID"],
      firstUserID: json["firstUserID"],
      secondUserID: json["secondUserID"],
      messages: json["messages"], // TODO 多分うまくdecodeするように修正する必要あり
    );
  }
}

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
