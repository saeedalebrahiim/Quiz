import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:quiz/model/api/swagger/generated/quiz.swagger.dart';
import 'package:quiz/services/headers.dart';
import 'package:quiz/view/auth/register/pincode_screen.dart';
import 'package:quiz/view/auth/register/register_two_screen.dart';
import 'package:quiz/view/home/dashboard/home_screen.dart';
import 'package:quiz/view/welcome/enter_screen.dart';
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
      print(postResult);
      if (postResult.isSuccessful == true) {
        //save token
        SharedPreferences sp = await SharedPreferences.getInstance();
        String token = postResult.body["access_token"];
        sp.setString("token", token);
        //navigate
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
            (route) => false);
      } else {
        //show error message
        QuickAlert.show(
            context: context, type: QuickAlertType.error, text: "OOPs");
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<void> logOut({required BuildContext context}) async {
    try {
      //save token
      SharedPreferences sp = await SharedPreferences.getInstance();
      sp.clear();
      //navigate
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => EnterScreen(),
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
          body: AuthDto(userName: userName, autoCode: ""));
      print(postResult);
      if (postResult.isSuccessful == true) {
        //send to otp confirm
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => PinCodeScreen(
            userName: userName,
          ),
        ));
      } else {
        //show error message
        QuickAlert.show(
            context: context, type: QuickAlertType.error, text: "OOPs");
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
              userName: userName, verificationCode: verificationCode));
      print(postResult);
      if (postResult.isSuccessful == true) {
        //send to select password
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
            context: context, type: QuickAlertType.error, text: "OOPs");
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
      print(postResult);
      if (postResult.isSuccessful == true) {
        //save token
        SharedPreferences sp = await SharedPreferences.getInstance();
        String token = postResult.body["access_token"];
        sp.setString("token", token);
        //navigate
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
            (route) => false);
      } else {
        //show error message
        QuickAlert.show(
            context: context, type: QuickAlertType.error, text: "OOPs");
      }
    } catch (e) {
      print(e);
    }
  }
  ///////////////
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
