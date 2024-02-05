import 'package:flutter/material.dart';
import 'package:quiz/global.dart';

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
