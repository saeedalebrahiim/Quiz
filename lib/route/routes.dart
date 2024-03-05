import 'package:flutter/material.dart';
import 'package:bilgimizde/view/welcome/enter_screen.dart';

const String enterScreen = "enterscreen";
Map<String, Widget Function(BuildContext)> routes = <String, WidgetBuilder>{
  enterScreen: (context) => const EnterScreen(),
};
