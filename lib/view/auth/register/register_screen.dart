import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:quiz/controller/auth/auth_controller.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _numberController = TextEditingController();
  CountryCode crCode = CountryCode(code: "+90", name: "TR");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
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
                        'Telefon numaranızı girin',
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
                        decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Container(
                                decoration: const BoxDecoration(
                                    border:
                                        Border(right: BorderSide(width: 0.2))),
                                child: const CountryCodePicker(
                                  showFlagDialog: true,
                                  showFlag: false,
                                  onChanged: print,
                                  initialSelection: 'IT',
                                  favorite: ['+39', 'FR'],
                                  countryFilter: ['IT', 'FR'],
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
                  // login(context: context, userName: _numberController.text)
                  //     .then((value) {});
                  String number = "+98${_numberController.text}";
                  AuthController.register(userName: number, context: context);
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
