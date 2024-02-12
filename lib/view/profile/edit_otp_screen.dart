import 'package:flutter/material.dart';
import 'package:quiz/components/pinput_widget.dart';
import 'package:quiz/view/profile/profile_screen.dart';

class EditPwOtpScreen extends StatelessWidget {
  final _otpController = TextEditingController();
  EditPwOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _numberController = TextEditingController();
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 20),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('lib/assets/images/back.png'))),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 120,
            ),
            SizedBox(
              height: 30,
            ),
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
            SizedBox(
              height: 130,
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
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                          pageBuilder: (_, __, ___) => ProfileScreen(),
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
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    )),
                  ),
                )
              ],
            )
          ],
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 10, 21, 94),
            image: DecorationImage(
                image: AssetImage('lib/assets/images/bg2.png'),
                fit: BoxFit.fill)),
      ),
    );
  }
}
