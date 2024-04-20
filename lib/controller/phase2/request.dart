import 'dart:convert';

import 'package:bilgimizde/controller/profile/profile.dart';
import 'package:bilgimizde/view/home/quiz/end_quiz_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bilgimizde/model/api/swagger/generated/quiz.swagger.dart';
import 'package:bilgimizde/model/dto/question.dart';
import 'package:bilgimizde/model/dto/quiz.dart';
import 'package:bilgimizde/provider/quiz.dart';
import 'package:bilgimizde/services/headers.dart';
import 'package:bilgimizde/view/home/quiz/quiz_screen.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class RequestController {
  static Future<void> requestList({
    required BuildContext context,
  }) async {
    final api = Quiz.create(interceptors: [TokenIndicator()]);
    try {
      await api.apiV1WordGameUserRequestPaymentListPost().then((postResult) {
        print("called start");

        final body = jsonDecode(postResult.bodyString)["data"];
        final res = jsonDecode(postResult.bodyString);
        print(res);
        print(body);

        if (res["isSuccess"] == true) {}
      });
    } catch (e) {
      print(e);
    }
  }

  static Future<void> addRequest({
    required BuildContext context,
  }) async {
    final api = Quiz.create(interceptors: [TokenIndicator()]);
    try {
      await api.apiV1WordGameRequestPaymentPost().then((postResult) {
        print("called start");

        final body = jsonDecode(postResult.bodyString)["data"];
        final res = jsonDecode(postResult.bodyString);
        print(res);
        print(body);
        QuickAlert.show(
            context: context, type: QuickAlertType.info, title: res["message"]);
        if (res["isSuccess"] == true) {}
      });
    } catch (e) {
      print(e);
    }
  }
}
