import 'package:bilgimizde/controller/auth/auth_controller.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ForgetPwScreen extends StatefulWidget {
  const ForgetPwScreen({super.key});

  @override
  State<ForgetPwScreen> createState() => _ForgetPwScreenState();
}

class _ForgetPwScreenState extends State<ForgetPwScreen> {
  bool visible = true;

  final _numberController = TextEditingController();
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
                          'Parolanızı mı unuttunuz',
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
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 316,
                      height: 64,
                      child: TextFormField(
                          controller: _numberController,
                          maxLength: 10,
                          keyboardType: TextInputType.phone,
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
                      height: 100,
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
                    setState(() {
                      visible = false;
                    });
                    String userName =
                        crCode.code.toString() + _numberController.text;
                    print(userName);

                    AuthController.forgetPassword(
                            userName: userName, context: context)
                        .then((value) => setState(() {
                              visible = true;
                            }));
                    // Navigator.o
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
                        'sonraki',
                        style: TextStyle(
                          color: Colors.white,
                        ),
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
