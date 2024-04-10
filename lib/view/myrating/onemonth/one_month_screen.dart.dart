import 'package:bilgimizde/view/home/dashboard/home_screen.dart';
import 'package:bilgimizde/view/rules/rules_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:bilgimizde/components/rating_card/rating_card_all.dart';
import 'package:bilgimizde/controller/score/score.dart';
import 'package:bilgimizde/provider/profile.dart';
import 'package:bilgimizde/provider/score.dart';
import 'package:bilgimizde/view/buycoin/buy_coin_screen.dart';
import 'package:bilgimizde/view/myrating/all/all_screen.dart.dart';
import 'package:bilgimizde/view/myrating/today/today_screen.dart';

class OneMonthScreen extends StatefulWidget {
  const OneMonthScreen({super.key});

  @override
  State<OneMonthScreen> createState() => _OneMonthScreenState();
}

class _OneMonthScreenState extends State<OneMonthScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() {
    ScoreController.getUserChangeScoreMonth(context: context);
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
                Row(children: [
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
                                    const TodayScreen(),
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
                          color: Colors.transparent,
                          border: Border.all(
                              color: Colors.white,
                              width: 2,
                              style: BorderStyle.solid)),
                      child: const Center(
                        child: Text(
                          "Aylık sıralamam",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 35,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: const Color.fromARGB(255, 204, 118, 217)),
                    child: RawMaterialButton(
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
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 28,
                    ),
                    Text(
                      'Rank',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text('Name',
                        style: TextStyle(color: Colors.white, fontSize: 12)),
                    SizedBox(
                      width: 80,
                    ),
                    Text(
                      'True Awnsers',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                  ],
                ),
                Consumer<ScoreState>(builder: (context, value, child) {
                  return Column(
                    children: [
                      for (var index = 0;
                          index < value.monthlyScores.length;
                          index++)
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 25),
                          child: AllRatingCard(
                              score: value.monthlyScores[index],
                              index: index + 2,
                              isMe: value
                                      .monthlyScores[index].applicationUserId ==
                                  ProfileState.profileUse!.id,
                              isRank: true,
                              price: value.monthlyScores[index].sumCurrectAnswer
                                      .toString() ??
                                  "0"),
                        ),
                    ],
                  );
                  // return Expanded(
                  //   child: ListView.builder(
                  //     itemCount: value.monthlyScores.length,
                  //     itemBuilder: (context, index) => Padding(
                  //       padding: const EdgeInsets.symmetric(
                  //           vertical: 8.0, horizontal: 25),
                  //       child: AllRatingCard(
                  //           score: value.monthlyScores[index],
                  //           index: index + 1,
                  //           isMe: value.monthlyScores[index]
                  //                       .applicationUserUserName ==
                  //                   ProfileState.profileUse!.username ||
                  //               value.monthlyScores[index]
                  //                       .applicationUserFullName ==
                  //                   ProfileState.profileUse!.fullName,
                  //           isRank: true,
                  //           price: value.monthlyScores[index].sumCurrectAnswer
                  //                   .toString() ??
                  //               "0"),
                  //     ),
                  //   ),
                  // );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
