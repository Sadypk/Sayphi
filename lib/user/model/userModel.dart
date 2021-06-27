import 'package:sayphi/user/model/genderModel.dart';

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
  });

  String id;
  String? name;
  String? emailOrPhone;
  String? profileImage;
  bool isProfileComplete;
  int? dateOfBirth;
  List<ImageModel> images;
  List<VideoModel> videos;
  bool showGenderInProfile;
  EthnicityModel? ethnicity;
  GenderModel? gender;
  UserFilterModel filters;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["_id"],
    emailOrPhone: json["phone_or_email"],
    name: json["nick_name"],
    profileImage: json["profile_image"],
    isProfileComplete: json["complete"] == null ? false : json["complete"],
    dateOfBirth: int.parse(json["date_of_birth"]),
    images: json["images"] == null ? [] : List<ImageModel>.from(json["images"].map((x) => ImageModel.fromJson(x))),
    videos: json["videos"] == null ? [] : List<VideoModel>.from(json["videos"].map((x) => VideoModel.fromJson(x))),
    showGenderInProfile: json["show_gender_in_profile"] ? false : json["show_gender_in_profile"],
    ethnicity: EthnicityModel.fromJson(json["ethnicity"]),
    gender: json["gender"] == null ? null : GenderModel.fromJson(json["gender"]),
    filters: UserFilterModel.fromJson(json["filters"]),
  );
}

class ImageModel{
  String image;
  String status;

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
  String status;

  VideoModel({
    required this.video,
    required this.status
});

  factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
    video: json['video'],
    status: json['status']
  );
}

class EthnicityModel {
  EthnicityModel({
    required this.id,
    required this.ethnicity,
  });

  String id;
  String? ethnicity;

  factory EthnicityModel.fromJson(Map<String, dynamic> json) => EthnicityModel(
    id: json["_id"],
    ethnicity: json["ethnicity"],
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
  EthnicityModel? religion;

  factory UserFilterModel.fromJson(Map<String, dynamic> json) => UserFilterModel(
    location: json["location"] == null ? null : LocationModel.fromJson(json["location"]),
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
    religion: json["religion"] == null ? null : EthnicityModel.fromJson(json["religion"]),
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

  String? name;
  CoordinatesModel coordinates;

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
    name: json["name"] ?? '',
    coordinates: CoordinatesModel.fromJson(json["coordinates"]),
  );
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
}