import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/model/api/swagger/generated/quiz.swagger.dart';
import 'package:quiz/provider/score.dart';
import 'package:quiz/services/headers.dart';

class ScoreController {
  static Future<void> getUserRank({
    required int questionId,
    required BuildContext context,
  }) async {
    final api = Quiz.create(interceptors: [TokenIndicator()]);
    try {
      await api.apiV1ScoreGetUserRankGet().then((postResult) {
        print("called percent hint");

        final body = jsonDecode(postResult.bodyString)["data"];
        final res = jsonDecode(postResult.bodyString);
        print(res);
        print(body);

        if (res["isSuccess"] == true) {
          context.read<ScoreState>().getuserRank(values: body);
        }
      });
    } catch (e) {
      print(e);
    }
  }
}
