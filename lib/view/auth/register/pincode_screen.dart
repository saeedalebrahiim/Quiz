import 'package:bilgimizde/components/pinput_widget.dart';
import 'package:bilgimizde/controller/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class PinCodeScreen extends StatefulWidget {
  PinCodeScreen({super.key, required this.userName});
  final String userName;

  @override
  State<PinCodeScreen> createState() => _PinCodeScreenState();
}

class _PinCodeScreenState extends State<PinCodeScreen> {
  final _otpController = TextEditingController();

  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                height: MediaQuery.of(context).size.height * 3 / 4,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('lib/assets/images/forgetpwbg.png'),
                        fit: BoxFit.fill)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Row(
                      children: [
                        SizedBox(
                          width: 40,
                        ),
                        Text(
                          'Kayıt',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                      ],
                    ),
                    const Row(
                      children: [
                        SizedBox(
                          width: 40,
                        ),
                        Text(
                          'Enter Code',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    PinputWidget(
                      pinController: _otpController,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 45,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 18,
                                height: 18,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'lib/assets/images/repeat.png'))),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                'Yeniden kodu gönder',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 60,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 68,
                    height: 68,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(50)),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(),
                InkWell(
                  onTap: () {
                    AuthController.confrimOtp(
                            userName: widget.userName,
                            verificationCode: _otpController.text,
                            context: context)
                        .then((value) => visible = true);
                    // Navigator.of(context).push(
                    //   PageRouteBuilder(
                    //       pageBuilder: (_, __, ___) =>
                    //           const RegisterStepTwoScreen(),
                    //       transitionDuration: const Duration(milliseconds: 500),
                    //       transitionsBuilder: (_, a, __, c) => FadeTransition(
                    //             opacity: a,
                    //             child: c,
                    //           )),
                    // );
                  },
                  child: Visibility(
                    replacement: Container(
                      width: 144,
                      height: 68,
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              image:
                                  AssetImage('lib/assets/images/buttun.png')),
                          borderRadius: BorderRadius.circular(22)),
                      child: LoadingAnimationWidget.fourRotatingDots(
                          color: Colors.white, size: 20),
                    ),
                    visible: visible,
                    child: Container(
                      width: 144,
                      height: 68,
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              image:
                                  AssetImage('lib/assets/images/buttun.png')),
                          borderRadius: BorderRadius.circular(22)),
                      child: const Center(
                          child: Text(
                        'Next',
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
