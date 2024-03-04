import 'package:flutter/material.dart';
import 'package:quiz/view/home/dashboard/home_screen.dart';
import 'package:quiz/view/welcome/enter_screen.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({super.key});

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  bool isNeedLogin = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkData();
  }

  checkData() {
    //todo Check token for login or home
    // check for internet
    //check for admob services
  }

  @override
  Widget build(BuildContext context) {
    return isNeedLogin ? const EnterScreen() : const HomeScreen();
  }
}
