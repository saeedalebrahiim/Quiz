import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bilgimizde/model/api/swagger/generated/quiz.swagger.dart';
import 'package:bilgimizde/model/dto/banks.dart';
import 'package:bilgimizde/provider/settings.dart';
import 'package:bilgimizde/services/headers.dart';

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
          for (var v in data) {
            BankDto value = BankDto.fromJson(v);
            values.add(value);
          }
          print("after");
          context.read<SettingsState>().getBanks(values: values);
        }
      });
    } catch (e) {
      print("faq error $e");
    }
  }
}
