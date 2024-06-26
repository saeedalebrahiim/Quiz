import 'package:bilgimizde/services/cuper_alert.dart';
import 'package:flutter/material.dart';
import 'package:bilgimizde/init_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    navigate();
    getALert();
  }

  getALert() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool flg = sp.getBool("iosOpen") ?? false;

    if (!flg) {
      alertCup();
    }
  }

  navigate() async {
    // ConnectionStatusListener().initialize();
    await Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).push(
        PageRouteBuilder(
            pageBuilder: (_, __, ___) => const InitScreen(),
            transitionDuration: const Duration(milliseconds: 500),
            transitionsBuilder: (_, a, __, c) => FadeTransition(
                  opacity: a,
                  child: c,
                )),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('lib/assets/images/welcomebg-bg.png'),
            fit: BoxFit.cover),
      ),
      child: Center(
        child: Image.asset(
          'lib/assets/images/Logo4.png',
          width: 250,
        ),
      ),
    );
  }
}
