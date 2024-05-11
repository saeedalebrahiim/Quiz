import 'package:flutter/material.dart';
import 'package:bilgimizde/model/dto/banks.dart';

class SettingsState extends ChangeNotifier {
  List<BankDto>? banks;
  List<String>? banksTitle;
  List<int>? banksID;
  String? terms;
  static String? termsStatic;

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

  getTerms({required String values}) {
    terms = values;
    termsStatic = values;

    notifyListeners();
  }
}
