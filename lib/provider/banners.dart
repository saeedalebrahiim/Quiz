import 'package:flutter/material.dart';
import 'package:quiz/global.dart';

class BannersState extends ChangeNotifier {
  List<String> banners = [
    "lib/assets/images/mainburger.png",
    "lib/assets/images/mainburger.png",
    "lib/assets/images/mainburger.png"
  ];
  List<String> bannersURL = ["", "", ""];
  changeBanners(
      {required int index, required String address, required String url}) {
    print("im calledddddd");
    banners[index] = address;
    bannersURL[index] = url;

    notifyListeners();
  }
}
