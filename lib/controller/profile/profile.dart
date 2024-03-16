import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bilgimizde/model/api/swagger/generated/quiz.swagger.dart';
import 'package:bilgimizde/model/dto/profile.dart';
import 'package:bilgimizde/provider/profile.dart';
import 'package:bilgimizde/services/headers.dart';
import 'package:bilgimizde/view/home/dashboard/home_screen.dart';
import 'package:bilgimizde/view/profile/edit_otp_screen.dart';

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

  static Future<void> addToWatchScore({required BuildContext context}) async {
    final api = Quiz.create(interceptors: [TokenIndicator()]);

    try {
      await api.apiV1ScoreAddScorePost(isWatchAds: true).then((postResult) {
        final body = jsonDecode(postResult.bodyString);
        print(body);
        print(body["isSuccess"]);
        if (body["isSuccess"] == true) {
          getUserBalance(context: context);
        } else {}
      });
    } catch (e) {
      // print(e);
    }
  }

  static Future<void> updateUserProfileGET(
      {required String number, required BuildContext context}) async {
    final api = Quiz.create(interceptors: [TokenIndicator()]);

    try {
      await api
          .apiV1UserManagerUpdatePhoneNumberGet(newPhonenumber: number)
          .then((postResult) {
        final body = jsonDecode(postResult.bodyString);
        print(body);
        print(body["isSuccess"]);
        if (body["isSuccess"] == true) {
          Navigator.of(context).push(
            PageRouteBuilder(
                pageBuilder: (_, __, ___) => EditPwOtpScreen(number: number),
                transitionDuration: const Duration(milliseconds: 500),
                transitionsBuilder: (_, a, __, c) => FadeTransition(
                      opacity: a,
                      child: c,
                    )),
          );
        } else {}
      });
    } catch (e) {
      // print(e);
    }
  }

  static Future<void> updateUserProfilePOST(
      {required String number,
      required String otp,
      required BuildContext context}) async {
    final api = Quiz.create(interceptors: [TokenIndicator()]);

    try {
      await api
          .apiV1UserManagerUpdatePhoneNumberPost(
              body: UpdatePhoneNumberDto(phoneNumber: number, verifyCode: otp))
          .then((postResult) {
        final body = jsonDecode(postResult.bodyString);
        print(body);
        print(body["isSuccess"]);
        if (body["isSuccess"] == true) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
              (route) => false);
        } else {}
      });
    } catch (e) {
      // print(e);
    }
  }

  static Future<bool> removeProfilePhoto(
      {required BuildContext context}) async {
    final api = Quiz.create(interceptors: [TokenIndicator()]);
    bool ret = false;
    try {
      await api.apiV1UserManagerRemoveUserProfilePost().then((postResult) {
        final body = jsonDecode(postResult.bodyString);
        print(body);
        print(body["isSuccess"]);
        if (body["isSuccess"] == true) {
          ret = true;
        } else {
          ret = false;
        }
      });
    } catch (e) {
      // print(e);
      ret = false;
    }
    return ret;
  }
}
