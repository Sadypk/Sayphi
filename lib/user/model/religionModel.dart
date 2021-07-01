class ReligionModel{
  String id;
  String religion;
  ReligionModel({
    required this.id,
    required this.religion
  });

  factory ReligionModel.fromJson(Map<String, dynamic> json) => ReligionModel(
      id: json['_id'],
      religion: json['religion']
  );
}