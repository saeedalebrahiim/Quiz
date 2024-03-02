import 'package:flutter/material.dart';
import 'package:quiz/model/dto/banks.dart';

class SettingsState extends ChangeNotifier {
  List<BankDto>? banks;
  List<String>? banksTitle;
  List<int>? banksID;

  getBanks({required List<BankDto> values}) {
    banks = values;
    List<String> titles = [];
    List<int> iDs = [];

    for (var element in banks!) {
      titles.add(element.title);
    }
    for (var element in banks!) {
      iDs.add(element.id);
    }

    banksTitle = titles;
    banksID = iDs;

    notifyListeners();
  }
}
