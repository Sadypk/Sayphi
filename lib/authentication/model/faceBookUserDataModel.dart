class FbUserDataModel {
  FbUserDataModel({
    required this.email,
    required this.picture,
    required this.firstName,
    required this.lastName,
    required this.fbId,
  });

  String email;
  String picture;
  String firstName;
  String lastName;
  String fbId;

  factory FbUserDataModel.fromJson(Map<String, dynamic> json) => FbUserDataModel(
    email: json["email"],
    picture: json["picture"]['data']['url'],
    firstName: json["first_name"],
    lastName: json["last_name"],
    fbId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "picture": picture,
    "first_name": firstName,
    "last_name": lastName,
    "id": fbId,
  };
}
