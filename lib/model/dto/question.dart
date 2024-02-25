class QuestionsDto {
  final int questionId;
  final String questionText;
  final String answer1;
  final String answer2;
  final String answer3;
  final String answer4;
  final int currectAnswer;

  QuestionsDto({
    required this.questionId,
    required this.questionText,
    required this.answer1,
    required this.answer2,
    required this.answer3,
    required this.answer4,
    required this.currectAnswer,
  });

  static QuestionsDto fromJson(json) {
    return QuestionsDto(
      questionId: json['questionId'],
      questionText: json['questionText'],
      answer1: json['answer1'],
      answer2: json['answer2'],
      answer3: json['answer3'],
      answer4: json['answer4'],
      currectAnswer: json['currectAnswer'],
    );
  }
}
