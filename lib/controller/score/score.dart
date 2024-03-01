import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/model/api/swagger/generated/quiz.swagger.dart';
import 'package:quiz/model/dto/score.dart';
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

  //day
  static Future<void> getUserChangeScoreDay({
    required BuildContext context,
  }) async {
    final api = Quiz.create(interceptors: [TokenIndicator()]);
    try {
      await api.apiV1ScoreGetUserChangeScoreDayListGet().then((postResult) {
        print("called day");

        final body = jsonDecode(postResult.bodyString)["data"]["top10"];
        final res = jsonDecode(postResult.bodyString);
        print(res);
        print(body);

        if (res["isSuccess"] == true) {
          context.read<ScoreState>().resetDailyUsers();

          List listScores = body;
          print(listScores);
          for (var element in listScores) {
            UserScore score = UserScore.fromJson(element);
            context.read<ScoreState>().getDailyUsers(value: score);
          }
        }
      });
    } catch (e) {
      print(e);
    }
  }

  static Future<void> getUserRewardsDaily({
    required BuildContext context,
  }) async {
    final api = Quiz.create(interceptors: [TokenIndicator()]);
    try {
      await api.apiV1ScoreGetDailyRewardListGet().then((postResult) {
        print("called day reward");

        final body = jsonDecode(postResult.bodyString)["data"];
        final res = jsonDecode(postResult.bodyString);
        print(res);
        print(body);

        if (res["isSuccess"] == true) {
          context.read<ScoreState>().resetDailyRewards();

          List listScores = body;
          print(listScores);
          for (var element in listScores) {
            context.read<ScoreState>().getDailyRewards(value: element);
          }
        }
      });
    } catch (e) {
      print(e);
    }
  }

  //Month
  static Future<void> getUserChangeScoreMonth({
    required BuildContext context,
  }) async {
    final api = Quiz.create(interceptors: [TokenIndicator()]);
    try {
      await api.apiV1ScoreGetUserChangeScoreMonthListGet().then((postResult) {
        print("called percent hint");

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

  //ALL
  static Future<void> getAllScores({
    required BuildContext context,
  }) async {
    final api = Quiz.create(interceptors: [TokenIndicator()]);
    try {
      await api.apiV1ScoreMaxScoreOfMonthScoreGet().then((postResult) {
        print("called percent hint");

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
}
