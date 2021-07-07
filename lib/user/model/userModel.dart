import 'package:sayphi/mainApp/model/questionAnswerModel.dart';
import 'package:sayphi/user/model/ethnicityModel.dart';
import 'package:sayphi/user/model/genderModel.dart';
import 'package:sayphi/user/model/religionModel.dart';

class UserModel {
  UserModel({
    required this.id,
    this.name,
    this.profileImage,
    required this.isProfileComplete,
    this.dateOfBirth,
    required this.images,
    required this.videos,
    required this.showGenderInProfile,
    this.ethnicity,
    this.gender,
    required this.filters,
    required this.emailOrPhone,
    this.height,
    this.qa = const [],
    this.religion,
    this.school,
    this.college,
    this.occupation,
    this.relationshipGoal,
    this.relationshipStatus,
    this.spotifyId,
    this.instagramId,
    this.status = 'ok',
    this.userLocation,
  });

  String id;
  String? name;
  String status;
  String? emailOrPhone;
  String? profileImage;
  String? school;
  String? college;
  String? occupation;
  String? relationshipGoal;
  String? relationshipStatus;
  String? spotifyId;
  String? instagramId;
  bool isProfileComplete;
  int? dateOfBirth;
  int? height;
  LocationModel? userLocation;
  List<ImageModel> images;
  List<VideoModel> videos;
  bool showGenderInProfile;
  EthnicityModel? ethnicity;
  GenderModel? gender;
  UserFilterModel filters;
  List<UserQuestionAnswerModel> qa;
  ReligionModel? religion;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["_id"],
    emailOrPhone: json["phone_or_email"],
    name: json["nick_name"],
    height: json["height"],
    userLocation: json["address"]['address'] == null ? null : LocationModel.fromJson(json["address"]),
    qa : List.from(json['question_answer'].map((data) => UserQuestionAnswerModel.fromJson(data))),
    profileImage: json["profile_image"],
    occupation: json["occupation"],
    school: json["school"],
    college: json["college"],
    relationshipGoal: json["relationshipGoal"],
    relationshipStatus: json["relationshipStatus"],
    instagramId: json["instagramID"],
    spotifyId: json["spotifyID"],
    status: json["status"] ?? 'ok',
    isProfileComplete: json["complete"] == null ? false : json["complete"],
    dateOfBirth: json["date_of_birth"] == null ? null : int.parse(json["date_of_birth"]),
    images: json["images"] == null ? [] : List<ImageModel>.from(json["images"].map((x) => ImageModel.fromJson(x))),
    videos: json["videos"] == null ? [] : List<VideoModel>.from(json["videos"].map((x) => VideoModel.fromJson(x))),
    showGenderInProfile: json["show_gender_in_profile"] == null ?  false : json["show_gender_in_profile"],
    ethnicity: json["ethnicity"] == null ? null : EthnicityModel.fromJson(json["ethnicity"]),
    gender: json["gender"] == null ? null : GenderModel.fromJson(json["gender"]),
    filters: UserFilterModel.fromJson(json["filters"]),
    religion: json['religion'] == null ? null : ReligionModel.fromJson(json['religion'])
  );
}

class UserQuestionAnswerModel{
  QuestionAnswerModel qa;
  String answer;

  UserQuestionAnswerModel({
    required this.qa,
    required this.answer
});

  factory UserQuestionAnswerModel.fromJson(Map<String, dynamic> json) => UserQuestionAnswerModel(
    qa: QuestionAnswerModel.fromJson(json['question']),
    answer: json['answer'] ?? ''
  );

}

class ImageModel{
  String image;
  bool status;

  ImageModel({
    required this.image,
    required this.status
});

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
    image: json['image'],
    status: json['status']
  );
}

class VideoModel{
  String video;
  bool status;

  VideoModel({
    required this.video,
    required this.status
});

  factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
    video: json['video'],
    status: json['status']
  );
}


class UserFilterModel {
  UserFilterModel({
    this.location,
    this.interestedIn,
    this.filterBy,
    this.ageRange,
    this.language,
    this.lookingFor,
    required this.photoVerified,
    this.height,
    this.children,
    this.smoking = false,
    this.pets = true,
    this.religion,
  });

  LocationModel? location;
  String? interestedIn;
  String? filterBy;
  RangeModel? ageRange;
  String? language;
  String? lookingFor;
  bool photoVerified;
  RangeModel? height;
  RangeModel? children;
  bool smoking;
  bool pets;
  ReligionModel? religion;

  factory UserFilterModel.fromJson(Map<String, dynamic> json) => UserFilterModel(
    location: json["address"]['address'] == null ? null : LocationModel.fromJson(json["address"]),
    interestedIn: json["interest"] ?? '',
    filterBy: json["filter_by"] ?? '',
    ageRange: RangeModel.fromJson(json["age_range"]),
    language: json["language"],
    lookingFor: json["looking_for"],
    photoVerified: json["photo_verified"] ?? false,
    height: RangeModel.fromJson(json["height"]),
    children: RangeModel.fromJson(json["children"]),
    smoking: json["smoking"] ?? false,
    pets: json["pets"] ?? false,
    religion: json["religion"] == null ? null : ReligionModel.fromJson(json["religion"]),
  );
}

class RangeModel {
  RangeModel({
    required this.start,
    required this.end,
  });

  int start;
  int end;

  factory RangeModel.fromJson(Map<String, dynamic> json) => RangeModel(
    start: json["start"] ?? 0,
    end: json["end"] ?? 100,
  );
}

class LocationModel {
  LocationModel({
    required this.name,
    required this.coordinates,
  });

  String name;
  CoordinatesModel coordinates;

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
    name: json["address"],
    coordinates: CoordinatesModel.fromJson(json["location"]),
  );

  Map<String, dynamic> toJson() => {
    'name' : name,
    'coordinates' : coordinates.toJson()
  };
}

class CoordinatesModel {
  CoordinatesModel({
    required this.lat,
    required this.lng
  });

  double? lat;
  double? lng;

  factory CoordinatesModel.fromJson(Map<String, dynamic> json) => CoordinatesModel(
    lat: json["lat"],
    lng: json["lng"],
  );

  Map<String, dynamic> toJson() => {
    'lat' : lat,
    'lng' : lng,
  };
}