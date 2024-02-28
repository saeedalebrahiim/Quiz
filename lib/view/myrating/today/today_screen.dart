import 'package:flutter/material.dart';
import 'package:quiz/components/rating_card/rating_card_today.dart';

class TodayScreen extends StatelessWidget {
  const TodayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _numberController = TextEditingController();
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
                            color: const Color.fromARGB(255, 204, 118, 217)),
                      ),
                    ),
                    Tab(
                      child: Container(
                        height: 35,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: const Color.fromARGB(255, 204, 118, 217)),
                      ),
                    ),
                    Tab(
                      child: Container(
                        height: 35,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: const Color.fromARGB(255, 204, 118, 217)),
                      ),
                    ),
                  ]),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 280,
                height: 50,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                                image:
                                    AssetImage('lib/assets/images/profile.png'),
                                fit: BoxFit.fill)),
                      ),
                      SizedBox(
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
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'lib/assets/images/increase.png'),
                                      fit: BoxFit.fill)),
                            ),
                            Text(
                              'Your growth',
                              style: TextStyle(
                                  fontSize: 8, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Text(
                        '20' + '+',
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('lib/assets/images/today.png'),
                        fit: BoxFit.fill)),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 50,
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
                    Column(
                      children: [
                        Text(
                          'Time left to grant reward',
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                        Row(
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'lib/assets/images/allprize.png'))),
                            ),
                            Text(
                              'Prize',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              TodayRatingCard()
            ],
          ),
        ),
      ),
    );
  }
}
