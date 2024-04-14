import 'package:flutter/material.dart';

class WordGameState extends ChangeNotifier {
  bool gameStarted = false;
  bool canFirstGuess = false;
  bool canSecondGuess = false;
  bool canThirdGuess = false;
  bool canFourthGuess = false;

  startGame() {
    gameStarted = true;
    notifyListeners();
  }

  openFirst() {
    canFirstGuess = true;
    notifyListeners();
  }

  openSecond() {
    canSecondGuess = true;
    notifyListeners();
  }

  openThird() {
    canThirdGuess = true;
    notifyListeners();
  }

  openFourth() {
    canFourthGuess = true;
    notifyListeners();
  }
}
