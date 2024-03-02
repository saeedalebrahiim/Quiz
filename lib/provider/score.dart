import 'package:flutter/material.dart';
import 'package:quiz/model/dto/score.dart';

class ScoreState extends ChangeNotifier {
  int? userRank;
  getuserRank({required int values}) {
    userRank = values;
    notifyListeners();
  }

  UserScore? userScore;
  List<UserScore> dailyScores = [];
  List<UserScore> monthlyScores = [];
  List<RewardScore> allScores = [];

  List<String> rewards = [];

  getDailyUsers({required UserScore value}) {
    dailyScores.add(value);
    notifyListeners();
  }

  getUserDay({required UserScore value}) {
    userScore = value;
    notifyListeners();
  }

  resetDailyUsers() {
    dailyScores.clear();
    dailyScores = [];
    userScore = null;
    notifyListeners();
  }

  getMonthlyUsers({required UserScore value}) {
    monthlyScores.add(value);
    notifyListeners();
  }

  resetMonthlyUsers() {
    monthlyScores.clear();
    monthlyScores = [];
    notifyListeners();
  }

  getAllUsers({required RewardScore value}) {
    allScores.add(value);
    notifyListeners();
  }

  resetAllUsers() {
    allScores.clear();
    allScores = [];
    notifyListeners();
  }

  getDailyRewards({required String value}) {
    rewards.add(value);
    notifyListeners();
  }

  resetDailyRewards() {
    rewards.clear();
    rewards = [];
    notifyListeners();
  }
}
