import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:quiz/view/auth/login/login_screen.dart';

class ForgetNewPasScreen extends StatefulWidget {
  const ForgetNewPasScreen({super.key});

  @override
  State<ForgetNewPasScreen> createState() => _ForgetNewPasScreenState();
}

class _ForgetNewPasScreenState extends State<ForgetNewPasScreen> {
  bool _passwordVisible = false;

  final _confirmPasswordController = TextEditingController();

  final _userPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                        'Tayp Password',
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
                  SizedBox(
                    width: 240,
                    height: 45,
                    child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: _userPasswordController,
                        obscureText: !_passwordVisible,
                        decoration: InputDecoration(
                            suffixIcon: InkWell(
                              onTap: () {
                                // Update the state i.e. toogle the state of passwordVisible variable
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                              child: Container(
                                width: 1,
                                height: 1,
                                decoration: BoxDecoration(
                                    image: _passwordVisible
                                        ? const DecorationImage(
                                            image: AssetImage(
                                                'lib/assets/images/show.png'),
                                          )
                                        : const DecorationImage(
                                            image: AssetImage(
                                                'lib/assets/images/hide.png'),
                                          )),
                              ),
                            ),
                            hintText: 'Password',
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(30)),
                            filled: true,
                            fillColor: Colors.white)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 240,
                    height: 45,
                    child: TextFormField(
                        obscureText: true,
                        controller: _confirmPasswordController,
                        decoration: InputDecoration(
                            hintText: 'Comfrem Password',
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(30)),
                            filled: true,
                            fillColor: Colors.white)),
                  ),
                  const SizedBox(
                    height: 60,
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
                    if (_userPasswordController.text !=
                        _confirmPasswordController.text) {
                      showToastWidget(
                        position:
                            const StyledToastPosition(align: Alignment.bottomCenter),
                        Container(
                          width: 250,
                          height: 55,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage('lib/assets/images/toast.png'),
                                  fit: BoxFit.fill)),
                          child: const Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'New password',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                    Text(
                                      'confirmation doesn’t match.',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 60,
                                )
                              ],
                            ),
                          ),
                        ),
                        context: context,
                        isIgnoring: true,
                      );
                    } else {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                            pageBuilder: (_, __, ___) => const LoginScreen(),
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
      ),
    );
  }
}
