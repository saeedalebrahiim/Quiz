import 'package:bilgimizde/components/alarms_functions/wifi_alarm.dart';
import 'package:bilgimizde/controller/auth/auth_controller.dart';
import 'package:bilgimizde/controller/phase2/game.dart';
import 'package:bilgimizde/controller/profile/profile.dart';
import 'package:bilgimizde/provider/profile.dart';
import 'package:bilgimizde/services/internet_listener.dart';
import 'package:bilgimizde/view/buycoin/buy_coin_screen.dart';
import 'package:bilgimizde/view/buycoin/gem_buy.dart';
import 'package:bilgimizde/view/home/dashboard/home_screen.dart';
import 'package:bilgimizde/view/profile/profile_screen.dart';
import 'package:bilgimizde/view/rules/rules_screen.dart';
import 'package:bilgimizde/view/wallete/wallete.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:bilgimizde/global.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:timer_count_down/timer_count_down.dart';

class WordGame extends StatefulWidget {
  const WordGame({super.key});

  @override
  State<WordGame> createState() => _WordGameState();
}

class _WordGameState extends State<WordGame> {
  bool gameStarted = false;
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
                          Navigator.of(context).push(
                            PageRouteBuilder(
                                pageBuilder: (_, __, ___) => const BuyGem(),
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
                      padding: const EdgeInsets.only(
                          right: 10, left: 0, bottom: 0, top: 15),
                      child: InkWell(
                        onTap: () {
                          AuthController.isAuth(context: context);
                          ConnectionStatusListener()
                              .checkConnection()
                              .then((value) {
                            if (!value) {
                              wifiAlarm(context);
                            }
                          });
                          ProfileController.getProfile(context: context);
                          Navigator.of(context).push(
                            PageRouteBuilder(
                                pageBuilder: (_, __, ___) =>
                                    const ProfileScreen(),
                                transitionDuration:
                                    const Duration(milliseconds: 500),
                                transitionsBuilder: (_, a, __, c) =>
                                    FadeTransition(
                                      opacity: a,
                                      child: c,
                                    )),
                          );
                        },
                        child: Consumer<ProfileState>(
                          builder: (context, value, child) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: Container(
                              width: 50,
                              height: 50,
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 10, 21, 94),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: CachedNetworkImage(
                                width: 50,
                                height: 50,
                                imageUrl: value.profile != null &&
                                        value.profile!.userPicUrl != null
                                    ? value.profile!.userPicUrl!
                                    : "",
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 10, 21, 94),
                                    borderRadius: BorderRadius.circular(18),
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    const Image(
                                  image: AssetImage(
                                      'lib/assets/images/profile.png'),
                                ),
                              ),
                            ),
                          ),
                        ),

                        //  Container(
                        //   decoration: BoxDecoration(
                        //       color: const Color.fromARGB(255, 10, 21, 94),
                        //       borderRadius: BorderRadius.circular(30)),
                        //   child: const Center(
                        //     child: Image(
                        //   image: AssetImage('lib/assets/images/profile.png'),
                        // )),
                        // ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 3.0,
              ),
              Container(
                width: 340,
                height: 113,
                decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(27)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Countdown(
                      seconds: 15,
                      build: (BuildContext context, double time) => Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              "${time.toInt()} S",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 24),
                            ),
                          ),
                        ],
                      ),
                      interval: const Duration(milliseconds: 100),
                      onFinished: () {
                        print('Timer is done!');
                      },
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
