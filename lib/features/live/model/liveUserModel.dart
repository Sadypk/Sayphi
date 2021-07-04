import 'package:sayphi/demo_files.dart';

class LiveUserModel{
  String id;
  String name;
  String image;
  String channelName;

  LiveUserModel({required this.id, required this.name, required this.image, required this.channelName});

  factory LiveUserModel.fromJson(Map<String, dynamic> json ) => LiveUserModel(
    id: json['_id'],
    name: json['nick_name'],
    image: json['profile_image'] ?? Demo.PROFILE_IMAGE,
    channelName: json['channel_name']
  );
}