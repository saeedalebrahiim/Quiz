class FAQDto {
  final String question;
  final String answer;
  final String createDate;
  final int id;

  FAQDto({
    required this.question,
    required this.answer,
    required this.createDate,
    required this.id,
  });

  static FAQDto fromJson(json) {
    return FAQDto(
      question: json['question'],
      answer: json['answer'],
      createDate: json['createDate'],
      id: json['id'],
    );
  }
}
