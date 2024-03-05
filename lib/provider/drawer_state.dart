import 'package:flutter/material.dart';
import 'package:bilgimizde/global.dart';

class DrawerState extends ChangeNotifier {
  changeVisible() {
    drawerVisible = true;
    notifyListeners();
  }

  changeVisibleTwo() {
    drawerVisible = false;
    notifyListeners();
  }
}
