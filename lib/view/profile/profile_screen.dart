import 'package:cached_network_image/cached_network_image.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:filter_list/filter_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:matertino_radio/matertino_radio.dart';
import 'package:provider/provider.dart';
import 'package:quiz/controller/auth/auth_controller.dart';
import 'package:quiz/controller/profile/profile.dart';
import 'package:quiz/controller/settings/settings.dart';
import 'package:quiz/global.dart';
import 'package:quiz/provider/profile.dart';
import 'package:quiz/provider/settings.dart';
import 'package:quiz/view/home/dashboard/home_screen.dart';
import 'package:quiz/view/profile/edit_pw_screen.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  XFile? _imgFile;
  @override
  void initState() {
    super.initState();
    SettingsController.getBanks(context: context);
  }

  // getData() {
  //   int index = SettingsState.banksID!.indexOf(bankIdSelected!);
  //   setState(() {
  //     bankIdTitleSelected = SettingsState.banksTitle![index];
  //   });
  // }

  var _nameFamilyController = TextEditingController();

  var _numberController = TextEditingController();

  var _educationController = TextEditingController();

  var _ibanController = TextEditingController();

  var _bankIdController = TextEditingController();
  int? bankIdSelected;
  String? bankIdTitleSelected;

  List<BankDto> selectedListData = [];
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
              _numberController.text = value.profile != null
                  ? value.profile!.username.replaceRange(0, 2, "")
                  : "";
              _educationController.text =
                  value.profile != null ? value.profile!.education : "";
              _ibanController.text =
                  value.profile != null ? value.profile!.iban : "";
              _bankIdController.text =
                  value.profile != null ? value.profile!.bankId.toString() : "";
              bankIdSelected = value.profile!.bankId;
              // getData();
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
                      InkWell(
                        onTap: () {
                          showBottomSheet(
                            context: context,
                            builder: (context) => Container(
                              height: 80,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      try {
                                        final ImagePicker picker =
                                            ImagePicker();
                                        final XFile? img =
                                            await picker.pickImage(
                                          source: ImageSource.camera,
                                        );
                                        if (img == null) return;
                                        setState(() {
                                          _imgFile = XFile(img.path);
                                        });
                                      } catch (e) {
                                        print(e);
                                      }
                                    },
                                    child: Container(
                                      width: 55,
                                      height: 55,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'lib/assets/images/camera.png'),
                                              fit: BoxFit.fill)),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      try {
                                        final ImagePicker picker =
                                            ImagePicker();
                                        final XFile? img =
                                            await picker.pickImage(
                                          source: ImageSource.gallery,
                                        );
                                        if (img == null) return;
                                        setState(() {
                                          _imgFile = XFile(img.path);
                                        });
                                      } catch (e) {
                                        print(e);
                                      }
                                    },
                                    child: Container(
                                      width: 55,
                                      height: 55,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'lib/assets/images/gallery.png'),
                                              fit: BoxFit.fill)),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      width: 55,
                                      height: 55,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'lib/assets/images/delete.png'),
                                              fit: BoxFit.fill)),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        child: Container(
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
                        readOnly: true,
                        decoration: InputDecoration(
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    PageRouteBuilder(
                                        pageBuilder: (_, __, ___) =>
                                            ChangePwScreen(
                                              number: _numberController.text,
                                            ),
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
                                child: const IgnorePointer(
                                  ignoring: true,
                                  child: CountryCodePicker(
                                    showFlagDialog: true,
                                    showFlag: false,
                                    onChanged: print,
                                    initialSelection: 'TR',
                                    favorite: ['+90', 'TR'],
                                    countryFilter: ['IT', 'FR', 'TR'],
                                  ),
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
                        "IBAN:",
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
                  Consumer<SettingsState>(
                    builder: (context, value, child) {
                      bankIdTitleSelected == null && value.banks != null
                          ? bankIdTitleSelected = value.banks!
                              .firstWhere(
                                (element) => element.id == bankIdSelected,
                              )
                              .title
                          : null;
                      return Visibility(
                        visible: value.banksTitle != null,
                        replacement: SizedBox(),
                        child: value.banksTitle != null
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: 200,
                                  child: MatertinoBottomSheetRadio(
                                    list: value.banksTitle!,
                                    selected: bankIdTitleSelected,
                                    onSelect: (val) {
                                      // int index = SettingsState.banksTitle!.indexOf(val!);
                                      setState(() {
                                        bankIdTitleSelected = val;
                                        // bankIdSelected = SettingsState.banksID![index];
                                      });
                                    },
                                    child: CupertinoTextField(
                                      onTap: null,
                                      controller: TextEditingController(
                                          text: bankIdTitleSelected),
                                      placeholder: "Select Item",
                                      enabled: false,
                                      suffix: const Icon(Icons.arrow_drop_down),
                                    ),
                                  ),
                                ),
                              )
                            : SizedBox(),
                      );
                    },
                  ),

                  // Consumer<SettingsState>(builder: (context, value, child) {
                  //   return RawMaterialButton(
                  //     onPressed: () async {
                  //       await FilterListDelegate.show(
                  //         context: context,
                  //         list: value.banks!,
                  //         selectedListData: selectedListData,
                  //         tileLabel: (p0) => p0!.title,
                  //         onItemSearch: (user, query) {
                  //           return user.title
                  //               .toLowerCase()
                  //               .contains(query.toLowerCase());
                  //         },
                  //         onApplyButtonClick: (list) {
                  //           // setState(() {
                  //           //   selectedUserList = List.from(list!);
                  //           // });
                  //           Navigator.pop(context);
                  //         },
                  //       );

                  //       // await FilterListDialog.display<BankDto>(
                  //       //   context,
                  //       //   listData: value.banks!,
                  //       //   selectedListData: [],
                  //       //   choiceChipLabel: (user) => user!.title,
                  //       //   validateSelectedItem: (list, val) =>
                  //       //       list!.contains(val),
                  //       //   onItemSearch: (user, query) {
                  //       //     return user.title!
                  //       //         .toLowerCase()
                  //       //         .contains(query.toLowerCase());
                  //       //   },
                  //       //   onApplyButtonClick: (list) {
                  //       //     // setState(() {
                  //       //     //   selectedUserList = List.from(list!);
                  //       //     // });
                  //       //     Navigator.pop(context);
                  //       //   },
                  //       // );
                  //     },
                  //     child: Container(
                  //       width: 130,
                  //       height: 40,
                  //       decoration: const BoxDecoration(
                  //           image: DecorationImage(
                  //               image:
                  //                   AssetImage('lib/assets/images/addbank.png'),
                  //               fit: BoxFit.fill)),
                  //     ),
                  //   );
                  // }),
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
