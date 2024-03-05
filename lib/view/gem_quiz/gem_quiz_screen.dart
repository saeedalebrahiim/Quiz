import 'package:flutter/material.dart';
import 'package:bilgimizde/global.dart';

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
            image: const DecorationImage(
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
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 23,
                      height: 25,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                          'lib/assets/images/shopicon.png',
                        )),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 1),
                          child: Image.asset(
                            'lib/assets/images/gem.png',
                            width: 15,
                            height: 15,
                          ),
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        const Text(
                          '3012',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 23,
                      height: 25,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'lib/assets/images/questions.png'))),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 3.0,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Image.asset(
                    'lib/assets/images/wallettext.png',
                    width: 35,
                    height: 16,
                  ),
                ),
                Text(
                  'go to the wallet',
                  style: TextStyle(
                      color: const Color.fromARGB(255, 246, 176, 71),
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 20,
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 1,
                itemBuilder: (context, index) => GemListComponents(
                  price: '350',
                  gemCount: '60',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class GemListComponents extends StatelessWidget {
  final String price, gemCount;
  final Function()? onTap;
  const GemListComponents(
      {super.key, required this.price, required this.gemCount, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                price + 'TL',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15, bottom: 5),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.diamond,
                          size: 16,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          gemCount,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    width: 80,
                    height: 26,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 2, color: Color.fromARGB(255, 223, 72, 123)),
                        borderRadius: BorderRadius.circular(50),
                        image: DecorationImage(
                            image:
                                AssetImage('lib/assets/images/gemlistbtn.png'),
                            fit: BoxFit.fill),
                        color: Color.fromARGB(255, 224, 33, 98)),
                  ),
                )
              ],
            )
          ],
        ),
        height: 70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Color.fromARGB(255, 75, 86, 191),
              width: 2,
            ),
            color: Color.fromARGB(255, 18, 36, 192),
            image: DecorationImage(
                image: AssetImage('lib/assets/images/gemlistbg.png'),
                fit: BoxFit.fill)),
      ),
    );
  }
}
