import 'package:flutter/material.dart';

class WordGameState extends ChangeNotifier {
  bool gameStarted = false;
  bool canFirstGuess = false;
  bool canSecondGuess = false;
  bool canThirdGuess = false;
  bool canFourthGuess = false;
  bool endTheGame = false;

  bool isRight1 = false;
  bool isRight2 = false;
  bool isRight3 = false;
  bool isRight4 = false;

  startGame() {
    gameStarted = true;
    canFirstGuess = false;
    canSecondGuess = false;
    canThirdGuess = false;
    canFourthGuess = false;
    endTheGame = false;
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

  endGame() {
    endTheGame = true;
    notifyListeners();
  }

  wrongAnswerd({required int index}) {
    switch (index) {
      case 1:
        isRight1 = false;
      case 2:
        isRight2 = false;
      case 3:
        isRight3 = false;
      case 4:
        isRight4 = false;
        break;
      default:
    }
    notifyListeners();
  }

  rightAnswerd({required int index}) {
    endTheGame = true;
    switch (index) {
      case 1:
        isRight1 = true;
      case 2:
        isRight2 = true;
      case 3:
        isRight3 = true;
      case 4:
        isRight4 = true;
        break;
      default:
    }
    notifyListeners();
  }
}
