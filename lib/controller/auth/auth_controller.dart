import 'dart:convert';

import 'package:bilgimizde/components/alarms_functions/no_account.dart';
import 'package:bilgimizde/view/auth/login/forgetpw_pincode_screen.dart';
import 'package:bilgimizde/view/auth/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:bilgimizde/controller/profile/profile.dart';
import 'package:bilgimizde/model/api/swagger/generated/quiz.swagger.dart';
import 'package:bilgimizde/services/headers.dart';
import 'package:bilgimizde/view/auth/register/pincode_screen.dart';
import 'package:bilgimizde/view/auth/register/register_two_screen.dart';
import 'package:bilgimizde/view/home/dashboard/home_screen.dart';
import 'package:bilgimizde/view/welcome/enter_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  static Future<void> login(
      {required String userName,
      required String password,
      required BuildContext context}) async {
    final api = Quiz.create();
    try {
      final postResult = await api.apiV1AuthTokenPost(
          username: userName, password: password, userRole: 2);

      final body = jsonDecode(postResult.bodyString);

      if (postResult.isSuccessful == true) {
        //save token
        SharedPreferences sp = await SharedPreferences.getInstance();
        String token = postResult.body["access_token"];
        sp.setString("token", token);
        //navigate
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
            (route) => false);
        ProfileController.getProfile(context: context);
      } else {
        //show error message
        body['message'] == "1"
            ? noAccountAlarm(context)
            : body['statusCode'] == 2
                ? body['message'].toString().contains("password")
                    ? QuickAlert.show(
                        context: context,
                        type: QuickAlertType.error,
                        text: "Yanlış şifre girdiniz")
                    : QuickAlert.show(
                        context: context,
                        type: QuickAlertType.error,
                        text: body['message'])
                : QuickAlert.show(
                    context: context,
                    type: QuickAlertType.error,
                    text: "Şifre yanlış");
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<void> logOut({required BuildContext context}) async {
    try {
      //save token
      SharedPreferences sp = await SharedPreferences.getInstance();
      await sp.remove("token");
      await sp.clear();
      await sp.reload();

      //navigate
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const EnterScreen(),
          ),
          (route) => false);
      //show error message
    } catch (e) {
      print(e);
    }
  }

  static Future<void> deleteAccount({required BuildContext context}) async {
    try {
      //save token
      final api = Quiz.create();
      final postResult = await api.apiV1UserManagerBlockUserGet();
      SharedPreferences sp = await SharedPreferences.getInstance();
      await sp.remove("token");
      await sp.clear();
      await sp.reload();

      //navigate
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const EnterScreen(),
          ),
          (route) => false);
      //show error message
    } catch (e) {
      print(e);
    }
  }

  static Future<void> register(
      {required String userName, required BuildContext context}) async {
    final api = Quiz.create();
    try {
      final postResult = await api.apiV1AuthRegisterPost(
          body: AuthDto(
        userName: userName,
        autoCode: "",
      ));

      final body = jsonDecode(postResult.bodyString);

      if (body["isSuccess"] == true) {
        //send to otp confirm
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => PinCodeScreen(
            userName: userName,
          ),
        ));
      } else {
        //show error message
        QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            text: "Sizin zaten hesabınız var");
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<void> confrimOtp(
      {required String userName,
      required String verificationCode,
      required BuildContext context}) async {
    final api = Quiz.create();
    try {
      final postResult = await api.apiV1AuthAccountVerificationPost(
          body: AuthConfirmDto(
              userName: userName, verificationCode: verificationCode, id: 0));

      if (postResult.body["access_token"] != "") {
        //send to select password
        SharedPreferences sp = await SharedPreferences.getInstance();
        String token = postResult.body["access_token"];
        sp.setString("token", token);
        Navigator.of(context).push(
          PageRouteBuilder(
              pageBuilder: (_, __, ___) => const RegisterStepTwoScreen(),
              transitionDuration: const Duration(milliseconds: 500),
              transitionsBuilder: (_, a, __, c) => FadeTransition(
                    opacity: a,
                    child: c,
                  )),
        );
      } else {
        //show error message
        QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            text: "Something went wrong!");
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<void> selectPassword(
      {required String password,
      required String confirmPassword,
      required BuildContext context}) async {
    final api = Quiz.create(interceptors: [TokenIndicator()]);
    try {
      final postResult = await api.apiV1AuthSelectPasswordPost(
        confirmPassword: confirmPassword,
        password: password,
      );

      final body = jsonDecode(postResult.bodyString);
      print(body);
      if (body["access_token"] != "") {
        //save token
        // SharedPreferences sp = await SharedPreferences.getInstance();
        // String token = postResult.body["access_token"];
        // sp.setString("token", token);
        SharedPreferences sp = await SharedPreferences.getInstance();
        String token = postResult.body["access_token"];
        sp.setString("token", token);
        //navigate
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
            (route) => false);
      } else {
        //show error message
        QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            text: "Something went wrong!");
      }
    } catch (e) {
      print(e);
    }
  }

  ///////////////
  ///
  static Future<void> forgetPassword(
      {required String userName, required BuildContext context}) async {
    final api = Quiz.create(interceptors: []);
    try {
      final postResult =
          await api.apiV1AuthForgotPasswordPost(userName: userName);

      final body = jsonDecode(postResult.bodyString);

      if (body["isSuccess"] == true) {
        //navigate
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => ForgetPwPinCodeScreen(
                userName: userName,
              ),
            ),
            (route) => false);
      } else {
        //show error message
        QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            text: "Something went wrong!");
      }
    } catch (e) {
      print(e);
    }
  }

  ///////////////
  ///
  static Future<void> changePassword({
    required String? userName,
    required String? verificationCode,
    required String? password,
    required String? confirmPassword,
    required BuildContext context,
  }) async {
    final api = Quiz.create(interceptors: []);
    try {
      final postResult = await api.apiV1AuthChangePasswordPost(
          userName: userName,
          confirmPassword: confirmPassword,
          password: password,
          verificationCode: verificationCode);

      if (postResult.isSuccessful == true) {
        //navigate
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
            (route) => false);
      } else {
        //show error message
        QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            text: "Something went wrong!");
      }
    } catch (e) {
      print(e);
    }
  }

  //////
  ///
  static Future<void> isAuth({
    required BuildContext context,
  }) async {
    final api = Quiz.create(interceptors: [TokenIndicator()]);
    try {
      final postResult = await api.apiV1AuthIsAuthenticatedGet();
      if (postResult.isSuccessful == true) {
        //navigate
      } else {
        //show error message
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
            (route) => false);
      }
    } catch (e) {
      print(e);
    }
  }
  //////
}


// Future<dynamic> login({String? userName, required BuildContext context}) async {
//   final api = Quiz.create();

//   final postResult = await api.apiV1AuthRegisterPost(
//     body: AuthDto(userName: userName!),
//   );

//   print("$postResult hhhhhh");
//   print('Hereleeeeeeeeeeeeeeeeeeeeey');
//   if (postResult.isSuccessful == true) {
//     print(postResult.error);
//     Navigator.of(context).push(
//       PageRouteBuilder(
//           pageBuilder: (_, __, ___) => PinCodeScreen(),
//           transitionDuration: const Duration(milliseconds: 500),
//           transitionsBuilder: (_, a, __, c) => FadeTransition(
//                 opacity: a,
//                 child: c,
//               )),
//     );
//   } else {
//     QuickAlert.show(
//       context: context,
//       type: QuickAlertType.error,
//       title: 'Oops...',
//       text: postResult.error.toString(),
//     );
//   }
// }

// Future<dynamic> loginOtp({
//   required BuildContext context,
//   required AuthConfirmDto body,
// }) async {
//   print("OTP");
//   final api = Quiz.create();
//   final postResult = await api.apiV1AuthAccountVerificationPost(
//     body: body,
//   );
//   //print(LoginOtpDto().code);
//   print(postResult.body);
//   print(postResult.error);
//   //postResult.body.token

//   if (postResult.isSuccessful == true) {
//     print("hey im after route");
//     SharedPreferences sp = await SharedPreferences.getInstance();
//     Navigator.of(context).pushAndRemoveUntil(
//         PageRouteBuilder(
//             pageBuilder: (_, __, ___) => const HomeScreen(),
//             transitionDuration: const Duration(milliseconds: 500),
//             transitionsBuilder: (_, a, __, c) => FadeTransition(
//                   opacity: a,
//                   child: c,
//                 )),
//         (route) => false);
//   } else {
//     QuickAlert.show(
//       context: context,
//       type: QuickAlertType.error,
//       title: 'Oops...',
//       text: postResult.error.toString(),
//     );
//   }
// }
