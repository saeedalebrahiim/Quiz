import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bilgimizde/model/api/swagger/generated/quiz.swagger.dart';
import 'package:bilgimizde/model/dto/score.dart';
import 'package:bilgimizde/provider/score.dart';
import 'package:bilgimizde/services/headers.dart';

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
          final userScore =
              jsonDecode(postResult.bodyString)["data"]["userScore"];
          UserScore usScore = UserScore.fromJson(userScore);
          context.read<ScoreState>().getUserDay(value: usScore);
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
        print("called Month");

        final body = jsonDecode(postResult.bodyString)["data"];
        final res = jsonDecode(postResult.bodyString);
        print(res);
        print(body);

        if (res["isSuccess"] == true) {
          context.read<ScoreState>().resetMonthlyUsers();

          List listScores = body;
          print(listScores);
          for (var element in listScores) {
            UserScore score = UserScore.fromJson(element);
            context.read<ScoreState>().getMonthlyUsers(value: score);
          }
        }
      });
    } catch (e) {
      print(e);
    }
  }

  //all

  static Future<void> getTab3({
    required BuildContext context,
  }) async {
    final api = Quiz.create(interceptors: [TokenIndicator()]);
    try {
      await api
          .apiV1StartQuizAnsweredCountInMonthListGet(
        selecteddatetime: DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime(DateTime.now().year, DateTime.now().month + 1, 0).day,
        ),
      )
          .then((postResult) {
        print("called Month");

        final body = jsonDecode(postResult.bodyString)["data"];
        final res = jsonDecode(postResult.bodyString);
        print(res);
        print(body);

        if (res["isSuccess"] == true) {
          context.read<ScoreState>().resetAllUsers();

          List listScores = body;
          print(listScores);
          for (var element in listScores) {
            AllRewardScore score = AllRewardScore.fromJson(element);
            context.read<ScoreState>().getAllUsers(value: score);
          }
        }
      });
    } catch (e) {
      print(e);
    }
  }

  //ALL

  // static Future<void> getAllScores({
  //   required BuildContext context,
  // }) async {
  //   final api = Quiz.create(interceptors: [TokenIndicator()]);
  //   try {
  //     await api
  //         .apiV1ScoreMaxScoreOfMonthScoreGet(
  //       count: 50,
  //       dateTime: DateTime(DateTime.now().year, DateTime.now().month, 1),
  //     )
  //         .then((postResult) {
  //       print("called Month");

  //       final body = jsonDecode(postResult.bodyString)["data"];
  //       final res = jsonDecode(postResult.bodyString);
  //       print(res);
  //       print(body);

  //       if (res["isSuccess"] == true) {
  //         context.read<ScoreState>().resetAllUsers();

  //         List listScores = body;
  //         print(listScores);
  //         for (var element in listScores) {
  //           RewardScore score = RewardScore.fromJson(element);
  //           context.read<ScoreState>().getAllUsers(value: score);
  //         }
  //       }
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  static Future<void> getAllRewards({
    required BuildContext context,
  }) async {
    final api = Quiz.create(interceptors: [TokenIndicator()]);
    try {
      await api.apiV1ScoreGetRewardListGet().then((postResult) {
        print("called Month");

        final body = jsonDecode(postResult.bodyString)["data"];
        final res = jsonDecode(postResult.bodyString);
        print(res);
        print(body);

        if (res["isSuccess"] == true) {
          context.read<ScoreState>().resetAllRewards();

          List listScores = body;
          print(listScores);
          for (var element in listScores) {
            context.read<ScoreState>().getAllRewards(value: element);
          }
        }
      });
    } catch (e) {
      print(e);
    }
  }
}
