import 'package:flutter/material.dart';
import 'package:quiz/controller/profile/profile.dart';
import 'package:quiz/model/dto/faq.dart';
import 'package:quiz/model/dto/profile.dart';

class FAQState extends ChangeNotifier {
  List<FAQDto> faqs = [];
  getFAQs({required List<FAQDto> values}) {
    faqs = values;
    notifyListeners();
  }
}
