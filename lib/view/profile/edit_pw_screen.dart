import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:bilgimizde/controller/profile/profile.dart';

class ChangePwScreen extends StatefulWidget {
  const ChangePwScreen({super.key, required this.number});
  final String number;

  @override
  State<ChangePwScreen> createState() => _ChangePwScreenState();
}

class _ChangePwScreenState extends State<ChangePwScreen> {
  CountryCode crCode = CountryCode(code: "+90", name: "TR");
  var numberController = TextEditingController();

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
                height: 150,
              ),
              const Row(
                children: [
                  SizedBox(
                    width: 65,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Edit Phone Number',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                      Text(
                        'Add Phone',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: SizedBox(
                  width: 316,
                  height: 64,
                  child: TextFormField(
                      controller: numberController,
                      keyboardType: TextInputType.phone,
                      maxLength: 10,
                      decoration: InputDecoration(
                          counterText: "",
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Container(
                              decoration: const BoxDecoration(
                                  border:
                                      Border(right: BorderSide(width: 0.2))),
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
              ),
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
                      var phoneNumer =
                          crCode.code.toString() + numberController.text;
                      ProfileController.updateUserProfileGET(
                          number: phoneNumer, context: context);
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
                            color: Colors.black, fontWeight: FontWeight.bold),
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
