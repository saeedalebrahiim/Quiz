import 'package:flutter/material.dart';
import 'package:quiz/global.dart';
import 'package:quiz/model/dto/quiz.dart';

class QuizState extends ChangeNotifier {
  QuizDto? quiz;
  int correctCount = 0;
  int falseCount = 0;

  getQuiz({required QuizDto value}) {
    quiz = value;
    notifyListeners();
  }

  resetCount() {
    correctCount = 0;
    falseCount = 0;
    quiz = null;
    notifyListeners();
  }

  plusCount() {
    correctCount++;
    notifyListeners();
  }

  falsePlusCount() {
    falseCount++;
    notifyListeners();
  }
}
