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
              const SizedBox(
                height: 100,
              ),
              Text(
                value.quiz!.quizQuestions[widget.index].questionText,
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
                height: 400,
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
                    SizedBox(
                      width: 280,
                      height: 150,
                      child: GridView(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 2, crossAxisCount: 2),
                        children: [
                          Padding(
                            padding: EdgeInsets.all(7.0),
                            child: AnswerCard(
                              question: value
                                  .quiz!.quizQuestions[widget.index].answer1,
                              isSelected: false,
                              correctAnswerIndex: value.quiz!
                                  .quizQuestions[widget.index].currectAnswer,
                              currentIndex: 1,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(7.0),
                            child: AnswerCard(
                              question: value
                                  .quiz!.quizQuestions[widget.index].answer2,
                              isSelected: false,
                              correctAnswerIndex: value.quiz!
                                  .quizQuestions[widget.index].currectAnswer,
                              currentIndex: 2,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(7.0),
                            child: AnswerCard(
                              question: value
                                  .quiz!.quizQuestions[widget.index].answer3,
                              isSelected: false,
                              correctAnswerIndex: value.quiz!
                                  .quizQuestions[widget.index].currectAnswer,
                              currentIndex: 3,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(7.0),
                            child: AnswerCard(
                              question: value
                                  .quiz!.quizQuestions[widget.index].answer4,
                              isSelected: false,
                              correctAnswerIndex: value.quiz!
                                  .quizQuestions[widget.index].currectAnswer,
                              currentIndex: 4,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              width: 80,
                              height: 60,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage('lib/assets/images/1.png'),
                                      fit: BoxFit.fill)),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              width: 95,
                              height: 58,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage('lib/assets/images/2.png'),
                                      fit: BoxFit.fill)),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              width: 90,
                              height: 60,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage('lib/assets/images/3.png'),
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
