import 'package:flutter/material.dart';
import 'package:quiz/global.dart';
import 'package:quiz/model/dto/quiz.dart';

class QuizState extends ChangeNotifier {
  QuizDto? quiz;
  getQuiz({required QuizDto value}) {
    quiz = value;
    notifyListeners();
  }
}
