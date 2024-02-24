import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/init_screen.dart';
import 'package:quiz/provider/banners.dart';
import 'package:quiz/provider/drawer_state.dart';
import 'package:quiz/provider/faq.dart';
import 'package:quiz/provider/profile.dart';
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
    );
  }
}
