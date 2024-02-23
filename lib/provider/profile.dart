import 'package:flutter/material.dart';
import 'package:quiz/controller/profile/profile.dart';
import 'package:quiz/model/dto/profile.dart';

class ProfileState extends ChangeNotifier {
  ProfileDto? profile;
  getProfile({required ProfileDto user}) {
    profile = user;
    notifyListeners();
  }

  int userBalance = 0;
  getUserBalance({required int value}) {
    userBalance = value;
    notifyListeners();
  }
}
