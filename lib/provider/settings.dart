import 'package:flutter/material.dart';
import 'package:quiz/controller/profile/profile.dart';
import 'package:quiz/model/dto/banks.dart';
import 'package:quiz/model/dto/profile.dart';

class SettingsState extends ChangeNotifier {
  List<BankDto>? banks;
  getBanks({required List<BankDto> values}) {
    banks = values;
    notifyListeners();
  }
}
