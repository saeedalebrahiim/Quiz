import 'package:flutter/material.dart';

class MyRatingScreen extends StatelessWidget {
  const MyRatingScreen({super.key});

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
                height: 150,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
