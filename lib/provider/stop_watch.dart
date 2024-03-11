import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bilgimizde/controller/Quiz/start_quiz.dart';
import 'package:bilgimizde/provider/quiz.dart';

class StopWatchProvider with ChangeNotifier {
  Stream timeStream = Stream.periodic(const Duration(seconds: 1));

  StreamSubscription? streamSubscription;

  int secondsElapsed = 30;

  void init() {
    // secondsElapsed = storageService.get(StorageKey.secondsElapsed) ?? 0;
  }

  void start({required BuildContext context, required int index}) {
    secondsElapsed = 30;

    if (streamSubscription != null && streamSubscription!.isPaused) {
      streamSubscription!.resume();
    } else if (streamSubscription != null) {
      streamSubscription = timeStream.listen((seconds) {
        secondsElapsed--;
        print("secondsElapsed $secondsElapsed");
        print(secondsElapsed <= 0);
        if (secondsElapsed <= 0) {
          print("seirosali $secondsElapsed");

          // QuizState quiz = Provider.of<QuizState>(context, listen: false);
          //TODO call add
          // StartQuizController.addAwnswer(
          //     userQuizId: quiz.quiz!.quizId,
          //     userDQuizId: quiz.quiz!.dQuizId,
          //     questionId: quiz.quiz!.quizQuestions[index].questionId,
          //     selectedAnswer: 0,
          //     questionNumber: index,
          //     context: context);
          stop();
        }
        notifyListeners();
        // storageService.set(StorageKey.secondsElapsed, secondsElapsed);
      });
    }
  }

  void stop() {
    if (streamSubscription != null && !streamSubscription!.isPaused) {
      // storageService.set(StorageKey.secondsElapsed, secondsElapsed);
      streamSubscription!.pause();
      notifyListeners();
      // storageService.set(StorageKey.secondsElapsed, secondsElapsed);
    }
  }

  void cancel() {
    if (streamSubscription != null) {
      streamSubscription!.cancel();
    }
  }
}
