import 'package:bilgimizde/components/pinput_widget.dart';
import 'package:bilgimizde/view/auth/login/forget_newpas_screen.dart';
import 'package:flutter/material.dart';

class ForgetPwPinCodeScreen extends StatefulWidget {
  const ForgetPwPinCodeScreen({super.key, required this.userName});
  final String userName;

  @override
  State<ForgetPwPinCodeScreen> createState() => _ForgetPwPinCodeScreenState();
}

class _ForgetPwPinCodeScreenState extends State<ForgetPwPinCodeScreen> {
  bool visible = true;
  final _otpController = TextEditingController();

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
                          'Parolanızı mı unuttunuz ',
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
                          'Kodu girin',
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
                InkWell(
                  onTap: () {
                    if (_otpController.text.length == 6) {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                            pageBuilder: (_, __, ___) => ForgetNewPasScreen(
                                  pin: _otpController.text,
                                  userName: widget.userName,
                                ),
                            transitionDuration:
                                const Duration(milliseconds: 500),
                            transitionsBuilder: (_, a, __, c) => FadeTransition(
                                  opacity: a,
                                  child: c,
                                )),
                      );
                    }
                  },
                  child: Container(
                    width: 144,
                    height: 68,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage('lib/assets/images/buttun.png')),
                        borderRadius: BorderRadius.circular(22)),
                    child: const Center(
                        child: Text(
                      'sonraki',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )),
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
