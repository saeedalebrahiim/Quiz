import 'package:flutter/material.dart';
import 'package:quiz/controller/profile/profile.dart';
import 'package:quiz/model/dto/banks.dart';
import 'package:quiz/model/dto/profile.dart';

class SettingsState extends ChangeNotifier {
  List<BankDto>? banks;
  List<String>? banksTitle;
  List<int>? banksID;

  getBanks({required List<BankDto> values}) {
    banks = values;
    List<String> titles = [];
    List<int> iDs = [];

    banks!.forEach(
      (element) => titles.add(element.title),
    );
    banks!.forEach(
      (element) => iDs.add(element.id),
    );

    banksTitle = titles;
    banksID = iDs;

    notifyListeners();
  }
}
