import 'package:flutter/material.dart';
import 'package:quiz/global.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: primaryColor,
              image: const DecorationImage(
                  image: AssetImage('lib/assets/images/faqbg.png'),
                  fit: BoxFit.fill))),
    );
  }
}
