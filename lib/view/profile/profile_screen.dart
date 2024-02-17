import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:quiz/global.dart';
import 'package:quiz/view/home/dashboard/home_screen.dart';
import 'package:quiz/view/profile/edit_pw_screen.dart';

class ProfileScreen extends StatelessWidget {
  final _nameFamilyController = TextEditingController();
  final _numberController = TextEditingController();
  final _educationController = TextEditingController();
  final _ibanController = TextEditingController();
  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: primaryColor,
            image: const DecorationImage(
                image: AssetImage('lib/assets/images/bg1.png'),
                fit: BoxFit.fill)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 20),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                              pageBuilder: (_, __, ___) => const HomeScreen(),
                              transitionDuration:
                                  const Duration(milliseconds: 500),
                              transitionsBuilder: (_, a, __, c) =>
                                  FadeTransition(
                                    opacity: a,
                                    child: c,
                                  )),
                        );
                      },
                      child: Container(
                        width: 50,
                        height: 50,
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
                height: 30,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'lib/assets/images/addprofilebg.png'))),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'o1462bG4',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'Free',
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: 270,
                height: 45,
                child: TextFormField(
                    obscureText: true,
                    controller: _nameFamilyController,
                    decoration: InputDecoration(
                        hintText: 'Name & Family',
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
                width: 270,
                height: 45,
                child: TextFormField(
                    controller: _numberController,
                    decoration: InputDecoration(
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                PageRouteBuilder(
                                    pageBuilder: (_, __, ___) =>
                                        const ChangePwScreen(),
                                    transitionDuration:
                                        const Duration(milliseconds: 500),
                                    transitionsBuilder: (_, a, __, c) =>
                                        FadeTransition(
                                          opacity: a,
                                          child: c,
                                        )),
                              );
                            },
                            child: Container(
                              width: 2,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'lib/assets/images/numberedit.png'))),
                            ),
                          ),
                        ),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                            decoration: const BoxDecoration(
                                border: Border(right: BorderSide(width: 0.2))),
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
                height: 10,
              ),
              SizedBox(
                width: 270,
                height: 45,
                child: TextFormField(
                    obscureText: true,
                    controller: _educationController,
                    decoration: InputDecoration(
                        hintText: 'Education',
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(30)),
                        filled: true,
                        fillColor: Colors.white)),
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
                    'Enter your IBAN',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 42,
                  ),
                  const Text(
                    'TR',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 220,
                    child: TextField(
                        style: const TextStyle(color: Colors.white),
                        controller: _ibanController,
                        decoration: const InputDecoration()),
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                width: 130,
                height: 40,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('lib/assets/images/addbank.png'),
                        fit: BoxFit.fill)),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 170,
                height: 40,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('lib/assets/images/save.png'),
                        fit: BoxFit.fill)),
              ),
              const SizedBox(
                height: 25,
              ),
              const SizedBox(
                width: 200,
                child: Divider(
                  color: Colors.red,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: 100,
                  height: 34,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('lib/assets/images/logout.png'),
                          fit: BoxFit.fill)),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
