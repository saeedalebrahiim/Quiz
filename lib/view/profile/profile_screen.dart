import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
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
            color: Color.fromARGB(255, 0, 3, 66),
            image: DecorationImage(
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
                              pageBuilder: (_, __, ___) => HomeScreen(),
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
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('lib/assets/images/back.png'))),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'lib/assets/images/addprofilebg.png'))),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
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
              SizedBox(
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
              SizedBox(
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
                                        ChangePwScreen(),
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
                              decoration: BoxDecoration(
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
              SizedBox(
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
              SizedBox(
                height: 30,
              ),
              Row(
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
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 42,
                  ),
                  Text(
                    'TR',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    child: TextField(
                        style: TextStyle(color: Colors.white),
                        controller: _ibanController,
                        decoration: InputDecoration()),
                    width: 220,
                  )
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                width: 130,
                height: 40,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('lib/assets/images/addbank.png'),
                        fit: BoxFit.fill)),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 170,
                height: 40,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('lib/assets/images/save.png'),
                        fit: BoxFit.fill)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
