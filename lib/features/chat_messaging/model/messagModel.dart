class MessageModel{

  String fromUser;
  String toUserId;
  String message;
  String toUserImage;
  String toUserName;
  DateTime createdAt;

  MessageModel({
    required this.fromUser,
    required this.toUserId,
    required this.message,
    required this.createdAt,
    required this.toUserName,
    required this.toUserImage
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
      fromUser: json['fromUser'],
      toUserId: json['toUser'],
      message: json['message'],
      toUserImage: json['toUserImage'],
      toUserName: json['toUserName'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(json['createdAt'])
  );
}