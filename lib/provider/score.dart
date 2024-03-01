import 'package:flutter/material.dart';

class ScoreState extends ChangeNotifier {
  int? userRank;
  getuserRank({required int values}) {
    userRank = values;
    notifyListeners();
  }
}
