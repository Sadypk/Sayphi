import 'package:sayphi/demo_files.dart';

class OtherUserModel{
  String id;
  String name;
  String image;

  OtherUserModel({required this.id, required this.name, required this.image});

  factory OtherUserModel.fromJson(Map<String, dynamic> json ) => OtherUserModel(
    id: json['_id'],
    name: json['nick_name'],
    image: json['profile_image'] ?? Demo.PROFILE_IMAGE,
  );
}