import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/model/api/swagger/generated/quiz.swagger.dart';
import 'package:quiz/model/dto/banks.dart';
import 'package:quiz/model/dto/faq.dart';
import 'package:quiz/provider/banners.dart';
import 'package:quiz/provider/faq.dart';
import 'package:quiz/provider/settings.dart';
import 'package:quiz/services/headers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SettingsController {
  static Future<void> getBanks({required BuildContext context}) async {
    final api = Quiz.create(interceptors: [TokenIndicator()]);
    try {
      await api.apiV1SettingGetBanksGet().then((postResult) {
        final body = jsonDecode(postResult.bodyString);

        if (body["isSuccess"] == true) {
          List data = body["data"];
          List<BankDto> values = [];
          print("befor");
          print(data);
          data.forEach((v) {
            BankDto value = BankDto.fromJson(v);
            values.add(value);
          });
          print("after");
          context.read<SettingsState>().getBanks(values: values);
        }
      });
    } catch (e) {
      print("faq error $e");
    }
  }
}
