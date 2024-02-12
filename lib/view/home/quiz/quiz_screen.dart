import 'package:flutter/material.dart';
import 'package:quiz/view/home/quiz/answer_card.dart';
import 'package:quiz/view/home/quiz/quizmodel/questions.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

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
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 0, 3, 66),
            image: DecorationImage(
                image: AssetImage('lib/assets/images/bg2.png'),
                fit: BoxFit.fill)),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
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
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('lib/assets/images/back.png'))),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 100,
              ),
              Text(
                question.questions,
                style: TextStyle(
                  shadows: [Shadow(color: Colors.white, blurRadius: 20)],
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 400,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('lib/assets/images/quizbg.png'),
                        fit: BoxFit.fill)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    Text(
                      'Doğru şıkkı seç:',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: 280,
                      height: 150,
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: question.options.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 2, crossAxisCount: 2),
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: AnswerCard(
                              question: '', isSelected: false, currentIndex: 1),
                        ),
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
