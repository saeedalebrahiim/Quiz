import 'package:flutter/material.dart';
import 'package:quiz/global.dart';

class SingleFaqScreen extends StatelessWidget {
  final String answer;
  SingleFaqScreen({super.key, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: primaryColor,
            image: const DecorationImage(
                image: AssetImage('lib/assets/images/bg1.png'),
                fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
                            image: AssetImage('lib/assets/images/back.png'))),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  'Quiz FAQ',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ),
              ),
              const SizedBox(
                width: 65,
              )
            ]),
            Center(
              child: Padding(
                padding: EdgeInsets.only(left: 22, right: 22, top: 10),
                child: Text(
                  maxLines: 10,
                  answer,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: Center(
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        width: 250,
                        height: 50,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('lib/assets/images/faqbtn.png'),
                                fit: BoxFit.fill)),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}