import 'package:flutter/material.dart';
import 'package:bilgimizde/components/pinput_widget.dart';
import 'package:bilgimizde/controller/profile/profile.dart';

class EditPwOtpScreen extends StatefulWidget {
  // final _otpController = TextEditingController();
  const EditPwOtpScreen({super.key, required this.number});
  final String number;

  @override
  State<EditPwOtpScreen> createState() => _EditPwOtpScreenState();
}

class _EditPwOtpScreenState extends State<EditPwOtpScreen> {
  final otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 10, 21, 94),
            image: DecorationImage(
                image: AssetImage('lib/assets/images/bg2.png'),
                fit: BoxFit.fill)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 45),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 54,
                        height: 54,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('lib/assets/images/back.png'))),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 120,
              ),
              const SizedBox(
                height: 30,
              ),
              const Row(
                children: [
                  SizedBox(
                    width: 40,
                  ),
                  Text(
                    'Parolanızı mı unuttunuz',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
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
              PinputWidget(pinController: otpController),
              const SizedBox(
                height: 20,
              ),
              // Row(
              //   children: [
              //     const SizedBox(
              //       width: 45,
              //     ),
              //     InkWell(
              //       onTap: () {},
              //       child: const Row(
              //         mainAxisSize: MainAxisSize.min,
              //         children: [
              //           Icon(
              //             Icons.refresh,
              //             color: Colors.white,
              //             size: 20,
              //           ),
              //           SizedBox(
              //             width: 5,
              //           ),
              //           Text(
              //             'Send Code',
              //             style: TextStyle(color: Colors.white),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ],
              // ),
              const SizedBox(
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
                      width: 64,
                      height: 64,
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
                      // Navigator.of(context).push(
                      //   PageRouteBuilder(
                      //       pageBuilder: (_, __, ___) => ProfileScreen(),
                      //       transitionDuration: const Duration(milliseconds: 500),
                      //       transitionsBuilder: (_, a, __, c) => FadeTransition(
                      //             opacity: a,
                      //             child: c,
                      //           )),
                      // );
                      ProfileController.updateUserProfilePOST(
                          number: widget.number,
                          otp: otpController.text,
                          context: context);
                    },
                    child: Container(
                      width: 144,
                      height: 64,
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              image:
                                  AssetImage('lib/assets/images/buttun.png')),
                          borderRadius: BorderRadius.circular(22)),
                      child: const Center(
                          child: Text(
                        'sonraki',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
                      )),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
