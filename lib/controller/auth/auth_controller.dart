import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:quiz/model/api/swagger/generated/quiz.swagger.dart';
import 'package:quiz/view/auth/register/pincode_screen.dart';
import 'package:quiz/view/home/dashboard/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<dynamic> login({String? userName, required BuildContext context}) async {
  final api = Quiz.create();

  final postResult = await api.apiV1AuthRegisterPost(
    body: AuthDto(userName: userName!),
  );

  print("$postResult hhhhhh");
  print('Hereleeeeeeeeeeeeeeeeeeeeey');
  if (postResult.isSuccessful == true) {
    print(postResult.error);
    Navigator.of(context).push(
      PageRouteBuilder(
          pageBuilder: (_, __, ___) => PinCodeScreen(),
          transitionDuration: const Duration(milliseconds: 500),
          transitionsBuilder: (_, a, __, c) => FadeTransition(
                opacity: a,
                child: c,
              )),
    );
  } else {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      title: 'Oops...',
      text: postResult.error.toString(),
    );
  }
}

Future<dynamic> loginOtp({
  required BuildContext context,
  required AuthConfirmDto body,
}) async {
  print("OTP");
  final api = Quiz.create();
  final postResult = await api.apiV1AuthAccountVerificationPost(
    body: body,
  );
  //print(LoginOtpDto().code);
  print(postResult.body);
  print(postResult.error);
  //postResult.body.token

  if (postResult.isSuccessful == true) {
    print("hey im after route");
    SharedPreferences sp = await SharedPreferences.getInstance();
    Navigator.of(context).pushAndRemoveUntil(
        PageRouteBuilder(
            pageBuilder: (_, __, ___) => const HomeScreen(),
            transitionDuration: const Duration(milliseconds: 500),
            transitionsBuilder: (_, a, __, c) => FadeTransition(
                  opacity: a,
                  child: c,
                )),
        (route) => false);
  } else {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      title: 'Oops...',
      text: postResult.error.toString(),
    );
  }
}
