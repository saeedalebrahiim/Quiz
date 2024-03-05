import 'package:bilgimizde/services/admob.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bilgimizde/init_screen.dart';
import 'package:bilgimizde/provider/banners.dart';
import 'package:bilgimizde/provider/drawer_state.dart';
import 'package:bilgimizde/provider/faq.dart';
import 'package:bilgimizde/provider/profile.dart';
import 'package:bilgimizde/provider/quiz.dart';
import 'package:bilgimizde/provider/score.dart';
import 'package:bilgimizde/provider/settings.dart';
import 'package:bilgimizde/provider/stop_watch.dart';
import 'package:bilgimizde/provider/ticket.dart';
import 'package:bilgimizde/route/routes.dart';
import 'package:bilgimizde/view/welcome/welcome_screen.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

AppOpenAd? _appOpenAd;
_createAppOpenAd() {
  try {
    AppOpenAd.load(
      adUnitId: AdMobService.appOpenAdUnitId!,
      request: const AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          _appOpenAd = ad;
          _appOpenAd!.show();
        },
        onAdFailedToLoad: (error) => _appOpenAd = null,
      ),
      orientation: AppOpenAd.orientationPortrait,
    );
  } catch (e) {
    print("error $e");
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform,
      );
  _createAppOpenAd();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DrawerState(),
        ),
        ChangeNotifierProvider(
          create: (context) => BannersState(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProfileState(),
        ),
        ChangeNotifierProvider(
          create: (context) => FAQState(),
        ),
        ChangeNotifierProvider(
          create: (context) => SettingsState(),
        ),
        ChangeNotifierProvider(
          create: (context) => QuizState(),
        ),
        ChangeNotifierProvider(
          create: (context) => StopWatchProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ScoreState(),
        ),
        ChangeNotifierProvider(
          create: (context) => TicketStateProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
      debugShowCheckedModeBanner: false,
      home: const WelcomeScreen(),
      theme: ThemeData(
          bottomSheetTheme:
              BottomSheetThemeData(backgroundColor: Colors.transparent)),
    );
  }
}
