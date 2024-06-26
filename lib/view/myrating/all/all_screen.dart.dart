import 'package:bilgimizde/view/buycoin/buy_coin_test.dart';
import 'package:bilgimizde/view/home/dashboard/home_screen.dart';
import 'package:bilgimizde/view/rules/rules_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:bilgimizde/components/rating_card/all_reward.dart';
import 'package:bilgimizde/controller/score/score.dart';
import 'package:bilgimizde/provider/profile.dart';
import 'package:bilgimizde/provider/score.dart';
import 'package:bilgimizde/view/buycoin/buy_coin_screen.dart';
import 'package:bilgimizde/view/myrating/onemonth/one_month_screen.dart.dart';
import 'package:bilgimizde/view/myrating/today/today_screen.dart';

class AllScreen extends StatefulWidget {
  const AllScreen({super.key});

  @override
  State<AllScreen> createState() => _AllScreenState();
}

class _AllScreenState extends State<AllScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() {
    // ScoreController.getAllScores(context: context);
    ScoreController.getTab3(context: context);
    ScoreController.getAllRewards(context: context);
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
                                image: AssetImage(
                                    'lib/assets/images/appbaricon.png'),
                              ),
                              color: const Color.fromARGB(255, 10, 21, 94),
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 23),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                                pageBuilder: (_, __, ___) => const BuyCoin(),
                                transitionDuration:
                                    const Duration(milliseconds: 500),
                                transitionsBuilder: (_, a, __, c) =>
                                    FadeTransition(
                                      opacity: a,
                                      child: c,
                                    )),
                          );
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'lib/assets/images/coin.png',
                              width: 25,
                              height: 25,
                            ),
                            Consumer<ProfileState>(
                              builder: (context, value, child) {
                                var formattedNumber = NumberFormat.compact()
                                    .format(value.userBalance);
                                return Text(
                                  formattedNumber,
                                  //  value.userBalance.toString(),
                                  style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15, top: 20),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                                pageBuilder: (_, __, ___) =>
                                    const RulesScreen(),
                                transitionDuration:
                                    const Duration(milliseconds: 500),
                                transitionsBuilder: (_, a, __, c) =>
                                    FadeTransition(
                                      opacity: a,
                                      child: c,
                                    )),
                          );
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage(
                                    'lib/assets/images/questions.png'),
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
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: Container(
                    height: 35,
                    width: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: const Color.fromARGB(255, 204, 118, 217)),
                    child: RawMaterialButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          PageRouteBuilder(
                              pageBuilder: (_, __, ___) => const TodayScreen(),
                              transitionDuration:
                                  const Duration(milliseconds: 500),
                              transitionsBuilder: (_, a, __, c) =>
                                  FadeTransition(
                                    opacity: a,
                                    child: c,
                                  )),
                        );
                      },
                      child: const Center(
                        child: Text(
                          "Günlük Ödül",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: Container(
                    height: 35,
                    width: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: const Color.fromARGB(255, 204, 118, 217)),
                    child: RawMaterialButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          PageRouteBuilder(
                              pageBuilder: (_, __, ___) =>
                                  const OneMonthScreen(),
                              transitionDuration:
                                  const Duration(milliseconds: 500),
                              transitionsBuilder: (_, a, __, c) =>
                                  FadeTransition(
                                    opacity: a,
                                    child: c,
                                  )),
                        );
                      },
                      child: const Center(
                        child: Text(
                          "Aylık sıralamam",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    height: 35,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.transparent,
                        border: Border.all(
                            color: Colors.white,
                            width: 2,
                            style: BorderStyle.solid)),
                    child: const Center(
                      child: Text(
                        "Aylık Ödül",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ]),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 260,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: 175,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(27)),
                                width: MediaQuery.of(context).size.width - 50,
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 80,
                                    ),
                                    const Text(
                                      'Aylık ödül ödemesi için kalan süre',
                                      style: TextStyle(
                                          color: Colors.yellow, fontSize: 12),
                                    ),
                                    TimerCountdown(
                                      format: CountDownTimerFormat
                                          .daysHoursMinutesSeconds,
                                      timeTextStyle: const TextStyle(
                                          color: Colors.white, fontSize: 28),
                                      colonsTextStyle: const TextStyle(
                                          color: Colors.white, fontSize: 28),
                                      descriptionTextStyle: const TextStyle(
                                          color: Colors.white, fontSize: 12),
                                      enableDescriptions: true,
                                      endTime: DateTime(
                                          DateTime.now().year,
                                          DateTime.now().month,
                                          DateTime(DateTime.now().year,
                                                  DateTime.now().month + 1, 0)
                                              .day,
                                          23,
                                          59,
                                          59),
                                      // controller: CountTimerController(
                                      //   endTime: DateTime(
                                      //       DateTime.now().year,
                                      //       DateTime.now().month,
                                      //       DateTime(DateTime.now().year,
                                      //               DateTime.now().month + 1, 0)
                                      //           .day,
                                      //       23,
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
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Image.asset(
                                "lib/assets/images/all_reward.png",
                                height: 160,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0, bottom: 9),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text(
                              'Kazanıyorlar',
                              style: TextStyle(color: Colors.white),
                            ),
                            const SizedBox(),
                            Row(
                              children: [
                                Container(
                                  width: 20,
                                  height: 20,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'lib/assets/images/allprize.png'))),
                                ),
                                const Text(
                                  'Ödül',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Consumer<ScoreState>(builder: (context, value, child) {
                        return Column(
                          children: [
                            for (var index = 0;
                                index < value.allScores.length;
                                index++)
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 5),
                                child: AllReward(
                                  score: value.allScores[index],
                                  index: index + 1,
                                  reward: index < value.rewardsAll.length
                                      ? value.rewardsAll[index]
                                      : "",
                                ),
                              ),
                          ],
                        );

                        // ListView.builder(
                        //   itemCount: value.allScores.length,
                        //   shrinkWrap: true,
                        //   itemBuilder: (context, index) => Padding(
                        //     padding: const EdgeInsets.symmetric(
                        //         vertical: 8.0, horizontal: 25),
                        //     child: AllReward(
                        //       score: value.allScores[index],
                        //       index: index + 1,
                        //       reward: index < value.rewardsAll.length
                        //           ? value.rewardsAll[index]
                        //           : "",
                        //     ),
                        //   ),
                        // );
                      }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
