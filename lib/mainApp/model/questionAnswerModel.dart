class QuestionAnswerModel{
  String id;
  String question;
  List<String> options;

  QuestionAnswerModel({
    required this.id,
    required this.question,
    required this.options
});

  factory QuestionAnswerModel.fromJson(Map<String, dynamic> json) => QuestionAnswerModel(
    id: json['_id'],
    question: json['question'],
    options: List<String>.from(json['answers'].map((ans) => ans))
  );

}