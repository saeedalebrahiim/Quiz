import 'package:cached_network_image/cached_network_image.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/controller/auth/auth_controller.dart';
import 'package:quiz/controller/profile/profile.dart';
import 'package:quiz/global.dart';
import 'package:quiz/provider/profile.dart';
import 'package:quiz/view/home/dashboard/home_screen.dart';
import 'package:quiz/view/profile/edit_pw_screen.dart';

class ProfileScreen extends StatelessWidget {
  var _nameFamilyController = TextEditingController();
  var _numberController = TextEditingController();
  var _educationController = TextEditingController();
  var _ibanController = TextEditingController();
  var _bankIdController = TextEditingController();

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
          child: Consumer<ProfileState>(
            builder: (context, value, child) {
              _nameFamilyController.text =
                  value.profile != null ? value.profile!.fullName : "";
              _numberController.text =
                  value.profile != null ? value.profile!.username : "";
              _educationController.text =
                  value.profile != null ? value.profile!.education : "";
              _ibanController.text =
                  value.profile != null ? value.profile!.iban : "";
              _bankIdController.text =
                  value.profile != null ? value.profile!.bankId.toString() : "";
              return Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 20),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                  pageBuilder: (_, __, ___) =>
                                      const HomeScreen(),
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
                                    image: AssetImage(
                                        'lib/assets/images/back.png'))),
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
                            // image: DecorationImage(
                            //   image:
                            //       AssetImage('lib/assets/images/addprofilebg.png'),
                            // ),
                            ),
                        child: CachedNetworkImage(
                          imageUrl: value.profile != null
                              ? value.profile!.userPicUrl
                              : "",
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 10, 21, 94),
                              borderRadius: BorderRadius.circular(30),
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) => const Image(
                            image: AssetImage(
                                'lib/assets/images/addprofilebg.png'),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            value.profile != null
                                ? value.profile!.fullName
                                : "name",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            //TODO wrf plan
                            value.profile == null
                                ? value.profile!.fullName
                                : "Free",
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
                        obscureText: false,
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
                    height: 10,
                  ),
                  SizedBox(
                    width: 270,
                    height: 45,
                    child: TextFormField(
                        obscureText: false,
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
                  Row(
                    children: [
                      SizedBox(
                        width: 40,
                      ),
                      Text(
                        "IBAN: ${value.profile != null ? value.profile!.iban : ""}",
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
                            controller: _bankIdController,
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
                  InkWell(
                    onTap: () {
                      ProfileController.editProfile(
                          fullName: _nameFamilyController.text,
                          bankId: int.tryParse(_bankIdController.text),
                          education: _educationController.text,
                          iban: _ibanController.text,
                          context: context);
                    },
                    child: Container(
                      width: 170,
                      height: 40,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('lib/assets/images/save.png'),
                              fit: BoxFit.fill)),
                    ),
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
                    onTap: () {
                      AuthController.logOut(context: context);
                    },
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
              );
            },
          ),
        ),
      ),
    );
  }
}
