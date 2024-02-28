import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/global.dart';
import 'package:quiz/provider/quiz.dart';
import 'package:quiz/view/home/quiz/answer_card.dart';
import 'package:quiz/view/home/quiz/quizmodel/questions.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key, required this.index});
  final int index;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int selectedIndex = 0;
  bool isSelectedAny = false;

  @override
  Widget build(BuildContext context) {
    final question = questions[0];
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            color: primaryColor,
            image: const DecorationImage(
                image: AssetImage('lib/assets/images/bg2.png'),
                fit: BoxFit.fill)),
        child: Consumer<QuizState>(
          builder: (context, value, child) => Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 20),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('lib/assets/images/back.png'))),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                value.quiz!.quizQuestions[widget.index].questionText,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  shadows: [Shadow(color: Colors.white, blurRadius: 20)],
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 450,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('lib/assets/images/quizbg.png'),
                        fit: BoxFit.fill)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    const Text(
                      'Doğru şıkkı seç:',
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Wrap(
                      direction: Axis.horizontal,
                      children: [
                        IgnorePointer(
                          ignoring: isSelectedAny,
                          child: RawMaterialButton(
                            onPressed: () {
                              print("wt");
                              setState(() {
                                isSelectedAny = true;
                                selectedIndex = 1;
                              });
                            },
                            child: Padding(
                              padding: EdgeInsets.all(7.0),
                              child: AnswerCard(
                                question: value
                                    .quiz!.quizQuestions[widget.index].answer1,
                                isSelected: selectedIndex == 1,
                                correctAnswerIndex: value.quiz!
                                    .quizQuestions[widget.index].currectAnswer,
                                currentIndex: 1,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(7.0),
                          child: IgnorePointer(
                            ignoring: isSelectedAny,
                            child: RawMaterialButton(
                              onPressed: () {
                                setState(() {
                                  isSelectedAny = true;

                                  selectedIndex = 2;
                                });
                              },
                              child: AnswerCard(
                                question: value
                                    .quiz!.quizQuestions[widget.index].answer2,
                                isSelected: selectedIndex == 2,
                                correctAnswerIndex: value.quiz!
                                    .quizQuestions[widget.index].currectAnswer,
                                currentIndex: 2,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(7.0),
                          child: IgnorePointer(
                            ignoring: isSelectedAny,
                            child: RawMaterialButton(
                              onPressed: () {
                                setState(() {
                                  isSelectedAny = true;

                                  selectedIndex = 3;
                                });
                              },
                              child: AnswerCard(
                                question: value
                                    .quiz!.quizQuestions[widget.index].answer3,
                                isSelected: selectedIndex == 3,
                                correctAnswerIndex: value.quiz!
                                    .quizQuestions[widget.index].currectAnswer,
                                currentIndex: 3,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(7.0),
                          child: IgnorePointer(
                            ignoring: isSelectedAny,
                            child: RawMaterialButton(
                              onPressed: () {
                                setState(() {
                                  isSelectedAny = true;

                                  selectedIndex = 4;
                                });
                              },
                              child: AnswerCard(
                                question: value
                                    .quiz!.quizQuestions[widget.index].answer4,
                                isSelected: selectedIndex == 4,
                                correctAnswerIndex: value.quiz!
                                    .quizQuestions[widget.index].currectAnswer,
                                currentIndex: 4,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    isSelectedAny
                        ? Padding(
                            padding: const EdgeInsets.all(10),
                            child: SizedBox(
                              width: 300,
                              child: RawMaterialButton(
                                onPressed: () {},
                                fillColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: const Text(
                                  "Next",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          )
                        : SizedBox(),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IgnorePointer(
                            ignoring: isSelectedAny,
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                width: 80,
                                height: 60,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'lib/assets/images/1.png'),
                                        fit: BoxFit.fill)),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          IgnorePointer(
                            ignoring: isSelectedAny,
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                width: 95,
                                height: 58,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'lib/assets/images/2.png'),
                                        fit: BoxFit.fill)),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          isSelectedAny
                              ? InkWell(
                                  onTap: () {},
                                  child: Container(
                                    width: 90,
                                    height: 60,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'lib/assets/images/3.png'),
                                            fit: BoxFit.fill)),
                                  ),
                                )
                              : InkWell(
                                  onTap: () {},
                                  child: Container(
                                    width: 90,
                                    height: 60,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'lib/assets/images/3.png'),
                                            fit: BoxFit.fill)),
                                  ),
                                ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
