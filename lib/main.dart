import 'package:bilgimizde/provider/ad.dart';
import 'package:bilgimizde/services/admob.dart';
import 'package:firebase_core/firebase_core.dart';
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
  MobileAds.instance.initialize();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  _createAppOpenAd();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAI6EsIbqUzPFByuOgFk3NSpxmKwfquXlo",
      appId: "1:775999130252:android:d9fc09fabb9bc12ff2c9a9",
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
              const BottomSheetThemeData(backgroundColor: Colors.transparent)),
    );
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
          priority: Priority.high,
          ticker: 'ticker');
  const NotificationDetails notificationDetails =
      NotificationDetails(android: androidNotificationDetails);
  await flutterLocalNotificationsPlugin.show(
    id,
    title,
    body,
    notificationDetails,
  );
}
