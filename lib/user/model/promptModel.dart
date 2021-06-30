class UserPromptModel{
  String id;
  String prompt;
  String answer;

  UserPromptModel({
    required this.id,
    required this.prompt,
    required this.answer
});

  factory UserPromptModel.fromJson(Map<String, dynamic> json) => UserPromptModel(
    id: json['prompt']['_id'],
    prompt: json['prompt']['prompt'],
    answer: json['answer'],

  );
}