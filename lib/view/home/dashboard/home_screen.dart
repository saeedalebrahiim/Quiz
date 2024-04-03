import 'package:bilgimizde/view/home/dashboard/new_home.dart';
import 'package:flutter/material.dart';
import 'package:bilgimizde/view/home/dashboard/drawer_screen.dart';
import 'package:bilgimizde/view/home/dashboard/main_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          DrawerScreen(),
          NewMainScreen(),
        ],
      ),
    );
  }
}
