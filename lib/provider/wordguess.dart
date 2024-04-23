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

  String word = "";

  startGame() {
    gameStarted = true;
    canFirstGuess = false;
    canSecondGuess = false;
    canThirdGuess = false;
    canFourthGuess = false;
    endTheGame = false;
    word = "";
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
