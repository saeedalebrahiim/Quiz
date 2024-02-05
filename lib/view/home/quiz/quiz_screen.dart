import 'package:flutter/material.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 0, 3, 66),
          image: DecorationImage(
              image: AssetImage('lib/assets/images/bg2.png'),
              fit: BoxFit.fill)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 400,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('lib/assets/images/quizbg.png'),
                    fit: BoxFit.fill)),
          )
        ],
      ),
    );
  }
}
