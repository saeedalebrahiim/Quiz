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
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          width: 150,
          height: 80,
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    'Kutluk bilge kül kağan bilge',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.green),
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'lib/assets/images/answercard.png'),
                              fit: BoxFit.fill)),
                    ),
                  ],
                )
              ],
            ),
          ),
          decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                    color: Color.fromARGB(146, 0, 0, 0),
                    blurRadius: 50,
                    spreadRadius: 5)
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(7),
              border: Border.all(color: Colors.green, width: 5)),
        ),
        Container(
          width: 60,
          height: 18,
          child: Row(
            children: [
              SizedBox(
                width: 5,
              ),
              Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('lib/assets/images/tik.png'),
                        fit: BoxFit.fill)),
              ),
              Text(
                'Doğru',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 10),
              )
            ],
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.green),
        )
      ],
    );
  }
}
