import 'package:bilgimizde/view/home/dashboard/home_screen.dart';
import 'package:bilgimizde/view/welcome/enter_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  checkData() async {
    //todo Check token for login or home
    // check for internet
    //check for admob services
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool any = sp.containsKey("token");
    print(any);
    if (any == false) {
      setState(() {
        isNeedLogin = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isNeedLogin ? const EnterScreen() : const HomeScreen();
  }
}
