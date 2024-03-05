import 'package:flutter/material.dart';
import 'package:bilgimizde/model/dto/profile.dart';

class ProfileState extends ChangeNotifier {
  ProfileDto? profile;
  static ProfileDto? profileUse;
  getProfile({required ProfileDto user}) {
    profile = user;
    profileUse = user;
    notifyListeners();
  }

  int userBalance = 0;
  getUserBalance({required int value}) {
    userBalance = value;
    notifyListeners();
  }
}
