import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bilgimizde/provider/quiz.dart';
import 'package:bilgimizde/provider/score.dart';
import 'package:bilgimizde/view/home/dashboard/home_screen.dart';

class Result extends StatefulWidget {
  const Result({super.key});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Consumer<ScoreState>(
                    builder: (context, value, child) => Column(
                          children: [Text("Rank ${value.userRank}")],
                        )),
                Consumer<QuizState>(builder: (context, value, child) {
                  return Column(
                    children: [
                      Text("value.correctCount ${value.correctCount}"),
                      Text("value.false ${value.falseCount}"),
                      Text("value.total ${value.quiz!.quizQuestions.length}"),
                      RawMaterialButton(
                        onPressed: () {
                          context.read<QuizState>().resetCount();
                          Navigator.of(context).push(
                            PageRouteBuilder(
                                pageBuilder: (_, __, ___) => const HomeScreen(),
                                transitionDuration:
                                    const Duration(milliseconds: 500),
                                transitionsBuilder: (_, a, __, c) =>
                                    FadeTransition(
                                      opacity: a,
                                      child: c,
                                    )),
                          );
                        },
                        fillColor: Colors.red,
                        child: const Text("ok"),
                      )
                    ],
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
