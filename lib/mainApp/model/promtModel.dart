class PromptModel{
  String id;
  String prompt;

  PromptModel({
    required this.id,
    required this.prompt
});

  factory PromptModel.fromJson(Map<String, dynamic> json)=> PromptModel(
    id: json['_id'],
    prompt: json['prompt']
  );

}