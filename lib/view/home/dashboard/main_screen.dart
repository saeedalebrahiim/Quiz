import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
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
        onUserEarnedReward: (ad, reward) => print("this is $ad + $reward"),
      );
      _rewardedAd = null;
    }
  }

  double xOffset = 0;
  double yOffset = 0;

  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
          child: AppBar(
            actions: [
              Padding(
                padding:
                    const EdgeInsets.only(right: 0, left: 0, bottom: 0, top: 0),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                          pageBuilder: (_, __, ___) => const ProfileScreen(),
                          transitionDuration: const Duration(milliseconds: 500),
                          transitionsBuilder: (_, a, __, c) => FadeTransition(
                                opacity: a,
                                child: c,
                              )),
                    );
                  },
                  child: Consumer<ProfileState>(
                    builder: (context, value, child) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 10, 21, 94),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: CachedNetworkImage(
                          width: 50,
                          height: 50,
                          imageUrl: value.profile != null
                              ? value.profile!.userPicUrl
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
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) => const Image(
                            image: AssetImage('lib/assets/images/profile.png'),
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
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 10, 21, 94),
                    borderRadius: BorderRadius.circular(30)),
                child: isDrawerOpen
                    ? GestureDetector(
                        child: const Image(
                          image: AssetImage('lib/assets/images/appbaricon.png'),
                        ),
                        onTap: () {
                          setState(() {
                            xOffset = 0;
                            yOffset = 0;
                            isDrawerOpen = false;
                            drawerVisible = false;
                          });
                          context.read<DrawerState>().changeVisibleTwo();
                        },
                      )
                    : GestureDetector(
                        child: Image.asset('lib/assets/images/appbaricon.png'),
                        onTap: () {
                          setState(() {
                            xOffset = 220;
                            yOffset = 0;
                            isDrawerOpen = true;
                            drawerVisible = true;
                          });
                          context.read<DrawerState>().changeVisible();
                        },
                      ),
              ),
            ),
          ),
        ),
        AnimatedContainer(
          transform: Matrix4.translationValues(xOffset, yOffset, 0)
            ..scale(isDrawerOpen ? 0.85 : 1.00)
            ..rotateZ(isDrawerOpen ? -50 : 0),
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            borderRadius: isDrawerOpen
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
                            style: TextStyle(color: Colors.grey.shade300),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Image(
                            image:
                                AssetImage('lib/assets/images/mainsticker.png'),
                            width: 20,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Consumer<BannersState>(
                        builder: (context, value, child) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: InkWell(
                            onTap: () async {
                              if (!await launchUrl(
                                  Uri.parse(value.bannersURL[0]))) {
                                throw Exception('Could not launch ');
                              }
                            },
                            child: CachedNetworkImage(
                              width: 300,
                              height: 150,
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
                      RawMaterialButton(
                        onPressed: () {
                          _showRewardedAd();
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image(
                                image: AssetImage(
                                    'lib/assets/images/mainstar.png'),
                                width: 75,
                                height: 75,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Watch the video and get ',
                                    style: TextStyle(color: Colors.orange),
                                  ),
                                  Text('points',
                                      style: TextStyle(color: Colors.orange))
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 28,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Container(
                          width: 300,
                          height: 150,
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage(
                                      'lib/assets/images/questionbg.png'),
                                  fit: BoxFit.fill),
                              borderRadius: BorderRadius.circular(25)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
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
                                  StartQuizController.startQuiz(
                                      context: context);
                                },
                                child: Container(
                                  width: 230,
                                  height: 30,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'lib/assets/images/mainbuttun.png'),
                                          fit: BoxFit.fill)),
                                  child: const Center(
                                      child: Text(
                                    'kelimeyi tahmin et',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    PageRouteBuilder(
                                        pageBuilder: (_, __, ___) =>
                                            const GemQuizScreen(),
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
                                  width: 230,
                                  height: 30,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'lib/assets/images/mainbt2.png'),
                                          fit: BoxFit.fill)),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height - 600,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                              image: AssetImage('lib/assets/images/mainbg.png'),
                              fit: BoxFit.fitWidth,
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
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
