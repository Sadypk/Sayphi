class PolicyModel {
  PolicyModel({
    required this.id,
    required this.header,
    required this.footer,
    required this.policies,
  });

  String id;
  String header;
  String footer;
  List<Policy> policies;

  factory PolicyModel.fromJson(Map<String, dynamic> json) => PolicyModel(
    id: json["_id"],
    header: json["header"],
    footer: json["footer"],
    policies: List<Policy>.from(json["policies"].map((x) => Policy.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "header": header,
    "footer": footer,
    "policies": List<dynamic>.from(policies.map((x) => x.toJson())),
  };
}

class Policy {
  Policy({
    required this.title,
    required this.description,
  });

  String title;
  String description;

  factory Policy.fromJson(Map<String, dynamic> json) => Policy(
    title: json["title"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
  };
}