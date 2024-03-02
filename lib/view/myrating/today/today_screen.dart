import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_count_timer/easy_count_timer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/components/rating_card/rating_card_all.dart';
import 'package:quiz/controller/score/score.dart';
import 'package:quiz/provider/profile.dart';
import 'package:quiz/provider/score.dart';
import 'package:quiz/view/buycoin/buy_coin_screen.dart';
import 'package:quiz/view/myrating/all/all_screen.dart.dart';
import 'package:quiz/view/myrating/onemonth/one_month_screen.dart.dart';

class TodayScreen extends StatefulWidget {
  const TodayScreen({super.key});

  @override
  State<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() {
    ScoreController.getUserChangeScoreDay(context: context);
    ScoreController.getUserRewardsDaily(context: context);
  }

  @override
  Widget build(BuildContext context) {
    final numberController = TextEditingController();
    return DefaultTabController(
      length: 3,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 20),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        // Navigator.of(context).push(
                        //   PageRouteBuilder(
                        //       pageBuilder: (_, __, ___) => const HomeScreen(),
                        //       transitionDuration:
                        //           const Duration(milliseconds: 500),
                        //       transitionsBuilder: (_, a, __, c) => FadeTransition(
                        //             opacity: a,
                        //             child: c,
                        //           )),
                        // );
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
                              pageBuilder: (_, __, ___) =>
                                  const BuyCoinScreen(),
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
                            builder: (context, value, child) => Text(
                              value.userBalance.toString(),
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15, top: 20),
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context).push(
                        //   PageRouteBuilder(
                        //       pageBuilder: (_, __, ___) => const HomeScreen(),
                        //       transitionDuration:
                        //           const Duration(milliseconds: 500),
                        //       transitionsBuilder: (_, a, __, c) => FadeTransition(
                        //             opacity: a,
                        //             child: c,
                        //           )),
                        // );
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                              image:
                                  AssetImage('lib/assets/images/questions.png'),
                            ),
                            color: const Color.fromARGB(255, 10, 21, 94),
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              TabBar(
                  indicator:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  dividerColor: Colors.transparent,
                  tabs: [
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
                            "Today",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    RawMaterialButton(
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
                      child: Container(
                        height: 35,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: const Color.fromARGB(255, 204, 118, 217)),
                        child: const Center(
                          child: Text(
                            "Month",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    RawMaterialButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          PageRouteBuilder(
                              pageBuilder: (_, __, ___) => const AllScreen(),
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
                        height: 35,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: const Color.fromARGB(255, 204, 118, 217)),
                        child: const Center(
                          child: Text(
                            "All",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ]),
              const SizedBox(
                height: 20,
              ),
              Consumer<ScoreState>(
                builder: (context, value, child) => Container(
                  width: 280,
                  height: 50,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('lib/assets/images/today.png'),
                          fit: BoxFit.fill)),
                  child: Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: value.userScore != null
                              ? value.userScore!.applicationUserUserPicUrl
                                  .toString()
                              : "",
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 10, 21, 94),
                              borderRadius: BorderRadius.circular(30),
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          placeholder: (context, url) {
                            return const CircularProgressIndicator();
                          },
                          errorWidget: (context, url, error) {
                            print(error);
                            return const Image(
                              image:
                                  AssetImage('lib/assets/images/profile.png'),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 100,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  image: const DecorationImage(
                                      image: AssetImage(
                                          'lib/assets/images/increase.png'),
                                      fit: BoxFit.fill)),
                            ),
                            const Text(
                              'Your growth',
                              style: TextStyle(
                                  fontSize: 8, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Text(
                        '${value.userScore != null ? value.userScore!.changes : "0"} +',
                        style: const TextStyle(
                            color: Colors.green, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    'Top 10',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  CountTimer(
                    format: CountTimerFormat.hoursMinutesSeconds,
                    timeTextStyle: TextStyle(color: Colors.white),
                    colonsTextStyle: TextStyle(color: Colors.white),
                    descriptionTextStyle: TextStyle(color: Colors.white),
                    enableDescriptions: false,
                    controller: CountTimerController(
                      endTime: DateTime(DateTime.now().year,
                          DateTime.now().month, DateTime.now().day, 23, 59, 59),

                      //  DateTime.now().add(
                      //   const Duration(
                      //     days: 5,
                      //     hours: 14,
                      //     minutes: 27,
                      //     seconds: 34,
                      //   ),
                      // ),
                    ),
                    onEnd: () {
                      print("Timer finished");
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 50,
                  ),
                  const Text(
                    'Rank',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  const Text('Name',
                      style: TextStyle(color: Colors.white, fontSize: 12)),
                  const SizedBox(
                    width: 80,
                  ),
                  Column(
                    children: [
                      const Text(
                        'Time left to grant reward',
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
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
                            'Prize',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ],
              ),
              Consumer<ScoreState>(builder: (context, value, child) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: value.dailyScores.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 25),
                      child: AllRatingCard(
                          showChanges: true,
                          isPrice: true,
                          score: value.dailyScores[index],
                          index: index + 1,
                          price: value.rewards[index] ?? "0"),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
