import 'package:flutter/material.dart';
import 'package:quiz/init_screen.dart';
import 'package:quiz/route/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
      debugShowCheckedModeBanner: false,
      home: InitScreen(),
    );
  }
}
