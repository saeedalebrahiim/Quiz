import 'package:quiz/model/dto/question.dart';

class QuizDto {
  final int quizId;
  final int dQuizId;
  List<QuestionsDto> quizQuestions;

  QuizDto({
    required this.quizId,
    required this.dQuizId,
    required this.quizQuestions,
  });
}
