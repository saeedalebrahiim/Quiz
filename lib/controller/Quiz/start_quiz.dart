import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/model/api/swagger/generated/quiz.swagger.dart';
import 'package:quiz/model/dto/question.dart';
import 'package:quiz/model/dto/quiz.dart';
import 'package:quiz/provider/banners.dart';
import 'package:quiz/provider/quiz.dart';
import 'package:quiz/view/home/quiz/quiz_screen.dart';

class StartQuizController {
  static Future<void> startQuiz({required BuildContext context}) async {
    final api = Quiz.create();
    try {
      await api.apiV1StartQuizStartQuizGet().then((postResult) {
        print("called start");

        final body = jsonDecode(postResult.bodyString)["data"];
        if (postResult.isSuccessful == true) {
          List<QuestionsDto> questions = [];
          List jsonQuestions = body['quizQuestions'];
          jsonQuestions.forEach((element) {
            questions.add(QuestionsDto.fromJson(element));
          });
          QuizDto quiz = QuizDto(
              quizId: body['quizId'],
              dQuizId: body['dQuizId'],
              quizQuestions: body['quizQuestions']);
          context.read<QuizState>().getQuiz(value: quiz);
          Navigator.of(context).push(
            PageRouteBuilder(
                pageBuilder: (_, __, ___) => const QuizScreen(index: 1),
                transitionDuration: const Duration(milliseconds: 500),
                transitionsBuilder: (_, a, __, c) => FadeTransition(
                      opacity: a,
                      child: c,
                    )),
          );
        }
      });
    } catch (e) {
      // print(e);
    }
  }
}
