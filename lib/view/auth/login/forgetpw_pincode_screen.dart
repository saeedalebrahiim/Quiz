import 'package:flutter/material.dart';
import 'package:quiz/components/pinput_widget.dart';
import 'package:quiz/view/auth/login/forget_newpas_screen.dart';

class ForgetPwPinCodeScreen extends StatelessWidget {
  final _otpController = TextEditingController();
  ForgetPwPinCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 480,
            width: 480,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('lib/assets/images/forgetpwbg.png'),
            )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Row(
                  children: [
                    SizedBox(
                      width: 40,
                    ),
                    Text(
                      'Forget Password ',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
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
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                PinputWidget(pinController: _otpController),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 45,
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.refresh,
                            color: Colors.white,
                            size: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Send Code',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                )
              ],
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
                  width: 52,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(22)),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                        pageBuilder: (_, __, ___) => const ForgetNewPasScreen(),
                        transitionDuration: const Duration(milliseconds: 500),
                        transitionsBuilder: (_, a, __, c) => FadeTransition(
                              opacity: a,
                              child: c,
                            )),
                  );
                },
                child: Container(
                  width: 90,
                  height: 50,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage('lib/assets/images/buttun.png')),
                      borderRadius: BorderRadius.circular(22)),
                  child: const Center(
                      child: Text(
                    'Next',
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
