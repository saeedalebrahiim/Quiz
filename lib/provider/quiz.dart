
import 'package:flutter/material.dart';
import 'package:bilgimizde/model/dto/quiz.dart';

class QuizState extends ChangeNotifier {


  QuizDto? quiz;
  int correctCount = 0;
  int falseCount = 0;

  bool? isTop50;

  UserPercentageHint? percentHint;

  List<int> eliminateAnswers = [];

  bool usedPercentage = false;
  bool usedEliminate = false;

  getQuiz({required QuizDto value}) {
    quiz = value;
    notifyListeners();
  }

  resetCount() {
    correctCount = 0;
    falseCount = 0;
    quiz = null;
    usedPercentage = false;
    usedEliminate = false;
    notifyListeners();
  }

  plusCount() {
    correctCount++;
    usedPercentage = false;
    usedEliminate = false;
    notifyListeners();
  }

  falsePlusCount() {
    falseCount++;
    usedPercentage = false;
    usedEliminate = false;
    notifyListeners();
  }

  addPercentHint(UserPercentageHint hint) {
    percentHint = hint;
    usedPercentage = true;

    notifyListeners();
  }

  removePercentHint() {
    percentHint = null;
    notifyListeners();
  }

  addEliminateAnswers(int n1, int n2) {
    eliminateAnswers.add(n1);
    eliminateAnswers.add(n2);
    usedEliminate = true;
    notifyListeners();
  }

  removeEliminateAnswers() {
    eliminateAnswers.clear;
    eliminateAnswers = [];
    notifyListeners();
  }

  getIsTop50({required bool value}) {
    isTop50 = value;
    notifyListeners();
  }
}

class UserPercentageHint {
  final int id;
  final int selectedAnswer1Count;
  final int selectedAnswer2Count;
  final int selectedAnswer3Count;
  final int selectedAnswer4Count;

  UserPercentageHint({
    required this.id,
    required this.selectedAnswer1Count,
    required this.selectedAnswer2Count,
    required this.selectedAnswer3Count,
    required this.selectedAnswer4Count,
  });
  static UserPercentageHint fromJson(json) {
    return UserPercentageHint(
      selectedAnswer1Count: json['selectedAnswer1Count'],
      selectedAnswer2Count: json['selectedAnswer2Count'],
      selectedAnswer3Count: json['selectedAnswer3Count'],
      selectedAnswer4Count: json['selectedAnswer4Count'],
      id: json['id'],
    );
  }
}
