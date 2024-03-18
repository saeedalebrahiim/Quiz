import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AnswerCard extends StatefulWidget {
  final String question;
  final bool isSelected;
  final bool? helpBomb;
  final double? helpPercentage;
  final int? correctAnswerIndex;
  final int? selectedAnswerIndex;
  final int currentIndex;
  const AnswerCard(
      {super.key,
      required this.question,
      required this.isSelected,
      this.correctAnswerIndex,
      this.selectedAnswerIndex,
      required this.currentIndex,
      this.helpBomb,
      this.helpPercentage});

  @override
  State<AnswerCard> createState() => _AnswerCardState();
}

class _AnswerCardState extends State<AnswerCard> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    bool isCorrectAnswer = widget.currentIndex == widget.correctAnswerIndex;
    bool isWrongAnswer = !isCorrectAnswer && widget.isSelected;
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Container(
            width: 163,
            height: 77,
            decoration: BoxDecoration(
                boxShadow: !widget.isSelected
                    ? const [
                        BoxShadow(
                            color: Color.fromARGB(34, 255, 255, 255),
                            blurRadius: 30,
                            spreadRadius: 5)
                      ]
                    : isWrongAnswer
                        ? const [
                            BoxShadow(
                                color: Color.fromARGB(154, 244, 67, 54),
                                blurRadius: 50,
                                offset: Offset(0, 25),
                                spreadRadius: 5)
                          ]
                        : const [
                            BoxShadow(
                                color: Color.fromARGB(144, 76, 175, 79),
                                blurRadius: 30,
                                offset: Offset(0, 25),
                                spreadRadius: 5)
                          ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    color: isWrongAnswer
                        ? Colors.red
                        : widget.isSelected
                            ? Colors.green
                            : Colors.white,
                    width: 5)),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(
                        widget.question.length < 16 == true ? 5 : 2),
                    child: Text(
                      widget.question,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: widget.question.length < 16 == true ? 16 : 12,
                        color: isWrongAnswer
                            ? Colors.red
                            : (widget.isSelected ? Colors.green : Colors.black),
                      ),
                    ),
                  ),
                  widget.helpPercentage != null
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: TweenAnimationBuilder<double>(
                              duration: const Duration(seconds: 1),
                              tween:
                                  Tween(begin: 0, end: widget.helpPercentage),
                              builder: (context, value, child) {
                                return AnimationConfiguration.synchronized(
                                  duration: const Duration(milliseconds: 500),
                                  child: SlideAnimation(
                                    verticalOffset: 50.0,
                                    child: FadeInAnimation(
                                      child: Row(
                                        children: [
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          const Icon(
                                            Icons.groups,
                                            color: Colors.orange,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          SizedBox(
                                            width: 100,
                                            child: LinearProgressIndicator(
                                              backgroundColor:
                                                  Colors.grey.shade300,
                                              color: Colors.orange,
                                              value: value,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        )
                      : const SizedBox()
                ],
              ),
            ),
          ),
          isWrongAnswer
              ? Positioned(
                  bottom: -10,
                  child: Container(
                    width: 88,
                    height: 26,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromARGB(86, 244, 67, 54),
                              blurRadius: 10,
                              spreadRadius: 0)
                        ],
                        color: Colors.red),
                    child: const Row(
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.cancel,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          //TODO Change to TR
                          'False',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 10),
                        )
                      ],
                    ),
                  ),
                )
              : widget.isSelected
                  ? Positioned(
                      bottom: -12,
                      child: Container(
                        width: 88,
                        height: 26,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromARGB(61, 76, 175, 79),
                                  blurRadius: 10,
                                  spreadRadius: 0)
                            ],
                            color: Colors.green),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: 15,
                              height: 15,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'lib/assets/images/tik.png'),
                                      fit: BoxFit.fill)),
                            ),
                            const Text(
                              'Doğru',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10),
                            )
                          ],
                        ),
                      ),
                    )
                  : const SizedBox(),
        ],
      ),
    );
  }
}
