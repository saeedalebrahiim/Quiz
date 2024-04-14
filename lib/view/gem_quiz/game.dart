import 'dart:async';

import 'package:bilgimizde/components/alarms_functions/wifi_alarm.dart';
import 'package:bilgimizde/controller/auth/auth_controller.dart';
import 'package:bilgimizde/controller/phase2/game.dart';
import 'package:bilgimizde/controller/profile/profile.dart';
import 'package:bilgimizde/provider/profile.dart';
import 'package:bilgimizde/provider/wordguess.dart';
import 'package:bilgimizde/services/internet_listener.dart';
import 'package:bilgimizde/view/buycoin/buy_coin_screen.dart';
import 'package:bilgimizde/view/buycoin/gem_buy.dart';
import 'package:bilgimizde/view/home/dashboard/home_screen.dart';
import 'package:bilgimizde/view/profile/profile_screen.dart';
import 'package:bilgimizde/view/rules/rules_screen.dart';
import 'package:bilgimizde/view/wallete/wallete.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:bilgimizde/global.dart';
import 'package:intl/intl.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:timer_count_down/timer_count_down.dart';

class WordGame extends StatefulWidget {
  const WordGame({super.key, required this.word, required this.price});
  final String word;
  final String price;

  @override
  State<WordGame> createState() => _WordGameState();
}

class _WordGameState extends State<WordGame> {
  final focusNode1 = FocusNode();
  final focusNode2 = FocusNode();
  final focusNode3 = FocusNode();
  final focusNode4 = FocusNode();
  int lockNumber = -1;
  List<FocusNode> foc1 = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode()
  ];
  List<FocusNode> foc2 = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode()
  ];
  List<FocusNode> foc3 = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode()
  ];
  List<FocusNode> foc4 = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode()
  ];
  List<TextEditingController> controller1 = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];

  List<TextEditingController> controller2 = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];

  List<TextEditingController> controller3 = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];

  List<TextEditingController> controller4 = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFirstWord();
  }

  getFirstWord() {
    print(widget.word);
    for (var i = 0; i < widget.word.length; i++) {
      if (widget.word.split('')[i] != "-") {
        controller1[i].text = widget.word.split('')[i];
        print(widget.word.split('')[i]);
        controller2[i].text = widget.word.split('')[i];
        controller3[i].text = widget.word.split('')[i];
        controller4[i].text = widget.word.split('')[i];
        lockNumber = i;
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 50,
      height: 50,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
          color: Color.fromARGB(100, 10, 21, 140),
          borderRadius: BorderRadius.circular(9),
          border: Border(bottom: BorderSide(width: 4, color: Colors.indigo))),
    );
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: primaryColor,
            image: const DecorationImage(
                image: AssetImage('lib/assets/images/gembg.png'),
                fit: BoxFit.fill)),
        child: SingleChildScrollView(
          child: Consumer<WordGameState>(builder: (context, value, child) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 20),
                        child: InkWell(
                          onTap: () {
                            // Navigator.pop(context);
                            Navigator.of(context).pushAndRemoveUntil(
                              PageRouteBuilder(
                                pageBuilder: (_, __, ___) => const HomeScreen(),
                                transitionDuration:
                                    const Duration(milliseconds: 500),
                                transitionsBuilder: (_, a, __, c) =>
                                    FadeTransition(
                                  opacity: a,
                                  child: c,
                                ),
                              ),
                              (route) => false,
                            );
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 10, 21, 94),
                                borderRadius: BorderRadius.circular(30)),
                            child: Icon(
                              Icons.home_filled,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 23),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                  pageBuilder: (_, __, ___) => const BuyGem(),
                                  transitionDuration:
                                      const Duration(milliseconds: 500),
                                  transitionsBuilder: (_, a, __, c) =>
                                      FadeTransition(
                                        opacity: a,
                                        child: c,
                                      )),
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                'lib/assets/images/gem.png',
                                width: 25,
                                height: 25,
                              ),
                              Consumer<ProfileState>(
                                builder: (context, value, child) {
                                  var formattedNumber = NumberFormat.compact()
                                      .format(value.profile != null
                                          ? value.profile!.userGemBalance
                                          : 0);
                                  return Text(
                                    formattedNumber,
                                    //  value.userBalance.toString(),
                                    style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 10, left: 0, bottom: 0, top: 15),
                        child: InkWell(
                          onTap: () {
                            AuthController.isAuth(context: context);
                            ConnectionStatusListener()
                                .checkConnection()
                                .then((value) {
                              if (!value) {
                                wifiAlarm(context);
                              }
                            });
                            ProfileController.getProfile(context: context);
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                  pageBuilder: (_, __, ___) =>
                                      const ProfileScreen(),
                                  transitionDuration:
                                      const Duration(milliseconds: 500),
                                  transitionsBuilder: (_, a, __, c) =>
                                      FadeTransition(
                                        opacity: a,
                                        child: c,
                                      )),
                            );
                          },
                          child: Consumer<ProfileState>(
                            builder: (context, value, child) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 6),
                              child: Container(
                                width: 50,
                                height: 50,
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 10, 21, 94),
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: CachedNetworkImage(
                                  width: 50,
                                  height: 50,
                                  imageUrl: value.profile != null &&
                                          value.profile!.userPicUrl != null
                                      ? value.profile!.userPicUrl!
                                      : "",
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    decoration: BoxDecoration(
                                      color:
                                          const Color.fromARGB(255, 10, 21, 94),
                                      borderRadius: BorderRadius.circular(18),
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  placeholder: (context, url) =>
                                      const CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      const Image(
                                    image: AssetImage(
                                        'lib/assets/images/profile.png'),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          //  Container(
                          //   decoration: BoxDecoration(
                          //       color: const Color.fromARGB(255, 10, 21, 94),
                          //       borderRadius: BorderRadius.circular(30)),
                          //   child: const Center(
                          //     child: Image(
                          //   image: AssetImage('lib/assets/images/profile.png'),
                          // )),
                          // ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 3.0,
                ),
                Container(
                  width: 340,
                  height: 113,
                  decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(27)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Countdown(
                        seconds: 15,
                        build: (BuildContext context, double time) => Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                "${time.toInt()} S",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 24),
                              ),
                            ),
                          ],
                        ),
                        interval: const Duration(milliseconds: 100),
                        onFinished: () {
                          print('Timer is done!');
                          context.read<WordGameState>().startGame();
                          context.read<WordGameState>().openFirst();
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                IgnorePointer(
                  ignoring: value.canFirstGuess == false &&
                      value.canSecondGuess == true,
                  child: Container(
                    width: 340,
                    foregroundDecoration: value.canFirstGuess == false &&
                            value.canSecondGuess == true
                        ? BoxDecoration(
                            color: Colors.grey.withOpacity(0.4),
                            image: DecorationImage(
                                image:
                                    AssetImage("lib/assets/images/lock.png")))
                        : null,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 18.0, bottom: 9),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              value.canFirstGuess == true
                                  ? Countdown(
                                      seconds: 15,
                                      build:
                                          (BuildContext context, double time) =>
                                              Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(
                                              "${time.toInt()} S",
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14),
                                            ),
                                          ),
                                        ],
                                      ),
                                      interval:
                                          const Duration(milliseconds: 100),
                                      onFinished: () {
                                        print('Timer is done!');
                                        context
                                            .read<WordGameState>()
                                            .openSecond();
                                      },
                                    )
                                  : const Text(
                                      "10s",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14),
                                    ),
                              const SizedBox(),
                              Row(
                                children: [
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'lib/assets/images/allprize.png'))),
                                  ),
                                  Text(
                                    '${widget.price} TL',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: List.generate(
                              6,
                              (index) => Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: index == lockNumber
                                              ? Colors.grey.withOpacity(0.7)
                                              : Color.fromARGB(
                                                  100, 10, 21, 140),
                                          borderRadius:
                                              BorderRadius.circular(9),
                                          border: Border(
                                              bottom: BorderSide(
                                                  width: 4,
                                                  color: Colors.indigo))),
                                      child: TextFormField(
                                        controller: controller1[index],
                                        maxLength: 1,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 22,
                                          color: Colors.white,
                                        ),
                                        focusNode: foc1[index],
                                        autofocus: false,
                                        showCursor: true,
                                        onChanged: (value) {
                                          if (controller1[index]
                                              .text
                                              .isNotEmpty) {
                                            foc1[index].nextFocus();
                                            if (index + 1 == lockNumber) {
                                              foc1[index].nextFocus();
                                            }
                                          } else {
                                            foc1[index].previousFocus();
                                          }
                                          if (index == 5) {
                                            String word = '';
                                            controller1.forEach(
                                              (element) => word += element.text,
                                            );
                                            print(word);
                                          }
                                        },
                                        readOnly: index == lockNumber,
                                        contextMenuBuilder:
                                            (context, editableTextState) =>
                                                SizedBox(),
                                        decoration: InputDecoration(
                                          counterText: "",
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  )),
                        ),

                        // Pinput(
                        //   length: 6,
                        //   controller: TextEditingController(),
                        //   focusNode: focusNode1,
                        //   keyboardType: TextInputType.text,
                        //   androidSmsAutofillMethod:
                        //       AndroidSmsAutofillMethod.none,
                        //   listenForMultipleSmsOnAndroid: false,
                        //   defaultPinTheme: defaultPinTheme,
                        //   separatorBuilder: (index) => const SizedBox(width: 5),
                        //   // onClipboardFound: (value) {
                        //   //   debugPrint('onClipboardFound: $value');
                        //   //   pinController.setText(value);
                        //   // },
                        //   hapticFeedbackType: HapticFeedbackType.lightImpact,
                        //   onCompleted: (pin) {
                        //     debugPrint('onCompleted: $pin');
                        //   },
                        //   onChanged: (value) {
                        //     debugPrint('onChanged: $value');
                        //   },
                        //   cursor: Column(
                        //     mainAxisAlignment: MainAxisAlignment.end,
                        //     children: [
                        //       Container(
                        //         margin: const EdgeInsets.only(bottom: 9),
                        //         width: 22,
                        //         height: 1,
                        //         color: Colors.white,
                        //       ),
                        //     ],
                        //   ),
                        //   focusedPinTheme: defaultPinTheme.copyWith(
                        //     decoration: defaultPinTheme.decoration!.copyWith(
                        //       borderRadius: BorderRadius.circular(19),
                        //       border: Border.all(color: Colors.white),
                        //     ),
                        //   ),
                        //   submittedPinTheme: defaultPinTheme.copyWith(
                        //     textStyle: const TextStyle(
                        //         color: Colors.white,
                        //         fontWeight: FontWeight.bold),
                        //     decoration: defaultPinTheme.decoration!.copyWith(
                        //       borderRadius: BorderRadius.circular(19),
                        //       border: Border.all(color: Colors.white),
                        //     ),
                        //   ),
                        //   errorPinTheme: defaultPinTheme.copyBorderWith(
                        //     border: Border.all(color: Colors.white),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                IgnorePointer(
                  ignoring: value.canSecondGuess == false &&
                      value.canThirdGuess == true,
                  child: Container(
                    width: 340,
                    foregroundDecoration: value.canSecondGuess == false &&
                            value.canThirdGuess == true
                        ? BoxDecoration(
                            color: Colors.grey.withOpacity(0.4),
                            image: DecorationImage(
                                image:
                                    AssetImage("lib/assets/images/lock.png")))
                        : null,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 18.0, bottom: 9),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              value.canSecondGuess == true
                                  ? Countdown(
                                      seconds: 15,
                                      build:
                                          (BuildContext context, double time) =>
                                              Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(
                                              "${time.toInt()} S",
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14),
                                            ),
                                          ),
                                        ],
                                      ),
                                      interval:
                                          const Duration(milliseconds: 100),
                                      onFinished: () {
                                        print('Timer is done!');
                                        context
                                            .read<WordGameState>()
                                            .openThird();
                                      },
                                    )
                                  : const Text(
                                      "10s",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14),
                                    ),
                              const SizedBox(),
                              Row(
                                children: [
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'lib/assets/images/allprize.png'))),
                                  ),
                                  Text(
                                    '${widget.price} TL',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: List.generate(
                              6,
                              (index) => Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: index == lockNumber
                                              ? Colors.grey.withOpacity(0.7)
                                              : Color.fromARGB(
                                                  100, 10, 21, 140),
                                          borderRadius:
                                              BorderRadius.circular(9),
                                          border: Border(
                                              bottom: BorderSide(
                                                  width: 4,
                                                  color: Colors.indigo))),
                                      child: TextFormField(
                                        controller: controller2[index],
                                        maxLength: 1,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 22,
                                          color: Colors.white,
                                        ),
                                        focusNode: foc2[index],
                                        autofocus: false,
                                        showCursor: true,
                                        onChanged: (value) {
                                          if (controller2[index]
                                              .text
                                              .isNotEmpty) {
                                            foc2[index].nextFocus();
                                            if (index + 1 == lockNumber) {
                                              foc2[index].nextFocus();
                                            }
                                          } else {
                                            foc2[index].previousFocus();
                                          }
                                          if (index == 5) {
                                            String word = '';
                                            controller2.forEach(
                                              (element) => word += element.text,
                                            );
                                            print(word);
                                          }
                                        },
                                        readOnly: index == lockNumber,
                                        contextMenuBuilder:
                                            (context, editableTextState) =>
                                                SizedBox(),
                                        decoration: InputDecoration(
                                          counterText: "",
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  )),
                        ),
                      ],
                    ),
                  ),
                ),
                // const SizedBox(
                //   height: 20,
                // ),
                // IgnorePointer(
                //   ignoring: value.canSecondGuess == false,
                //   child: Container(
                //     width: 340,
                //     foregroundDecoration: value.canSecondGuess == false
                //         ? BoxDecoration(
                //             color: Colors.grey.withOpacity(0.4),
                //             image: DecorationImage(
                //                 image:
                //                     AssetImage("lib/assets/images/lock.png")))
                //         : null,
                //     child: Column(
                //       children: [
                //         Padding(
                //           padding: const EdgeInsets.only(top: 18.0, bottom: 9),
                //           child: Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceAround,
                //             children: [
                //               value.canSecondGuess == true
                //                   ? Countdown(
                //                       seconds: 15,
                //                       build:
                //                           (BuildContext context, double time) =>
                //                               Row(
                //                         children: [
                //                           Padding(
                //                             padding: const EdgeInsets.all(4.0),
                //                             child: Text(
                //                               "${time.toInt()} S",
                //                               style: const TextStyle(
                //                                   color: Colors.white,
                //                                   fontSize: 14),
                //                             ),
                //                           ),
                //                         ],
                //                       ),
                //                       interval:
                //                           const Duration(milliseconds: 100),
                //                       onFinished: () {
                //                         print('Timer is done!');
                //                         context
                //                             .read<WordGameState>()
                //                             .openThird();
                //                       },
                //                     )
                //                   : const Text(
                //                       "10s",
                //                       style: TextStyle(
                //                           color: Colors.white, fontSize: 14),
                //                     ),
                //               const SizedBox(),
                //               Row(
                //                 children: [
                //                   Container(
                //                     width: 20,
                //                     height: 20,
                //                     decoration: const BoxDecoration(
                //                         image: DecorationImage(
                //                             image: AssetImage(
                //                                 'lib/assets/images/allprize.png'))),
                //                   ),
                //                   Text(
                //                     '${widget.price} TL',
                //                     style: TextStyle(
                //                         color: Colors.white, fontSize: 12),
                //                   ),
                //                 ],
                //               ),
                //             ],
                //           ),
                //         ),
                //         Pinput(
                //           length: 6,
                //           controller: controller2,
                //           focusNode: focusNode2,
                //           keyboardType: TextInputType.text,
                //           androidSmsAutofillMethod:
                //               AndroidSmsAutofillMethod.none,
                //           listenForMultipleSmsOnAndroid: false,
                //           defaultPinTheme: defaultPinTheme,
                //           separatorBuilder: (index) => const SizedBox(width: 5),
                //           // onClipboardFound: (value) {
                //           //   debugPrint('onClipboardFound: $value');
                //           //   pinController.setText(value);
                //           // },
                //           hapticFeedbackType: HapticFeedbackType.lightImpact,
                //           onCompleted: (pin) {
                //             debugPrint('onCompleted: $pin');
                //           },
                //           onChanged: (value) {
                //             debugPrint('onChanged: $value');
                //           },
                //           cursor: Column(
                //             mainAxisAlignment: MainAxisAlignment.end,
                //             children: [
                //               Container(
                //                 margin: const EdgeInsets.only(bottom: 9),
                //                 width: 22,
                //                 height: 1,
                //                 color: Colors.white,
                //               ),
                //             ],
                //           ),
                //           focusedPinTheme: defaultPinTheme.copyWith(
                //             decoration: defaultPinTheme.decoration!.copyWith(
                //               borderRadius: BorderRadius.circular(19),
                //               border: Border.all(color: Colors.white),
                //             ),
                //           ),
                //           submittedPinTheme: defaultPinTheme.copyWith(
                //             textStyle: const TextStyle(
                //                 color: Colors.white,
                //                 fontWeight: FontWeight.bold),
                //             decoration: defaultPinTheme.decoration!.copyWith(
                //               borderRadius: BorderRadius.circular(19),
                //               border: Border.all(color: Colors.white),
                //             ),
                //           ),
                //           errorPinTheme: defaultPinTheme.copyBorderWith(
                //             border: Border.all(color: Colors.white),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                // const SizedBox(
                //   height: 20,
                // ),
                // IgnorePointer(
                //   ignoring: value.canThirdGuess == false,
                //   child: Container(
                //     width: 340,
                //     foregroundDecoration: value.canThirdGuess == false
                //         ? BoxDecoration(
                //             color: Colors.grey.withOpacity(0.4),
                //             image: DecorationImage(
                //                 image:
                //                     AssetImage("lib/assets/images/lock.png")))
                //         : null,
                //     child: Column(
                //       children: [
                //         Padding(
                //           padding: const EdgeInsets.only(top: 18.0, bottom: 9),
                //           child: Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceAround,
                //             children: [
                //               value.canThirdGuess == true
                //                   ? Countdown(
                //                       seconds: 15,
                //                       build:
                //                           (BuildContext context, double time) =>
                //                               Row(
                //                         children: [
                //                           Padding(
                //                             padding: const EdgeInsets.all(4.0),
                //                             child: Text(
                //                               "${time.toInt()} S",
                //                               style: const TextStyle(
                //                                   color: Colors.white,
                //                                   fontSize: 14),
                //                             ),
                //                           ),
                //                         ],
                //                       ),
                //                       interval:
                //                           const Duration(milliseconds: 100),
                //                       onFinished: () {
                //                         print('Timer is done!');
                //                         context
                //                             .read<WordGameState>()
                //                             .openFourth();
                //                       },
                //                     )
                //                   : const Text(
                //                       "10s",
                //                       style: TextStyle(
                //                           color: Colors.white, fontSize: 14),
                //                     ),
                //               const SizedBox(),
                //               Row(
                //                 children: [
                //                   Container(
                //                     width: 20,
                //                     height: 20,
                //                     decoration: const BoxDecoration(
                //                         image: DecorationImage(
                //                             image: AssetImage(
                //                                 'lib/assets/images/allprize.png'))),
                //                   ),
                //                   Text(
                //                     '${widget.price} TL',
                //                     style: TextStyle(
                //                         color: Colors.white, fontSize: 12),
                //                   ),
                //                 ],
                //               ),
                //             ],
                //           ),
                //         ),
                //         Pinput(
                //           length: 6,
                //           controller: controller3,
                //           focusNode: focusNode3,
                //           keyboardType: TextInputType.text,
                //           androidSmsAutofillMethod:
                //               AndroidSmsAutofillMethod.none,
                //           listenForMultipleSmsOnAndroid: false,
                //           defaultPinTheme: defaultPinTheme,
                //           separatorBuilder: (index) => const SizedBox(width: 5),
                //           // onClipboardFound: (value) {
                //           //   debugPrint('onClipboardFound: $value');
                //           //   pinController.setText(value);
                //           // },
                //           hapticFeedbackType: HapticFeedbackType.lightImpact,
                //           onCompleted: (pin) {
                //             debugPrint('onCompleted: $pin');
                //           },
                //           onChanged: (value) {
                //             debugPrint('onChanged: $value');
                //           },
                //           cursor: Column(
                //             mainAxisAlignment: MainAxisAlignment.end,
                //             children: [
                //               Container(
                //                 margin: const EdgeInsets.only(bottom: 9),
                //                 width: 22,
                //                 height: 1,
                //                 color: Colors.white,
                //               ),
                //             ],
                //           ),
                //           focusedPinTheme: defaultPinTheme.copyWith(
                //             decoration: defaultPinTheme.decoration!.copyWith(
                //               borderRadius: BorderRadius.circular(19),
                //               border: Border.all(color: Colors.white),
                //             ),
                //           ),
                //           submittedPinTheme: defaultPinTheme.copyWith(
                //             textStyle: const TextStyle(
                //                 color: Colors.white,
                //                 fontWeight: FontWeight.bold),
                //             decoration: defaultPinTheme.decoration!.copyWith(
                //               borderRadius: BorderRadius.circular(19),
                //               border: Border.all(color: Colors.white),
                //             ),
                //           ),
                //           errorPinTheme: defaultPinTheme.copyBorderWith(
                //             border: Border.all(color: Colors.white),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                // const SizedBox(
                //   height: 20,
                // ),
                // IgnorePointer(
                //   ignoring: value.canFourthGuess == false,
                //   child: Container(
                //     width: 340,
                //     foregroundDecoration: value.canFourthGuess == false
                //         ? BoxDecoration(
                //             color: Colors.grey.withOpacity(0.4),
                //             image: DecorationImage(
                //                 image:
                //                     AssetImage("lib/assets/images/lock.png")))
                //         : null,
                //     child: Column(
                //       children: [
                //         Padding(
                //           padding: const EdgeInsets.only(top: 18.0, bottom: 9),
                //           child: Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceAround,
                //             children: [
                //               value.canFourthGuess == true
                //                   ? Countdown(
                //                       seconds: 15,
                //                       build:
                //                           (BuildContext context, double time) =>
                //                               Row(
                //                         children: [
                //                           Padding(
                //                             padding: const EdgeInsets.all(4.0),
                //                             child: Text(
                //                               "${time.toInt()} S",
                //                               style: const TextStyle(
                //                                   color: Colors.white,
                //                                   fontSize: 14),
                //                             ),
                //                           ),
                //                         ],
                //                       ),
                //                       interval:
                //                           const Duration(milliseconds: 100),
                //                       onFinished: () {
                //                         print('Timer is done!');
                //                       },
                //                     )
                //                   : const Text(
                //                       "10s",
                //                       style: TextStyle(
                //                           color: Colors.white, fontSize: 14),
                //                     ),
                //               const SizedBox(),
                //               Row(
                //                 children: [
                //                   Container(
                //                     width: 20,
                //                     height: 20,
                //                     decoration: const BoxDecoration(
                //                         image: DecorationImage(
                //                             image: AssetImage(
                //                                 'lib/assets/images/allprize.png'))),
                //                   ),
                //                   Text(
                //                     '${widget.price} TL',
                //                     style: TextStyle(
                //                         color: Colors.white, fontSize: 12),
                //                   ),
                //                 ],
                //               ),
                //             ],
                //           ),
                //         ),
                //         Pinput(
                //           length: 6,
                //           controller: controller4,
                //           focusNode: focusNode4,
                //           keyboardType: TextInputType.text,
                //           androidSmsAutofillMethod:
                //               AndroidSmsAutofillMethod.none,
                //           listenForMultipleSmsOnAndroid: false,
                //           defaultPinTheme: defaultPinTheme,
                //           separatorBuilder: (index) => const SizedBox(width: 5),
                //           // onClipboardFound: (value) {
                //           //   debugPrint('onClipboardFound: $value');
                //           //   pinController.setText(value);
                //           // },
                //           hapticFeedbackType: HapticFeedbackType.lightImpact,
                //           onCompleted: (pin) {
                //             debugPrint('onCompleted: $pin');
                //           },
                //           onChanged: (value) {
                //             debugPrint('onChanged: $value');
                //           },
                //           cursor: Column(
                //             mainAxisAlignment: MainAxisAlignment.end,
                //             children: [
                //               Container(
                //                 margin: const EdgeInsets.only(bottom: 9),
                //                 width: 22,
                //                 height: 1,
                //                 color: Colors.white,
                //               ),
                //             ],
                //           ),
                //           focusedPinTheme: defaultPinTheme.copyWith(
                //             decoration: defaultPinTheme.decoration!.copyWith(
                //               borderRadius: BorderRadius.circular(19),
                //               border: Border.all(color: Colors.white),
                //             ),
                //           ),
                //           submittedPinTheme: defaultPinTheme.copyWith(
                //             textStyle: const TextStyle(
                //                 color: Colors.white,
                //                 fontWeight: FontWeight.bold),
                //             decoration: defaultPinTheme.decoration!.copyWith(
                //               borderRadius: BorderRadius.circular(19),
                //               border: Border.all(color: Colors.white),
                //             ),
                //           ),
                //           errorPinTheme: defaultPinTheme.copyBorderWith(
                //             border: Border.all(color: Colors.white),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
