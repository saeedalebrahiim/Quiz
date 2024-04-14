import 'dart:convert';

import 'package:bilgimizde/controller/profile/profile.dart';
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

        final body = jsonDecode(postResult.bodyString)["data"];
        final res = jsonDecode(postResult.bodyString);
        print(res);
        print(body);

        if (res["isSuccess"] == true) {}
      });
    } catch (e) {
      print(e);
    }
  }

  static Future<void> addInAppPurchase({
    required int lvlId,
    required BuildContext context,
  }) async {
    final api = Quiz.create(interceptors: [TokenIndicator()]);
    try {
      await api
          .apiV1WordGameAddInAppPurchasePost(
        body: VerifyPaymentClass(levelId: lvlId),
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
