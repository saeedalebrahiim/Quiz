import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:quiz/controller/auth/auth_controller.dart';
import 'package:quiz/view/auth/login/forgetpw_screen.dart';
import 'package:quiz/view/auth/register/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _userPasswordController = TextEditingController();
  final _numberController = TextEditingController();
  bool _passwordVisible = false;
  CountryCode crCode = CountryCode(code: "+90", name: "TR");

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
                height: MediaQuery.of(context).size.height / 1.5,
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
                          'Login',
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
                          'Whit Namber',
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
                          controller: _numberController,
                          maxLength: 10,
                          decoration: InputDecoration(
                              counterText: "",
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Container(
                                  decoration: const BoxDecoration(
                                      border: Border(
                                          right: BorderSide(width: 0.2))),
                                  child: CountryCodePicker(
                                    showFlagDialog: true,
                                    showFlag: false,
                                    onChanged: (value) {
                                      setState(() {
                                        crCode = value;
                                      });
                                    },
                                    initialSelection: 'TR',
                                    favorite: const ['+90', 'TR'],
                                    countryFilter: const ['IT', 'FR', 'TR'],
                                  ),
                                ),
                              ),
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
                    Row(
                      children: [
                        const SizedBox(
                          width: 48,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                  pageBuilder: (_, __, ___) => ForgetPwScreen(),
                                  transitionDuration:
                                      const Duration(milliseconds: 500),
                                  transitionsBuilder: (_, a, __, c) =>
                                      FadeTransition(
                                        opacity: a,
                                        child: c,
                                      )),
                            );
                          },
                          child: const Text(
                            'Forget Password ?',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 45,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                      pageBuilder: (_, __, ___) => const RegisterScreen(),
                      transitionDuration: const Duration(milliseconds: 500),
                      transitionsBuilder: (_, a, __, c) => FadeTransition(
                            opacity: a,
                            child: c,
                          )),
                );
              },
              child: const Text(
                'Create an account ?',
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.blue,
                    fontWeight: FontWeight.w500),
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
                    String userName =
                        crCode.code.toString() + _numberController.text;
                    print(userName);
                    print(_userPasswordController.text);

                    AuthController.login(
                        userName: userName,
                        password: _userPasswordController.text,
                        context: context);
                    // Navigator.of(context).push(
                    //   PageRouteBuilder(
                    //       pageBuilder: (_, __, ___) => const HomeScreen(),
                    //       transitionDuration: const Duration(milliseconds: 500),
                    //       transitionsBuilder: (_, a, __, c) => FadeTransition(
                    //             opacity: a,
                    //             child: c,
                    //           )),
                    // );
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
