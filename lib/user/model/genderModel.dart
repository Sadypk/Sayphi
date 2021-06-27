class GenderModel{
  String id;
  String? gender;
  GenderModel({
    required this.id,
    required this.gender
});

  factory GenderModel.fromJson(Map<String, dynamic> json) => GenderModel(
    id: json['_id'],
    gender: json['gender']
  );
}