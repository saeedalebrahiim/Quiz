import 'package:bilgimizde/components/alarms_functions/no_coin.dart';
import 'package:bilgimizde/controller/Quiz/start_quiz.dart';
import 'package:bilgimizde/controller/profile/profile.dart';
import 'package:bilgimizde/provider/quiz.dart';
import 'package:bilgimizde/view/buycoin/buy_coin_screen.dart';
import 'package:bilgimizde/view/home/dashboard/home_screen.dart';
import 'package:bilgimizde/view/myrating/all/all_screen.dart.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:bilgimizde/provider/profile.dart';
import 'package:bilgimizde/view/profile/profile_screen.dart';

class EndQuizScreen extends StatefulWidget {
  const EndQuizScreen({super.key});

  @override
  State<EndQuizScreen> createState() => _EndQuizScreenState();
}

class _EndQuizScreenState extends State<EndQuizScreen> {
  bool tapedPlay = false;
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() {
    StartQuizController.getIsTop50(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      onWillPop: () async {
        Navigator.of(context).pushAndRemoveUntil(
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => const HomeScreen(),
            transitionDuration: const Duration(milliseconds: 500),
            transitionsBuilder: (_, a, __, c) => FadeTransition(
              opacity: a,
              child: c,
            ),
          ),
          (route) => false,
        );
        return true;
      },
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 10, 21, 94),
              image: DecorationImage(
                  image: AssetImage('lib/assets/images/bg2.png'),
                  fit: BoxFit.fill)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 20),
                        child: InkWell(
                          onTap: () {
                            // Navigator.pop(context);
                            Navigator.of(context).pushAndRemoveUntil(
                              PageRouteBuilder(
                                pageBuilder: (_, __, ___) => const HomeScreen(),
                                transitionDuration:
                                    const Duration(milliseconds: 500),
                                transitionsBuilder: (_, a, __, c) =>
                                    FadeTransition(
                                  opacity: a,
                                  child: c,
                                ),
                              ),
                              (route) => false,
                            );
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image:
                                      AssetImage('lib/assets/images/back.png'),
                                ),
                                color: const Color.fromARGB(255, 10, 21, 94),
                                borderRadius: BorderRadius.circular(30)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Consumer<QuizState>(
                  builder: (context, value, child) => Visibility(
                    visible: value.isTop50 != null,
                    replacement: const Center(
                      child: CircularProgressIndicator(),
                    ),
                    child: Container(
                      height: 367,
                      width: 276,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'End of the Test',
                            style: TextStyle(
                                color: Color.fromARGB(255, 96, 131, 255),
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Visibility(
                            visible: value.isTop50 == true,
                            replacement: Column(
                              children: [
                                Lottie.asset("lib/assets/images/done.json",
                                    width: 123, height: 123),
                                const SizedBox(
                                  height: 2,
                                ),
                                const Text(
                                  "Successfuly",
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "You are too close to be among 50 best players and grant Prize",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Lottie.asset("lib/assets/images/congrats.json",
                                    width: 123, height: 123),
                                const SizedBox(
                                  height: 2,
                                ),
                                const Text(
                                  'Congrats!',
                                  style: TextStyle(
                                      color: Colors.orange,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18),
                                ),
                                const Text(
                                  'You are among',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12),
                                ),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'best 50 players , ',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 96, 131, 255),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                    Text(
                                      'So  you grant',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                                const Text(
                                  'prize at end of the season',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: SizedBox(
                              width: 300,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(value.correctCount.toString()),
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: LinearProgressIndicator(
                                      backgroundColor: Colors.red,
                                      color: Colors.green,
                                      value: value.correctCount.toDouble() /
                                          (value.correctCount +
                                              value.falseCount),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(value.falseCount.toString()),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 194,
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromARGB(75, 2, 38, 3),
                                    blurRadius: 50,
                                    offset: Offset(0, 5),
                                    spreadRadius: 1)
                              ],
                            ),
                            child: RawMaterialButton(
                              onPressed: () {
                                Navigator.of(context).pushAndRemoveUntil(
                                    PageRouteBuilder(
                                        pageBuilder: (_, __, ___) =>
                                            const AllScreen(),
                                        transitionDuration:
                                            const Duration(milliseconds: 500),
                                        transitionsBuilder: (_, a, __, c) =>
                                            FadeTransition(
                                              opacity: a,
                                              child: c,
                                            )),
                                    (route) => false);
                              },
                              fillColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: const Text(
                                "See top 50 Players",
                              ),
                            ),
                          ),
                          //TODO
                          // value.isTop50 == true
                          //     ? Container(
                          //         width: 150,
                          //         height: 30,
                          //         decoration: BoxDecoration(
                          //             borderRadius: BorderRadius.circular(20),
                          //             color: Colors.white,
                          //             boxShadow: [
                          //               BoxShadow(
                          //                   blurRadius: 10,
                          //                   spreadRadius: 0.5,
                          //                   color: Colors.grey.shade300)
                          //             ]),
                          //         child: const Center(
                          //           child: Text(
                          //             'See Best 50 Players',
                          //             style: TextStyle(
                          //                 color: Colors.black,
                          //                 fontWeight: FontWeight.w700,
                          //                 fontSize: 14),
                          //           ),
                          //         ),
                          //       )
                          //     : SizedBox()
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Consumer<QuizState>(builder: (context, value, child) {
                  return value.isTop50 == true
                      ? Column(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'lib/assets/images/light.png'),
                                      fit: BoxFit.fill)),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Try to stay among 50 players to grant prize',
                              style: TextStyle(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14),
                            ),
                            const Text(
                              'at end of the season',
                              style: TextStyle(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14),
                            ),
                          ],
                        )
                      : const SizedBox();
                }),
                const SizedBox(
                  height: 10,
                ),
                Consumer<ProfileState>(
                  builder: (context, value, child) => InkWell(
                    onTap: () {
                      // StartQuizController.startQuiz(context: context);
                      if (!tapedPlay) {
                        print("tapped $tapedPlay");
                        tapedPlay = true;
                        print("tapped $tapedPlay");

                        if (value.userBalance >= 2) {
                          context.read<QuizState>().resetCount();
                          StartQuizController.startQuiz(context: context)
                              .then((value) {
                            ProfileController.getUserBalance(context: context);
                            tapedPlay = false;
                          });
                        } else {
                          noCoinAlert(context);
                        }
                      }
                    },
                    child: Container(
                      width: 221,
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 86, 196, 90),
                      ),
                      child: const Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.refresh,
                              color: Colors.white,
                              size: 20,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              'Again',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                          pageBuilder: (_, __, ___) => const HomeScreen(),
                          transitionDuration: const Duration(milliseconds: 500),
                          transitionsBuilder: (_, a, __, c) => FadeTransition(
                                opacity: a,
                                child: c,
                              )),
                    );
                  },
                  child: Container(
                    width: 221,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black,
                    ),
                    child: const Center(
                      child: Text(
                        'Home',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
