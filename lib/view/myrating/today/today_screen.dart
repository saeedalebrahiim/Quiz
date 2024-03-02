import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/components/rating_card/rating_card_all.dart';
import 'package:quiz/controller/score/score.dart';
import 'package:quiz/provider/score.dart';

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
        body: Consumer<ScoreState>(builder: (context, value, child) {
          return Container(
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
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'lib/assets/images/coin.png',
                            width: 25,
                            height: 25,
                          ),
                          const Text(
                            '3012',
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          )
                        ],
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
                      Tab(
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
                      Tab(
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
                Container(
                  width: 280,
                  height: 50,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('lib/assets/images/today.png'),
                          fit: BoxFit.fill)),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: const DecorationImage(
                                  image: AssetImage(
                                      'lib/assets/images/profile.png'),
                                  fit: BoxFit.fill)),
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
                        const Text(
                          '20' '+',
                          style: TextStyle(
                              color: Colors.green, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  children: [
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      'Top 10',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    )
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
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
                Expanded(
                  child: ListView.builder(
                    itemCount: value.dailyScores.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 25),
                      child: AllRatingCard(
                          score: value.dailyScores[index],
                          index: index + 1,
                          price: value.rewards[index] ?? "0"),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
