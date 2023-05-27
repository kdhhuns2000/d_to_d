class Message {
  int id;
  String targetUserId;
  String targetUserName;
  String targetUserCategory;

  Message(
      {required this.id,
      required this.targetUserId,
      required this.targetUserName,
      required this.targetUserCategory});

  factory Message.fromJson(Map<String, dynamic> jsonData) {
    return Message(
      id: jsonData['id'],
      targetUserId: jsonData['targetUserId'],
      targetUserName: jsonData['targetUserName'],
      targetUserCategory: jsonData['targetUserCategory'],
    );
  }
}
