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
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          width: 150,
          height: 80,
          decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                    color: Color.fromARGB(146, 0, 0, 0),
                    blurRadius: 50,
                    spreadRadius: 5)
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(7),
              border: Border.all(
                  color: isWrongAnswer
                      ? Colors.red
                      : widget.isSelected
                          ? Colors.green
                          : Colors.white,
                  width: 5)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    widget.question,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: isWrongAnswer
                          ? Colors.red
                          : (widget.isSelected ? Colors.green : Colors.black),
                    ),
                  ),
                ),
                widget.helpPercentage != null
                    ? TweenAnimationBuilder<double>(
                        duration: const Duration(seconds: 1),
                        tween: Tween(begin: 0, end: widget.helpPercentage),
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
                                        backgroundColor: Colors.grey,
                                        color: Colors.orange,
                                        value: value,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        })
                    : const SizedBox()
              ],
            ),
          ),
        ),
        isWrongAnswer
            ? Container(
                width: 60,
                height: 18,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: Colors.red),
                child: const Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Icon(Icons.cancel),
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
              )
            : widget.isSelected
                ? Container(
                    width: 60,
                    height: 18,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
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
                                  image:
                                      AssetImage('lib/assets/images/tik.png'),
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
                  )
                : const SizedBox(),
      ],
    );
  }
}
