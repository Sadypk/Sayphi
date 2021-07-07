import 'package:sayphi/demo_files.dart';

class MinimalUserModel{
  String id;
  String name;
  String image;
  String address;
  int rank;
  double distance;

  MinimalUserModel({
    required this.id,
    required this.name,
    required this.image,
    required this.address,
    required this.rank,
    required this.distance
});

  factory MinimalUserModel.fromJson(Map<String, dynamic> json) => MinimalUserModel(
    id: json['_id'],
    name: json['nick_name'],
    image: json['profile_image'] ?? Demo.PROFILE_IMAGE,
    address: json['address']['address'] == null ? '' : json['address']['address'],
    rank: json['rank'] ?? 0,
    distance: json['calculated_distance'] ?? 0.0,
  );
}