import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/init_screen.dart';
import 'package:quiz/provider/banners.dart';
import 'package:quiz/provider/drawer_state.dart';
import 'package:quiz/provider/faq.dart';
import 'package:quiz/provider/profile.dart';
import 'package:quiz/provider/quiz.dart';
import 'package:quiz/provider/score.dart';
import 'package:quiz/provider/settings.dart';
import 'package:quiz/provider/stop_watch.dart';
import 'package:quiz/provider/ticket.dart';
import 'package:quiz/route/routes.dart';

void main() {
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
      home: const InitScreen(),
      theme: ThemeData(
          bottomSheetTheme:
              BottomSheetThemeData(backgroundColor: Colors.transparent)),
    );
  }
}
