import 'dart:io';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:bilgimizde/provider/ad.dart';
import 'package:bilgimizde/provider/request_state.dart';
import 'package:bilgimizde/provider/wordguess.dart';
import 'package:bilgimizde/services/admob.dart';
import 'package:bilgimizde/services/cuper_alert.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
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
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';

AppOpenAd? _appOpenAd;

_createAppOpenAd() {
  // Load the latest `ConsentInformation`. This will always work but does
  // not request the latest info from the UMP backend.
  if (defaultTargetPlatform == TargetPlatform.iOS) {
    AdMobService.loadTrackingAuthorizationStatus();
  }
  AdMobService.loadConsentInfo();
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

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("Handling a background message: ${message.messageId}");
  _showNotification(
      title: message.notification!.title ?? "",
      body: message.notification!.body ?? "",
      id: 1);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyAI6EsIbqUzPFByuOgFk3NSpxmKwfquXlo",
      appId: Platform.isAndroid
          ? "1:775999130252:android:d9fc09fabb9bc12ff2c9a9"
          : "1:775999130252:ios:04caa03c7cbc8824f2c9a9",
      messagingSenderId: "775999130252",
      projectId: "bilgimizde-android",
    ),
  );

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  });

  // Show tracking authorization dialog and ask for permission
  final status = await AppTrackingTransparency.requestTrackingAuthorization();
  MobileAds.instance.initialize();

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
        ChangeNotifierProvider(
          create: (context) => AdState(),
        ),
        ChangeNotifierProvider(
          create: (context) => RequestState(),
        ),
        ChangeNotifierProvider(
          create: (context) => WordGameState(),
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
      navigatorKey: NavigationService.navigatorKey,
      routes: routes,
      debugShowCheckedModeBanner: false,
      home: const WelcomeScreen(),
      theme: ThemeData(
        fontFamily: "PlusJakartaSans",
        bottomSheetTheme:
            const BottomSheetThemeData(backgroundColor: Colors.transparent),
      ),
      builder: (BuildContext context, Widget? widget) {
        ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
          return const CustomError();
        };
        return widget!;
      },
    );
  }
}

class CustomError extends StatelessWidget {
  const CustomError({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SizedBox(
              height: 100, width: 100, child: CircularProgressIndicator()),
        ));
  }
}

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _showNotification({
  required int id,
  required String title,
  required String body,
}) async {
  const AndroidNotificationDetails androidNotificationDetails =
      AndroidNotificationDetails('1', 'bilgimizde',
          channelDescription: 'bilgimizde Notification Channel',
          importance: Importance.max,
          icon: '@mipmap/ic_launcher',
          priority: Priority.high,
          ticker: 'ticker');
  const NotificationDetails notificationDetails = NotificationDetails(
    android: androidNotificationDetails,
    iOS: DarwinNotificationDetails(),
  );
  await flutterLocalNotificationsPlugin.show(
    id,
    title,
    body,
    notificationDetails,
  );
}
