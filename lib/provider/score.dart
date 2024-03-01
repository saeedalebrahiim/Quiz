import 'package:flutter/material.dart';
import 'package:quiz/model/dto/score.dart';

class ScoreState extends ChangeNotifier {
  int? userRank;
  getuserRank({required int values}) {
    userRank = values;
    notifyListeners();
  }

  List<UserScore> dailyScores = [];
  List<String> rewards = [];

  getDailyUsers({required UserScore value}) {
    dailyScores.add(value);
    notifyListeners();
  }

  resetDailyUsers() {
    dailyScores.clear();
    dailyScores = [];
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
