import 'package:flutter/material.dart';

class WordGameState extends ChangeNotifier {
  bool gameStarted = false;
  bool canFirstGuess = false;
  bool canSecondGuess = false;
  bool canThirdGuess = false;
  bool canFourthGuess = false;
  bool endTheGame = false;

  bool? isRight1;
  bool? isRight2;
  bool? isRight3;
  bool? isRight4;

  String word = "";
  String helpChar = "";
  int indexLock3 = -1;

  startGame() {
    gameStarted = true;
    canFirstGuess = false;
    canSecondGuess = false;
    canThirdGuess = false;
    canFourthGuess = false;
    endTheGame = false;
    word = "";
    isRight1 = null;
    isRight2 = null;
    isRight3 = null;
    isRight4 = null;

    helpChar = "";
    indexLock3 = -1;
    notifyListeners();
  }

  openFirst() {
    canFirstGuess = true;
    notifyListeners();
  }

  openSecond() {
    if (!endTheGame) {
      canSecondGuess = true;
    }
    notifyListeners();
  }

  openThird() {
    if (!endTheGame) {
      canThirdGuess = true;
    }
    notifyListeners();
  }

  openFourth() {
    if (!endTheGame) {
      canFourthGuess = true;
    }
    notifyListeners();
  }

  endGame() {
    endTheGame = true;
    notifyListeners();
  }

  getWord(String val) {
    if (word.isEmpty) {
      word = val;
      endGame();
    }
    notifyListeners();
  }

  getThirdHelp({required int index, required String char}) {
    helpChar = char;
    indexLock3 = index;
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
