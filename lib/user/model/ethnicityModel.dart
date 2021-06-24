class EthnicityModel{
  String id;
  String ethnicity;
  EthnicityModel({
    required this.id,
    required this.ethnicity
  });

  factory EthnicityModel.fromJson(Map<String, dynamic> json) => EthnicityModel(
    id: json['_id'],
    ethnicity: json['ethnicity']
  );
}