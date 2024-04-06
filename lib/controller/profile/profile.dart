import 'dart:convert';
import 'dart:typed_data';

import 'package:bilgimizde/components/alarms_functions/got_coin.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:bilgimizde/model/api/swagger/generated/quiz.swagger.dart';
import 'package:bilgimizde/model/dto/profile.dart';
import 'package:bilgimizde/provider/profile.dart';
import 'package:bilgimizde/services/headers.dart';
import 'package:bilgimizde/view/home/dashboard/home_screen.dart';
import 'package:bilgimizde/view/profile/edit_otp_screen.dart';
import 'package:http/http.dart' as http;
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  static Future<void> editProfileHTTP(
      {required String? fullName,
      XFile? file,
      String? education,
      int? bankId,
      String? iban,
      required BuildContext context}) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

//for main image
      Uint8List? bytes;
      if (file != null) {
        var stream = http.ByteStream(file.openRead());
        bytes = await file.readAsBytes();
        final int length = await file.length();
      }

//for gallery image
      print("this is length");

      List<http.MultipartFile> galleryMultiPartFile = <http.MultipartFile>[];
      print("this is Multipart");

      final request = http.MultipartRequest(
          'post',
          Uri.parse(
              "https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/UserManager/EditProfile"))
        ..fields['FullName'] = fullName.toString()
        ..fields['Education'] = education ?? ""
        ..fields['BankId'] = bankId != null ? bankId.toString() : ""
        ..fields['IBAN'] = iban ?? "";

      if (bytes != null) {
        request.files.add(http.MultipartFile.fromBytes(
          "file",
          bytes,
          filename: '.png',
        ));
      }

      // ..files.add(await http.MultipartFile.fromPath(
      //     "MainBookImage", dto.mainBookImage!.path));

      // for (var i = 0; i < dto.galleryBookImage!.length; i++) {
      //   var streamGallery = http.ByteStream(dto.galleryBookImage![i].openRead());
      //   request.files.add(await http.MultipartFile.fromPath(
      //       "GalleryBookImage", dto.galleryBookImage![i].path));
      // }

      request.headers['authorization'] =
          'Bearer ${sharedPreferences.getString('token')}';

      request.headers['Content-Type'] = 'multipart/form-data';

      http.Response response =
          await http.Response.fromStream(await request.send());
      print(response.body);
      getProfile(context: context);
    } catch (e) {
      print(e);
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

  static Future<void> addToBalance(
      {required int count, required BuildContext context}) async {
    final api = Quiz.create(interceptors: [TokenIndicator()]);

    try {
      await api.apiV1UserManagerAddScorePost(count: count).then((postResult) {
        final body = jsonDecode(postResult.bodyString);
        print(body);
        print(body["isSuccess"]);
        if (body["isSuccess"] == true) {
          gotCoin(context);
          getUserBalance(context: context);
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
        } else {
          QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            text: "Something went wrong!",
          );
        }
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
