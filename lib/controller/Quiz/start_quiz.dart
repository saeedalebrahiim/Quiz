import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/model/api/swagger/generated/quiz.swagger.dart';
import 'package:quiz/model/dto/question.dart';
import 'package:quiz/model/dto/quiz.dart';
import 'package:quiz/provider/banners.dart';
import 'package:quiz/provider/quiz.dart';
import 'package:quiz/provider/stop_watch.dart';
import 'package:quiz/services/headers.dart';
import 'package:quiz/view/home/dashboard/home_screen.dart';
import 'package:quiz/view/home/quiz/quiz_screen.dart';
import 'package:quiz/view/home/quiz/result.dart';

class StartQuizController {
  static Future<void> startQuiz({required BuildContext context}) async {
    final api = Quiz.create(interceptors: [TokenIndicator()]);
    try {
      await api.apiV1StartQuizStartQuizGet().then((postResult) {
        print("called start");

        final body = jsonDecode(postResult.bodyString)["data"];
        final res = jsonDecode(postResult.bodyString);
        print(res);
        print(body);

        if (res["isSuccess"] == true) {
          List<QuestionsDto> questions = [];
          List jsonQuestions = body['quizQuestions'];
          jsonQuestions.forEach((element) {
            questions.add(QuestionsDto.fromJson(element));
          });
          QuizDto quiz = QuizDto(
              quizId: body['quizId'],
              dQuizId: body['dQuizId'],
              quizQuestions: questions);
          context.read<QuizState>().getQuiz(value: quiz);

          Navigator.of(context).push(
            PageRouteBuilder(
                pageBuilder: (_, __, ___) => const QuizScreen(index: 0),
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

  static Future<void> addAwnswer({
    required int userQuizId,
    required int userDQuizId,
    required int questionId,
    required int selectedAnswer,
    required int questionNumber,
    bool? isLast,
    required BuildContext context,
  }) async {
    final api = Quiz.create(interceptors: [TokenIndicator()]);
    try {
      print("questionId $questionId");
      print("selectedAnswer $selectedAnswer");
      print("userDQuizId $userDQuizId");
      print("userQuizId $userQuizId");

      await api
          .apiV1StartQuizAddAnswerPost(
        questionId: questionId,
        selectedAnswer: selectedAnswer,
        userDQuizId: userDQuizId,
        userQuizId: userQuizId,
      )
          .then((postResult) {
        print("called start");

        final body = jsonDecode(postResult.bodyString)["data"];
        final res = jsonDecode(postResult.bodyString);
        print(res);
        print(body);

        // if (res["isSuccess"] == true) {
        if (isLast ?? false) {
          //reort
          viewUserQuizReport(quizId: userQuizId, context: context);
        } else {
          Navigator.of(context).push(
            PageRouteBuilder(
                pageBuilder: (_, __, ___) =>
                    QuizScreen(index: (questionNumber + 1)),
                transitionDuration: const Duration(milliseconds: 500),
                transitionsBuilder: (_, a, __, c) => FadeTransition(
                      opacity: a,
                      child: c,
                    )),
          );
        }
        // }
      });
    } catch (e) {
      print(e);
    }
  }

  static Future<void> viewUserQuizReport({
    required int quizId,
    required BuildContext context,
  }) async {
    final api = Quiz.create(interceptors: [TokenIndicator()]);
    try {
      await api
          .apiV1StartQuizViewUserQuizReportByQuizIdGet(quizId: quizId)
          .then((postResult) {
        print("called result");

        final body = jsonDecode(postResult.bodyString)["data"];
        final res = jsonDecode(postResult.bodyString);
        print(res);
        print(body);

        if (res["isSuccess"] == true) {
          Navigator.of(context).push(
            PageRouteBuilder(
                pageBuilder: (_, __, ___) => const Result(),
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

  static Future<void> hintPercent({
    required int questionId,
    required BuildContext context,
  }) async {
    final api = Quiz.create(interceptors: [TokenIndicator()]);
    try {
      await api
          .apiV1StartQuizShowPercentSelectedAnswerGet(questionId: questionId)
          .then((postResult) {
        print("called percent hint");

        final body = jsonDecode(postResult.bodyString)["data"];
        final res = jsonDecode(postResult.bodyString);
        print(res);
        print(body);

        if (res["isSuccess"] == true) {
          UserPercentageHint hint = UserPercentageHint.fromJson(body);
          context.read<QuizState>().addPercentHint(hint);
        }
      });
    } catch (e) {
      print(e);
    }
  }

  static Future<void> hinteliminate({
    required int questionId,
    required BuildContext context,
  }) async {
    final api = Quiz.create(interceptors: [TokenIndicator()]);
    try {
      await api
          .apiV1StartQuizShowWrongAnswerGet(questionId: questionId)
          .then((postResult) {
        print("called percent hint");

        final body = jsonDecode(postResult.bodyString)["data"];
        final res = jsonDecode(postResult.bodyString);
        print(res);
        print(body);
        List n = body;
        print(n);
        if (res["isSuccess"] == true) {
          context.read<QuizState>().addEliminateAnswers(n.first, n.last);
        }
      });
    } catch (e) {
      print(e);
    }
  }

  static Future<void> reportQuestion({
    required int questionId,
    required BuildContext context,
  }) async {
    final api = Quiz.create(interceptors: [TokenIndicator()]);
    try {
      await api
          .apiV1ReportQuestionSubmitReportPost(questionId: questionId)
          .then((postResult) {
        print("called report hint");

        final body = jsonDecode(postResult.bodyString)["data"];
        final res = jsonDecode(postResult.bodyString);
        // print(res);
        // print(body);
        // List n = body;
        // print(n);
        // if (res["isSuccess"] == true) {
        //   context.read<QuizState>().addEliminateAnswers(n.first, n.last);
        // }
      });
    } catch (e) {
      print(e);
    }
  }
}
