class DayDataModel {
  DayDataModel({
    required this.id,
    required this.image,
    required this.createdAt,
  });

  String id;
  String image;
  String createdAt;

  factory DayDataModel.fromJson(Map<String, dynamic> json) => DayDataModel(
    id: json["_id"],
    image: json["image"],
    createdAt: json["createdAt"],
  );
}
