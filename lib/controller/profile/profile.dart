import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/model/api/swagger/generated/quiz.swagger.dart';
import 'package:quiz/model/dto/profile.dart';
import 'package:quiz/provider/profile.dart';
import 'package:quiz/services/headers.dart';

class ProfileController {
  static Future<void> getProfile({required BuildContext context}) async {
    final api = Quiz.create(interceptors: [TokenIndicator()]);

    try {
      await api.apiV1UserManagerViewProfileGet().then((postResult) {
        final body = jsonDecode(postResult.bodyString);
        print(body);
        print(body["isSuccess"]);
        if (body["isSuccess"] == true) {
          print("wtf");
          final data = body["data"];
          print(data);
          print(data['fullName']);
          ProfileDto profile = ProfileDto.fromJson(data);
          print(profile.userPicUrl);
          context.read<ProfileState>().getProfile(user: profile);
        }
      });
    } catch (e) {
      // print(e);
    }
  }

  static Future<void> editProfile(
      {required String? fullName,
      List<int>? file,
      String? education,
      int? bankId,
      String? iban,
      required BuildContext context}) async {
    final api = Quiz.create(interceptors: [TokenIndicator()]);

    try {
      await api
          .apiV1UserManagerEditProfilePost(
        fullName: fullName,
        bankId: bankId,
        education: education,
        file: file,
        iban: iban,
      )
          .then((postResult) {
        final body = jsonDecode(postResult.bodyString);
        print(body);
        print(body["isSuccess"]);
      });
    } catch (e) {
      // print(e);
    }
  }

  static Future<void> getUserBalance({required BuildContext context}) async {
    final api = Quiz.create(interceptors: [TokenIndicator()]);

    try {
      await api.apiV1ScoreGetUserBalanceGet().then((postResult) {
        final body = jsonDecode(postResult.bodyString);
        print(body);
        print(body["isSuccess"]);
        if (body["isSuccess"] == true) {
          context.read<ProfileState>().getUserBalance(value: body["data"]);
        } else {}
      });
    } catch (e) {
      // print(e);
    }
  }
}
