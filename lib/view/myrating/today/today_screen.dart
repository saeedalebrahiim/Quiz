import 'package:bilgimizde/services/admob.dart';
import 'package:bilgimizde/view/home/dashboard/home_screen.dart';
import 'package:bilgimizde/view/rules/rules_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_count_timer/easy_count_timer.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:bilgimizde/components/rating_card/rating_card_all.dart';
import 'package:bilgimizde/controller/score/score.dart';
import 'package:bilgimizde/provider/profile.dart';
import 'package:bilgimizde/provider/score.dart';
import 'package:bilgimizde/view/buycoin/buy_coin_screen.dart';
import 'package:bilgimizde/view/myrating/all/all_screen.dart.dart';
import 'package:bilgimizde/view/myrating/onemonth/one_month_screen.dart.dart';

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
    _createBannerAd();
  }

  BannerAd? _bannerAd;

  _createBannerAd() {
    try {
      _bannerAd = BannerAd(
          size: AdSize.fullBanner,
          adUnitId: AdMobService.bannerAdUnitId!,
          listener: const BannerAdListener(),
          request: const AdRequest())
        ..load();
    } catch (e) {
      print("error $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final numberController = TextEditingController();
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
        // bottomNavigationBar: _bannerAd != null
        //     ? SizedBox(height: 60, child: AdWidget(ad: _bannerAd!))
        //     : SizedBox(),
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
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: Container(
                    height: 35,
                    width: 110,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.transparent,
                        border: Border.all(
                            color: Colors.white,
                            width: 2,
                            style: BorderStyle.solid)),
                    child: const Center(
                      child: Text(
                        "Günlük Ödül",
                        style: TextStyle(color: Colors.white),
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
                Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: Container(
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
                ),
              ]),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Consumer<ScoreState>(
                        builder: (context, value, child) => Container(
                          width: 342,
                          height: 72,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage('lib/assets/images/today.png'),
                                  fit: BoxFit.fill)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(21),
                                    color: Colors.black),
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl: ProfileState.profileUse != null
                                        ? ProfileState.profileUse!.userPicUrl
                                            .toString()
                                        : "",
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 10, 21, 94),
                                        borderRadius: BorderRadius.circular(18),
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
                                        image: AssetImage(
                                            'lib/assets/images/profile.png'),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 100,
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Icon(
                                          value.userScore != null
                                              ? value.userScore!.changes
                                                      .isNegative
                                                  ? Icons.arrow_drop_down
                                                  : Icons.arrow_drop_up
                                              : Icons.arrow_drop_up,
                                          color: value.userScore != null
                                              ? value.userScore!.changes
                                                      .isNegative
                                                  ? Colors.red
                                                  : Colors.green
                                              : Colors.green,
                                          size: 38,
                                        ),
                                        Text(
                                          '${value.userScore!.changes.isNegative ? "" : "+"} ${value.userScore != null ? value.userScore!.changes : "0"}',
                                          style: TextStyle(
                                              color: value.userScore != null
                                                  ? value.userScore!.changes
                                                          .isNegative
                                                      ? Colors.red
                                                      : Colors.green
                                                  : Colors.green,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 24),
                                        )
                                      ],
                                    ),
                                  ),
                                  const Text(
                                    'Bugünkü ilerlemem',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
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
                            'İlerliyorlar (En iyi 10) ',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              CountTimer(
                                format: CountTimerFormat.hoursMinutesSeconds,
                                timeTextStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                colonsTextStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                descriptionTextStyle:
                                    const TextStyle(color: Colors.white),
                                enableDescriptions: false,
                                spacerWidth: 2,
                                controller: CountTimerController(
                                  endTime: DateTime(
                                      DateTime.now().year,
                                      DateTime.now().month,
                                      DateTime.now().day,
                                      23,
                                      59,
                                      59),

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
                              const Text(
                                'İlerleyenler ödülüne kalan süre',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            'Sıra',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          const Text('Kullanıcı',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12)),
                          const SizedBox(
                            width: 80,
                          ),
                          Column(
                            children: [
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
                          const SizedBox(
                            width: 5,
                          )
                        ],
                      ),
                      Consumer<ScoreState>(builder: (context, value, child) {
                        return Visibility(
                          visible: value.dailyScores.isNotEmpty,
                          replacement: const Center(
                            child: CircularProgressIndicator(),
                          ),
                          child: Column(
                            children: [
                              for (var index = 0;
                                  index < value.dailyScores.length;
                                  index++)
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 25),
                                  child: AllRatingCard(
                                      showChanges: true,
                                      isPrice: true,
                                      isMe: value.dailyScores[index]
                                              .applicationUserId ==
                                          (ProfileState.profileUse != null
                                              ? ProfileState.profileUse!.id
                                              : ""),
                                      score: value.dailyScores[index],
                                      index: index + 1,
                                      price: value.rewards[index] ?? "0"),
                                ),
                            ],
                          ),
                        );
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
