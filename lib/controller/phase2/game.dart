import 'dart:convert';

import 'package:bilgimizde/components/alarms_functions/phase2/lost.dart';
import 'package:bilgimizde/components/alarms_functions/phase2/win.dart';
import 'package:bilgimizde/controller/profile/profile.dart';
import 'package:bilgimizde/provider/wordguess.dart';
import 'package:bilgimizde/view/gem_quiz/game.dart';
import 'package:bilgimizde/view/home/quiz/end_quiz_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bilgimizde/model/api/swagger/generated/quiz.swagger.dart';
import 'package:bilgimizde/model/dto/question.dart';
import 'package:bilgimizde/model/dto/quiz.dart';
import 'package:bilgimizde/provider/quiz.dart';
import 'package:bilgimizde/services/headers.dart';
import 'package:bilgimizde/view/home/quiz/quiz_screen.dart';

class WordController {
  static Future<void> startWordGame({
    required int lvlId,
    required BuildContext context,
  }) async {
    final api = Quiz.create(interceptors: [TokenIndicator()]);
    try {
      await api
          .apiV1WordGameStartWordGamePost(
        levelId: lvlId,
      )
          .then((postResult) {
        print("called start");
        ProfileController.getProfile(context: context);

        final String body = jsonDecode(postResult.bodyString)["data"];
        final res = jsonDecode(postResult.bodyString);
        print(res);
        print(body);

        if (res["isSuccess"] == true) {
          Navigator.of(context).push(
            PageRouteBuilder(
                pageBuilder: (_, __, ___) => WordGame(
                      word: body.toString(),
                      price: "850",
                    ),
                transitionDuration: const Duration(milliseconds: 500),
                transitionsBuilder: (_, a, __, c) => FadeTransition(
                      opacity: a,
                      child: c,
                    )),
          );
        }
      });
    } catch (e) {
      print(e);
    }
  }

  static Future<void> guessWordGame({
    required String word,
    required int index,
    required BuildContext context,
  }) async {
    final api = Quiz.create(interceptors: [TokenIndicator()]);
    try {
      print("this i parameter $word");
      await api.apiV1WordGameGuessTheWordPost(word: word).then((postResult) {
        print("called ey voy");

        final body = jsonDecode(postResult.bodyString)["data"];
        final res = jsonDecode(postResult.bodyString);
        print(res);
        print(body);
        if (res["isSuccess"] == true) {
          context.read<WordGameState>().rightAnswerd(index: index);
          win(context);
        } else {
          context.read<WordGameState>().wrongAnswerd(index: index);
          if (index == 4) {
            lost(context);
          }
        }
        // res["isSuccess"] == true
        //     ? context.read<WordGameState>().rightAnswerd(index: index)
        //     : context.read<WordGameState>().wrongAnswerd(index: index);
        // if (index == 4) {
        //   res["isSuccess"] == false ? lost(context) : win(context);
        // }

        if (res["isSuccess"] == true) {}
      });
    } catch (e) {
      print(e);
    }
  }

  static Future<void> addInAppPurchase({
    required String? subscriptionId,
    required int? lvlId,
    required BuildContext context,
  }) async {
    final api = Quiz.create(interceptors: [TokenIndicator()]);
    try {
      await api
          .apiV1WordGameAddInAppPurchasePost(
        body:
            VerifyPaymentClass(subscriptionId: subscriptionId, levelId: lvlId),
      )
          .then((postResult) {
        print("called start");

        final body = jsonDecode(postResult.bodyString)["data"];
        final res = jsonDecode(postResult.bodyString);
        print(res);
        print(body);

        if (res["isSuccess"] == true) {
          ProfileController.getProfile(context: context);
        }
      });
    } catch (e) {
      print(e);
    }
  }
}
