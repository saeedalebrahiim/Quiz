import 'package:bilgimizde/controller/phase2/game.dart';
import 'package:bilgimizde/provider/profile.dart';
import 'package:bilgimizde/view/buycoin/buy_coin_screen.dart';
import 'package:bilgimizde/view/buycoin/gem_buy.dart';
import 'package:bilgimizde/view/home/dashboard/home_screen.dart';
import 'package:bilgimizde/view/rules/rules_screen.dart';
import 'package:bilgimizde/view/wallet/wallet.dart';
import 'package:flutter/material.dart';
import 'package:bilgimizde/global.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class GemQuizScreen extends StatefulWidget {
  const GemQuizScreen({super.key});

  @override
  State<GemQuizScreen> createState() => _GemQuizScreenState();
}

class _GemQuizScreenState extends State<GemQuizScreen> {
  bool tappedOnce = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: primaryColor,
            image: const DecorationImage(
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
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 10, 21, 94),
                              borderRadius: BorderRadius.circular(30)),
                          child: Icon(
                            Icons.home_filled,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 23),
                      child: InkWell(
                        onTap: () {
                          // Navigator.of(context).push(
                          //   PageRouteBuilder(
                          //       pageBuilder: (_, __, ___) => const BuyGem(),
                          //       transitionDuration:
                          //           const Duration(milliseconds: 500),
                          //       transitionsBuilder: (_, a, __, c) =>
                          //           FadeTransition(
                          //             opacity: a,
                          //             child: c,
                          //           )),
                          // );
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'lib/assets/images/gem.png',
                              width: 25,
                              height: 25,
                            ),
                            Consumer<ProfileState>(
                              builder: (context, value, child) {
                                var formattedNumber = NumberFormat.compact()
                                    .format(value.profile != null
                                        ? value.profile!.userGemBalance
                                        : 0);
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
                          width: 50,
                          height: 50,
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
                height: 3.0,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                        pageBuilder: (_, __, ___) => const WalleteScreen(),
                        transitionDuration: const Duration(milliseconds: 500),
                        transitionsBuilder: (_, a, __, c) => FadeTransition(
                              opacity: a,
                              child: c,
                            )),
                  );
                },
                child: Container(
                  width: 300,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Image.asset(
                          'lib/assets/images/wallettext.png',
                          width: 35,
                          height: 16,
                        ),
                      ),
                      const Text(
                        'Cüzdana git',
                        style: TextStyle(
                            color: Color.fromARGB(255, 246, 176, 71),
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              GemListComponents(
                price: '50',
                gemCount: '25',
                id: 1,
                onTap: () {
                  if (!tappedOnce) {
                    tappedOnce = true;
                    WordController.startWordGame(context: context, lvlId: 1)
                        .whenComplete(() {
                      tappedOnce = false;
                    });
                  }
                },
              ),
              GemListComponents(
                price: '150',
                gemCount: '60',
                id: 2,
                onTap: () {
                  if (!tappedOnce) {
                    tappedOnce = true;
                    WordController.startWordGame(context: context, lvlId: 2)
                        .whenComplete(() {
                      tappedOnce = false;
                    });
                  }
                },
              ),
              GemListComponents(
                price: '350',
                gemCount: '105',
                id: 3,
                onTap: () {
                  if (!tappedOnce) {
                    tappedOnce = true;
                    WordController.startWordGame(context: context, lvlId: 3)
                        .whenComplete(() {
                      tappedOnce = false;
                    });
                  }
                },
              ),
              GemListComponents(
                price: '850',
                gemCount: '170',
                id: 4,
                onTap: () {
                  if (!tappedOnce) {
                    tappedOnce = true;
                    WordController.startWordGame(context: context, lvlId: 4)
                        .whenComplete(() {
                      tappedOnce = false;
                    });
                  }
                },
              ),
              GemListComponents(
                price: '1500',
                gemCount: '225',
                id: 5,
                onTap: () {
                  if (!tappedOnce) {
                    tappedOnce = true;
                    WordController.startWordGame(context: context, lvlId: 5)
                        .whenComplete(() {
                      tappedOnce = false;
                    });
                  }
                },
              ),
              GemListComponents(
                price: '3000',
                gemCount: '300',
                id: 6,
                onTap: () {
                  if (!tappedOnce) {
                    tappedOnce = true;
                    WordController.startWordGame(context: context, lvlId: 6)
                        .whenComplete(() {
                      tappedOnce = false;
                    });
                  }
                },
              ),
              // SizedBox(
              //   width: MediaQuery.of(context).size.width - 20,
              //   height: 200,
              //   child: ListView.builder(
              //     scrollDirection: Axis.vertical,
              //     itemCount: 1,
              //     itemBuilder: (context, index) => const GemListComponents(
              //       price: '350',
              //       gemCount: '60',
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}

class GemListComponents extends StatelessWidget {
  final String price, gemCount;
  final int id;
  final Function()? onTap;
  const GemListComponents(
      {super.key,
      required this.price,
      required this.gemCount,
      this.onTap,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: InkWell(
        onDoubleTap: () {},
        onTap: onTap,
        // onTap: () {
        //   WordController.startWordGame(context: context, lvlId: id);
        // },
        child: Container(
          height: 85,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            gradient: LinearGradient(colors: [
              Color.fromRGBO(22, 35, 146, 1),
              Color.fromRGBO(217, 12, 196, 0.5),
            ]),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  '${price} TL Cüzdanıma ekle',
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.diamond,
                      size: 22,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Text(
                      gemCount,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
