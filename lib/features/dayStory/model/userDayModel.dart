import 'package:sayphi/features/dayStory/model/dayDataModel.dart';

class UserDayModel{
  String id;
  String name;
  String profileImage;
  List<DayDataModel> day;

  UserDayModel({
    required this.id,
    required this.name,
    required this.profileImage,
    required this.day
});

  factory UserDayModel.fromJson(Map<String, dynamic> json) => UserDayModel(
    id: json['_id'],
    name: json['nick_name'],
      profileImage: json['profile_image'],
    day: List<DayDataModel>.from(json['days'].map((day) => DayDataModel.fromJson(day)))
  );

}