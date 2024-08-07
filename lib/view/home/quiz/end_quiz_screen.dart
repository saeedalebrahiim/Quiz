import 'package:bilgimizde/components/alarms_functions/no_coin.dart';
import 'package:bilgimizde/controller/Quiz/start_quiz.dart';
import 'package:bilgimizde/controller/profile/profile.dart';
import 'package:bilgimizde/controller/score/score.dart';
import 'package:bilgimizde/provider/quiz.dart';
import 'package:bilgimizde/view/home/dashboard/home_screen.dart';
import 'package:bilgimizde/view/myrating/all/all_screen.dart.dart';
import 'package:bilgimizde/view/myrating/today/today_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:bilgimizde/provider/profile.dart';

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
    ScoreController.getUserChangeScoreDay(context: context);
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
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 28.0),
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
                                  pageBuilder: (_, __, ___) =>
                                      const HomeScreen(),
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
                                    image: AssetImage(
                                        'lib/assets/images/back.png'),
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
                    height: 35,
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
                              'Test sonucu',
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
                                    "Başarıyla",
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Heeey! En iyi 50 oyuncu arasına girip ödül almaya çok yaklaştın! Belki de günlük ödülü kazandın.",
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
                                  Lottie.asset(
                                      "lib/assets/images/congrats.json",
                                      width: 123,
                                      height: 123),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  const Text(
                                    'Tebrikler!',
                                    style: TextStyle(
                                        color: Colors.orange,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18),
                                  ),
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Artık ',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 12),
                                      ),
                                      Text(
                                        'en iyi 50 kişi  ',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 96, 131, 255),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'arasındasın, böyle devam ',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                  const Text(
                                    'edersen ay sonunda nakit ödül alacaksın',
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
                                      child:
                                          Text(value.correctCount.toString()),
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
                                              const TodayScreen(),
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
                                  "Ödüllere git",
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
                                'Ay sonunda ödülü alan ilk 50 kişiden olmak için denemeye devam et.',
                                textAlign: TextAlign.center,
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
                    builder: (context, value, child) {
                      //  int second = 0;
                      print(value.userScore!.changes.toString() + "changes");

                      int time = DateTime.now().hour;
                      int state = time < 5
                          ? 1
                          : time < 10 && time >= 5
                              ? 2
                              : time < 15 && time >= 10
                                  ? 3
                                  : time < 20 && time >= 15
                                      ? 4
                                      : 0;
                      int change = state == 1
                          ? 250
                          : state == 2
                              ? 500
                              : state == 3
                                  ? 750
                                  : state == 4
                                      ? 1000
                                      : 100000000;

                      bool canPlay = false;
                      if (value.userScore != null) {
                        canPlay = value.userScore!.changes < change;
                        print(canPlay);
                      }

                      // int sec = time < 6
                      //     ? (21600) -
                      //         (((DateTime.now().hour * 60) +
                      //                 (DateTime.now().minute)) *
                      //             60)
                      //     : time < 12 && time >= 6
                      //         ? (43200) -
                      //             (((DateTime.now().hour * 60) +
                      //                     (DateTime.now().minute)) *
                      //                 60)
                      //         : time < 18 && time >= 12
                      //             ? (64800) -
                      //                 (((DateTime.now().hour * 60) +
                      //                         (DateTime.now().minute)) *
                      //                     60)
                      //             : time < 24 && time >= 18
                      //                 ? (86400) -
                      //                     (((DateTime.now().hour * 60) +
                      //                             (DateTime.now()
                      //                                 .minute)) *
                      //                         60)
                      //                 : 0;

                      return !canPlay
                          ? TimerCountdown(
                              format: CountDownTimerFormat.hoursMinutesSeconds,
                              timeTextStyle: const TextStyle(
                                  color: Colors.black, fontSize: 20),
                              colonsTextStyle: const TextStyle(
                                  color: Colors.black, fontSize: 18),
                              descriptionTextStyle: const TextStyle(
                                  color: Colors.black, fontSize: 8),
                              enableDescriptions: false,
                              spacerWidth: 2,
                              endTime: DateTime(
                                  DateTime.now().year,
                                  DateTime.now().month,
                                  DateTime.now().day,
                                  state == 1
                                      ? 5
                                      : state == 2
                                          ? 10
                                          : state == 3
                                              ? 15
                                              : state == 4
                                                  ? 20
                                                  : 23,
                                  0,
                                  0),
                              // controller:
                              //     CountTimerController(
                              //   endTime: DateTime(
                              //       DateTime.now()
                              //           .year,
                              //       DateTime.now()
                              //           .month,
                              //       DateTime.now()
                              //           .day,
                              //       state == 1
                              //           ? 5
                              //           : state ==
                              //                   2
                              //               ? 10
                              //               : state == 3
                              //                   ? 15
                              //                   : state == 4
                              //                       ? 20
                              //                       : 23,
                              //       59,
                              //       59),

                              //   //  DateTime.now().add(
                              //   //   const Duration(
                              //   //     days: 5,
                              //   //     hours: 14,
                              //   //     minutes: 27,
                              //   //     seconds: 34,
                              //   //   ),
                              //   // ),
                              // ),
                              onEnd: () {
                                print("Timer finished");
                                canPlay = true;
                                setState(() {});
                              },
                            )
                          : InkWell(
                              onTap: () {
                                // StartQuizController.startQuiz(context: context);
                                if (!tapedPlay) {
                                  print("tapped $tapedPlay");
                                  tapedPlay = true;
                                  print("tapped $tapedPlay");

                                  if (value.userBalance >= 2) {
                                    context.read<QuizState>().resetCount();
                                    StartQuizController.startQuiz(
                                            context: context)
                                        .then((value) {
                                      ProfileController.getUserBalance(
                                          context: context);
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
                            );
                    },
                  ),
                  // Consumer<ProfileState>(
                  //   builder: (context, value, child) => InkWell(
                  //     onTap: () {
                  //       // StartQuizController.startQuiz(context: context);
                  //       if (!tapedPlay) {
                  //         print("tapped $tapedPlay");
                  //         tapedPlay = true;
                  //         print("tapped $tapedPlay");

                  //         if (value.userBalance >= 2) {
                  //           context.read<QuizState>().resetCount();
                  //           StartQuizController.startQuiz(context: context)
                  //               .then((value) {
                  //             ProfileController.getUserBalance(
                  //                 context: context);
                  //             tapedPlay = false;
                  //           });
                  //         } else {
                  //           noCoinAlert(context);
                  //         }
                  //       }
                  //     },
                  //     child: Container(
                  //       width: 221,
                  //       height: 48,
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(20),
                  //         color: const Color.fromARGB(255, 86, 196, 90),
                  //       ),
                  //       child: const Center(
                  //         child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           children: [
                  //             Icon(
                  //               Icons.refresh,
                  //               color: Colors.white,
                  //               size: 20,
                  //             ),
                  //             SizedBox(
                  //               width: 3,
                  //             ),
                  //             Text(
                  //               'Again',
                  //               style: TextStyle(
                  //                   color: Colors.white,
                  //                   fontWeight: FontWeight.w700,
                  //                   fontSize: 16),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 15,
                  ),
                  // InkWell(
                  //   onTap: () {
                  //     Navigator.of(context).pushAndRemoveUntil(
                  //       PageRouteBuilder(
                  //         pageBuilder: (_, __, ___) => const HomeScreen(),
                  //         transitionDuration: const Duration(milliseconds: 500),
                  //         transitionsBuilder: (_, a, __, c) => FadeTransition(
                  //           opacity: a,
                  //           child: c,
                  //         ),
                  //       ),
                  //       (route) => false,
                  //     );
                  //   },
                  //   child: Container(
                  //     width: 221,
                  //     height: 48,
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(20),
                  //       color: Colors.black,
                  //     ),
                  //     child: const Center(
                  //       child: Text(
                  //         'Home',
                  //         style: TextStyle(
                  //             color: Colors.white,
                  //             fontWeight: FontWeight.w700,
                  //             fontSize: 16),
                  //       ),
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
