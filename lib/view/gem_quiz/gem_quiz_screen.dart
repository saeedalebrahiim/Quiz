import 'package:flutter/material.dart';
import 'package:quiz/global.dart';

class GemQuizScreen extends StatelessWidget {
  const GemQuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: primaryColor,
            image: DecorationImage(
                image: AssetImage('lib/assets/images/gembg.png'),
                fit: BoxFit.fill)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 23,
                      height: 25,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                          'lib/assets/images/shopicon.png',
                        )),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 2.5),
                        child: Image.asset(
                          'lib/assets/images/gem.png',
                          width: 15,
                          height: 15,
                        ),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        '3012',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 23,
                      height: 25,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'lib/assets/images/questions.png'))),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 3.0,
            ),
            Image.asset(
              'lib/assets/images/wallettext.png',
              width: 100,
              height: 16,
            )
          ],
        ),
      ),
    );
  }
}
