import 'package:bilgimizde/components/alarms_functions/no_coin.dart';
import 'package:bilgimizde/components/alarms_functions/wifi_alarm.dart';
import 'package:bilgimizde/controller/auth/auth_controller.dart';
import 'package:bilgimizde/provider/quiz.dart';
import 'package:bilgimizde/services/internet_listener.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:bilgimizde/controller/Quiz/start_quiz.dart';
import 'package:bilgimizde/controller/banners/banners.dart';
import 'package:bilgimizde/controller/profile/profile.dart';
import 'package:bilgimizde/global.dart';
import 'package:bilgimizde/provider/banners.dart';
import 'package:bilgimizde/provider/drawer_state.dart';
import 'package:bilgimizde/provider/profile.dart';
import 'package:bilgimizde/services/admob.dart';
import 'package:bilgimizde/view/buycoin/buy_coin_screen.dart';
import 'package:bilgimizde/view/gem_quiz/gem_quiz_screen.dart';
import 'package:bilgimizde/view/profile/profile_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  RewardedAd? _rewardedAd;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    _createRewardedAd();
    checkWifi();
  }

  checkWifi() async {
    await AuthController.isAuth(context: context);
    ConnectionStatusListener().checkConnection().then((value) {
      if (!value) {
        wifiAlarm(context);
      }
    });
  }

  getData() {
    BannersController.getBanners(context: context);
    ProfileController.getProfile(context: context);
    ProfileController.getUserBalance(context: context);
    context.read<DrawerState>().changeVisibleTwo();
  }

  _createRewardedAd() {
    try {
      RewardedAd.load(
        adUnitId: AdMobService.rewardedAdUnitId!,
        request: const AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (ad) => _rewardedAd = ad,
          onAdFailedToLoad: (error) => _rewardedAd = null,
        ),
      );
    } catch (e) {
      print("error $e");
    }
  }

  _showRewardedAd() {
    print(_rewardedAd);
    if (_rewardedAd != null) {
      _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          _createRewardedAd();
          ProfileController.getUserBalance(context: context);
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          ad.dispose();
          _createRewardedAd();
          ProfileController.getUserBalance(context: context);
        },
      );
      _rewardedAd!.show(
        onUserEarnedReward: (ad, reward) =>
            ProfileController.addToWatchScore(context: context),
      );
      _rewardedAd = null;
      _createRewardedAd();
    }
  }

  // double xOffset = 0;
  // double yOffset = 0;

  // bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<DrawerState>(builder: (context, value, child) {
      return GestureDetector(
        onPanUpdate: (details) {
          // Swiping in right direction.
          if (details.delta.dx > 0) {
            value.xOffset = 220;
            value.yOffset = 0;
            value.isDrawerOpen = true;
            drawerVisible = true;

            context.read<DrawerState>().changeVisible();
          }

          // Swiping in left direction.
          if (details.delta.dx < 0) {
            value.xOffset = 0;
            value.yOffset = 0;
            value.isDrawerOpen = false;
            drawerVisible = false;

            context.read<DrawerState>().changeVisibleTwo();
          }
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
              child: AppBar(
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 0, left: 0, bottom: 0, top: 0),
                    child: InkWell(
                      onTap: () {
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
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Container(
                            width: 56,
                            height: 56,
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
                                  color: const Color.fromARGB(255, 10, 21, 94),
                                  borderRadius: BorderRadius.circular(18),
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              errorWidget: (context, url, error) => const Image(
                                image:
                                    AssetImage('lib/assets/images/profile.png'),
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
                centerTitle: true,
                title: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                          pageBuilder: (_, __, ___) => const BuyCoinScreen(),
                          transitionDuration: const Duration(milliseconds: 500),
                          transitionsBuilder: (_, a, __, c) => FadeTransition(
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
                          var _formattedNumber =
                              NumberFormat.compact().format(value.userBalance);
                          return Text(
                            _formattedNumber,
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
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 10, 21, 94),
                        borderRadius: BorderRadius.circular(18)),
                    child: value.isDrawerOpen
                        ? GestureDetector(
                            child: const Image(
                              image: AssetImage(
                                  'lib/assets/images/appbaricon.png'),
                            ),
                            onTap: () {
                              value.xOffset = 0;
                              value.yOffset = 0;
                              value.isDrawerOpen = false;
                              drawerVisible = false;

                              context.read<DrawerState>().changeVisibleTwo();
                            },
                          )
                        : GestureDetector(
                            child:
                                Image.asset('lib/assets/images/appbaricon.png'),
                            onTap: () {
                              value.xOffset = 220;
                              value.yOffset = 0;
                              value.isDrawerOpen = true;
                              drawerVisible = true;

                              context.read<DrawerState>().changeVisible();
                            },
                          ),
                  ),
                ),
              ),
            ),
            AnimatedContainer(
              transform:
                  Matrix4.translationValues(value.xOffset, value.yOffset, 0)
                    ..scale(value.isDrawerOpen ? 0.85 : 1.00)
                    ..rotateZ(value.isDrawerOpen ? -50 : 0),
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "lib/assets/images/mainbg.png",
                  ),
                  alignment: Alignment.bottomCenter,
                  fit: BoxFit.fitWidth,
                ),
                borderRadius: value.isDrawerOpen
                    ? BorderRadius.circular(40)
                    : BorderRadius.circular(0),
              ),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height - 100,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 40,
                              ),
                              Text(
                                'iyi haberler',
                                style: TextStyle(
                                    color: Colors.grey.shade300, fontSize: 16),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Image(
                                image: AssetImage(
                                    'lib/assets/images/mainsticker.png'),
                                width: 20,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Consumer<BannersState>(
                            builder: (context, value, child) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: InkWell(
                                onTap: () async {
                                  if (!await launchUrl(
                                      Uri.parse(value.bannersURL[0]))) {
                                    throw Exception('Could not launch ');
                                  }
                                },
                                child: CachedNetworkImage(
                                  width: 342,
                                  height: 166,
                                  imageUrl: value.banners[0],
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  placeholder: (context, url) =>
                                      const CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),

                              // Container(
                              //   width: 300,
                              //   height: 130,
                              //   child: Image(
                              //     image: NetworkImage(value.banners[0]),
                              //   ),
                              // ),
                            ),
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          AnimationLimiter(
                            child: AnimationConfiguration.synchronized(
                              duration: const Duration(milliseconds: 500),
                              child: SlideAnimation(
                                verticalOffset: 50.0,
                                child: FadeInAnimation(
                                  child: RawMaterialButton(
                                    onPressed: () {
                                      _showRewardedAd();
                                    },
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Image(
                                            image: AssetImage(
                                              _rewardedAd != null
                                                  ? 'lib/assets/images/mainstar.png'
                                                  : 'lib/assets/images/mainstar-grey.png',
                                            ),
                                            width: 85,
                                            height: 89,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                'Watch the video and get ',
                                                style: TextStyle(
                                                  color: _rewardedAd != null
                                                      ? Colors.orange
                                                      : Colors.orange
                                                          .withOpacity(0.5),
                                                  fontSize: 18,
                                                ),
                                              ),
                                              Text('points',
                                                  style: TextStyle(
                                                    color: _rewardedAd != null
                                                        ? Colors.orange
                                                        : Colors.orange
                                                            .withOpacity(0.5),
                                                    fontSize: 18,
                                                  ))
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          Consumer<ProfileState>(
                            builder: (context, value, child) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: AnimationLimiter(
                                child: Container(
                                  width: 342,
                                  height: 203,
                                  decoration: BoxDecoration(
                                      image: const DecorationImage(
                                          image: AssetImage(
                                              'lib/assets/images/questionbg.png'),
                                          fit: BoxFit.fill),
                                      borderRadius: BorderRadius.circular(25)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      AnimationConfiguration.synchronized(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        child: SlideAnimation(
                                          verticalOffset: 50.0,
                                          child: FadeInAnimation(
                                            child: InkWell(
                                              onTap: () {
                                                // Navigator.of(context).push(
                                                //   PageRouteBuilder(
                                                //       pageBuilder: (_, __, ___) =>
                                                //           const QuizScreen(),
                                                //       transitionDuration:
                                                //           const Duration(milliseconds: 500),
                                                //       transitionsBuilder: (_, a, __, c) =>
                                                //           FadeTransition(
                                                //             opacity: a,
                                                //             child: c,
                                                //           )),
                                                // );
                                                ConnectionStatusListener()
                                                    .checkConnection()
                                                    .then((value) {
                                                  if (!value) {
                                                    wifiAlarm(context);
                                                  }
                                                });
                                                if (value.userBalance >= 2) {
                                                  context
                                                      .read<QuizState>()
                                                      .resetCount();
                                                  StartQuizController.startQuiz(
                                                      context: context);
                                                  ProfileController
                                                      .getUserBalance(
                                                          context: context);
                                                } else {
                                                  noCoinAlert(context);
                                                }
                                              },
                                              child: Container(
                                                width: 285,
                                                height: 48,
                                                decoration: const BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            'lib/assets/images/main-play.png'),
                                                        fit: BoxFit.fill)),
                                                // child: const Center(
                                                //     child: Text(
                                                //   'kelimeyi tahmin et',
                                                //   style: TextStyle(
                                                //       color: Colors.white,
                                                //       fontWeight:
                                                //           FontWeight.bold),
                                                // )),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      AnimationConfiguration.synchronized(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        child: SlideAnimation(
                                          verticalOffset: 50.0,
                                          child: FadeInAnimation(
                                            child: InkWell(
                                              onTap: () {
                                                // Navigator.of(context).push(
                                                //   PageRouteBuilder(
                                                //       pageBuilder: (_, __, ___) =>
                                                //           const GemQuizScreen(),
                                                //       transitionDuration: const Duration(
                                                //           milliseconds: 500),
                                                //       transitionsBuilder: (_, a, __, c) =>
                                                //           FadeTransition(
                                                //             opacity: a,
                                                //             child: c,
                                                //           )),
                                                // );
                                              },
                                              child: Container(
                                                width: 285,
                                                height: 48,
                                                decoration: const BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            'lib/assets/images/mainbt2.png'),
                                                        fit: BoxFit.fill)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          //here was money bg
                          // Container(
                          //   width: MediaQuery.of(context).size.width,
                          //   height: MediaQuery.of(context).size.height - 560,
                          //   decoration: BoxDecoration(
                          //       borderRadius: BorderRadius.circular(10),
                          //       image: const DecorationImage(
                          //         image: AssetImage(
                          //             'lib/assets/images/mainbg.png'),
                          //         fit: BoxFit.fitWidth,
                          //       )),
                          // )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}

// class NewPadding extends StatelessWidget {
//   final String image1;
//   final String text1;
//   final String image2;
//   final String text2;

//   const NewPadding({
//     Key key,
//     this.image1,
//     this.text1,
//     this.image2,
//     this.text2,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 35),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           Container(
//             width: 150,
//             height: 150,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(15),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.1),
//                   spreadRadius: 2,
//                   blurRadius: 5,
//                   offset: Offset(0, 0),
//                 ),
//               ],
//             ),
//             child: Column(
//               children: <Widget>[
//                 Padding(
//                   padding: EdgeInsets.symmetric(vertical: 8),
//                   child: Image(
//                     height: 100,
//                     width: 100,
//                     image: AssetImage(image1),
//                   ),
//                 ),
//                 Text(
//                   text1,
//                   style: TextStyle(
//                       color: Colors.black87,
//                       fontSize: 15,
//                       decoration: TextDecoration.none),
//                 )
//               ],
//             ),
//           ),
//           Container(
//             width: 150,
//             height: 150,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(15),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.1),
//                   spreadRadius: 2,
//                   blurRadius: 5,
//                   offset: Offset(0, 0),
//                 ),
//               ],
//             ),
//             child: Column(
//               children: <Widget>[
//                 Padding(
//                   padding: EdgeInsets.symmetric(vertical: 8),
//                   child: Image(
//                     height: 100,
//                     width: 100,
//                     image: AssetImage(image2),
//                   ),
//                 ),
//                 Text(
//                   text2,
//                   style: TextStyle(
//                       color: Colors.black87,
//                       fontSize: 15,
//                       decoration: TextDecoration.none),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
