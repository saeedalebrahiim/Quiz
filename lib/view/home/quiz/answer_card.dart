import 'package:flutter/material.dart';

class AnswerCard extends StatelessWidget {
  final String question;
  final bool isSelected;
  final int? correctAnswerIndex;
  final int? selectedAnswerIndex;
  final int currentIndex;
  const AnswerCard(
      {super.key,
      required this.question,
      required this.isSelected,
      this.correctAnswerIndex,
      this.selectedAnswerIndex,
      required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    bool isCorrectAnswer = currentIndex == correctAnswerIndex;
    bool isWrongAnswer = !isCorrectAnswer && isSelected;
    return Container(
      width: 150,
      height: 70,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Color.fromARGB(146, 0, 0, 0),
            blurRadius: 50,
            spreadRadius: 5)
      ], color: Colors.white, borderRadius: BorderRadius.circular(7)),
    );
  }
}
