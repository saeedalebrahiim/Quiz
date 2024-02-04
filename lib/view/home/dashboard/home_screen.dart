import 'package:flutter/material.dart';
import 'package:quiz/view/home/dashboard/drawer_screen.dart';
import 'package:quiz/view/home/dashboard/main_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          DrawerScreen(),
          MainScreen(),
        ],
      ),
    );
  }
}
