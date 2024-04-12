import 'package:flutter/material.dart';
import 'package:bilgimizde/global.dart';

class DrawerState extends ChangeNotifier {
  double xOffset = 0;
  double yOffset = 0;
  bool isDrawerOpen = false;

  changeVisible() {
    xOffset = 320;
    yOffset = 0;
    drawerVisible = true;
    isDrawerOpen = true;
    notifyListeners();
  }

  changeVisibleTwo() {
    xOffset = 0;
    yOffset = 0;
    drawerVisible = false;
    isDrawerOpen = false;
    notifyListeners();
  }
}
