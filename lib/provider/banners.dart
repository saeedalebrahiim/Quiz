import 'package:flutter/material.dart';

class BannersState extends ChangeNotifier {
  List<String> banners = [
    // "lib/assets/images/mainburger.png",
    "",
    "",
    ""
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
