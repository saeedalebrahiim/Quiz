import 'package:flutter/material.dart';
import 'package:quiz/model/dto/faq.dart';

class FAQState extends ChangeNotifier {
  List<FAQDto> faqs = [];
  getFAQs({required List<FAQDto> values}) {
    faqs = values;
    notifyListeners();
  }
}
