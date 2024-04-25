import 'dart:async';

import 'package:bilgimizde/components/alarms_functions/phase2/exit.dart';
import 'package:bilgimizde/components/alarms_functions/wifi_alarm.dart';
import 'package:bilgimizde/controller/auth/auth_controller.dart';
import 'package:bilgimizde/controller/phase2/game.dart';
import 'package:bilgimizde/controller/profile/profile.dart';
import 'package:bilgimizde/provider/profile.dart';
import 'package:bilgimizde/provider/wordguess.dart';
import 'package:bilgimizde/services/internet_listener.dart';
import 'package:bilgimizde/view/buycoin/buy_coin_screen.dart';
import 'package:bilgimizde/view/buycoin/gem_buy.dart';
import 'package:bilgimizde/view/gem_quiz/gem_quiz_screen.dart';
import 'package:bilgimizde/view/home/dashboard/home_screen.dart';
import 'package:bilgimizde/view/profile/profile_screen.dart';
import 'package:bilgimizde/view/rules/rules_screen.dart';
import 'package:bilgimizde/view/wallet/wallet.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:bilgimizde/global.dart';
import 'package:intl/intl.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:timer_count_down/timer_count_down.dart';

class WordGame extends StatefulWidget {
  const WordGame({super.key, required this.word, required this.lvlId});
  final String word;
  final int lvlId;

  @override
  State<WordGame> createState() => _WordGameState();
}

class _WordGameState extends State<WordGame> {
  final focusNode1 = FocusNode();
  final focusNode2 = FocusNode();
  final focusNode3 = FocusNode();
  final focusNode4 = FocusNode();
  int lockNumber = -1;
  String char = "";
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

  List<TextEditingController> controller5 = [
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
        char = widget.word.split('')[i];
        controller2[i].text = widget.word.split('')[i];
        controller3[i].text = widget.word.split('')[i];
        controller4[i].text = widget.word.split('')[i];
        lockNumber = i;
        setState(() {});
      }
    }
    context.read<WordGameState>().startGame();
    context.read<WordGameState>().openFirst();
  }

  bool tapedPlay = false;
  String price1 = "";
  String price2 = "";
  String price3 = "";
  String price4 = "";

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

    final lockTheme = BoxDecoration(
        color: Colors.grey.withOpacity(0.7),
        borderRadius: BorderRadius.circular(9),
        border: Border(bottom: BorderSide(width: 4, color: Colors.indigo)));
    final normalTheme = BoxDecoration(
        color: Color.fromARGB(100, 10, 21, 140),
        borderRadius: BorderRadius.circular(9),
        border: Border(bottom: BorderSide(width: 4, color: Colors.indigo)));

    final redTheme = BoxDecoration(
        color: Color.fromARGB(99, 140, 10, 10),
        borderRadius: BorderRadius.circular(9),
        border: Border(bottom: BorderSide(width: 4, color: Colors.red)));
    final successTheme = BoxDecoration(
        color: Color.fromARGB(99, 10, 140, 23),
        borderRadius: BorderRadius.circular(9),
        border: Border(bottom: BorderSide(width: 4, color: Colors.green)));
    switch (widget.lvlId) {
      case 1:
        {
          price1 = "50";
          price2 = "25";
          price3 = "15";
          price4 = "10";
        }
      case 2:
        {
          price1 = "150";
          price2 = "100";
          price3 = "50";
          price4 = "25";
        }
      case 3:
        {
          price1 = "350";
          price2 = "200";
          price3 = "100";
          price4 = "50";
        }
      case 4:
        {
          price1 = "850";
          price2 = "500";
          price3 = "300";
          price4 = "200";
        }
      case 5:
        {
          price1 = "1500";
          price2 = "750";
          price3 = "500";
          price4 = "250";
        }
      case 6:
        {
          price1 = "3000";
          price2 = "1500";
          price3 = "1000";
          price4 = "500";
        }

        break;
      default:
    }
    return Form(
      onWillPop: () async {
        exitAlarm2(context);
        return true;
      },
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: primaryColor,
              image: const DecorationImage(
                  image: AssetImage('lib/assets/images/bg2.png'),
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
                              exitAlarm2(context);
                              // Navigator.of(context).pushAndRemoveUntil(
                              //   PageRouteBuilder(
                              //     pageBuilder: (_, __, ___) => const HomeScreen(),
                              //     transitionDuration:
                              //         const Duration(milliseconds: 500),
                              //     transitionsBuilder: (_, a, __, c) =>
                              //         FadeTransition(
                              //       opacity: a,
                              //       child: c,
                              //     ),
                              //   ),
                              //   (route) => false,
                              // );
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
                                    color:
                                        const Color.fromARGB(255, 10, 21, 94),
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
                                        color: const Color.fromARGB(
                                            255, 10, 21, 94),
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
                    child: Center(
                      child: Text(
                        "Bir kelimenin bir harfini vereceğiz ve siz kelimeyi tahmin etmeye çalışacaksınız.",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),

                    //  Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     // Countdown(
                    //     //   seconds: 15,
                    //     //   build: (BuildContext context, double time) => Row(
                    //     //     children: [
                    //     //       Padding(
                    //     //         padding: const EdgeInsets.all(4.0),
                    //     //         child: Text(
                    //     //           "${time.toInt()} S",
                    //     //           style: const TextStyle(
                    //     //               color: Colors.white, fontSize: 24),
                    //     //         ),
                    //     //       ),
                    //     //     ],
                    //     //   ),
                    //     //   interval: const Duration(milliseconds: 100),
                    //     //   onFinished: () {
                    //     //     print('Timer is done!');
                    //     //     context.read<WordGameState>().startGame();
                    //     //     context.read<WordGameState>().openFirst();
                    //     //   },
                    //     // ),
                    //   ],
                    // ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  IgnorePointer(
                    ignoring: value.canFirstGuess == false ||
                        value.canSecondGuess == true,
                    child: Container(
                      width: 340,
                      foregroundDecoration: value.canFirstGuess == false
                          ? BoxDecoration(
                              color: Colors.grey.withOpacity(0.4),
                              image: DecorationImage(
                                  image:
                                      AssetImage("lib/assets/images/lock.png")))
                          : null,
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 18.0, bottom: 9),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                value.canFirstGuess == true &&
                                        value.endTheGame == false
                                    ? Countdown(
                                        seconds: 10,
                                        build: (BuildContext context,
                                                double time) =>
                                            Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
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

                                          if (value.canSecondGuess == false) {
                                            String word = '';
                                            controller2.forEach(
                                              (element) => word += element.text,
                                            );
                                            context
                                                .read<WordGameState>()
                                                .openSecond();
                                            WordController.guessWordGame(
                                                prevHelp: char,
                                                index: 1,
                                                word: word,
                                                context: context);
                                          }
                                        },
                                      )
                                    : value.canSecondGuess == false
                                        ? const Text(
                                            "0s",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14),
                                          )
                                        : const Text(
                                            "10s",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14),
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
                                      '${price1} TL',
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
                                        decoration: index == lockNumber
                                            ? lockTheme
                                            : (value.canSecondGuess == true &&
                                                    value.isRight1 == false)
                                                ? redTheme
                                                : (value.canSecondGuess ==
                                                            true &&
                                                        value.isRight1 == true)
                                                    ? successTheme
                                                    : normalTheme,
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
                                          onChanged: (v) {
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
                                            if (value.endTheGame == false) {
                                              if (index == 5 ||
                                                  (index == 4 &&
                                                      lockNumber == 5)) {
                                                String word = '';
                                                controller1.forEach(
                                                  (element) =>
                                                      word += element.text,
                                                );
                                                context
                                                    .read<WordGameState>()
                                                    .openSecond();
                                                WordController.guessWordGame(
                                                    prevHelp: char,
                                                    index: 1,
                                                    word: word,
                                                    context: context);

                                                print(word);
                                              }
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
                    ignoring: value.canSecondGuess == false ||
                        value.canThirdGuess == true,
                    child: Container(
                      width: 340,
                      foregroundDecoration: value.canSecondGuess == false
                          ? BoxDecoration(
                              color: Colors.grey.withOpacity(0.4),
                              image: DecorationImage(
                                  image:
                                      AssetImage("lib/assets/images/lock.png")))
                          : null,
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 18.0, bottom: 9),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                value.canSecondGuess == true &&
                                        value.endTheGame == false
                                    ? Countdown(
                                        seconds: 10,
                                        build: (BuildContext context,
                                                double time) =>
                                            Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
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
                                          if (value.canThirdGuess == false) {
                                            String word = '';
                                            controller2.forEach(
                                              (element) => word += element.text,
                                            );
                                            context
                                                .read<WordGameState>()
                                                .openThird();
                                            WordController.guessWordGame(
                                                prevHelp: char,
                                                index: 2,
                                                word: word,
                                                context: context);
                                          }
                                        },
                                      )
                                    : value.canThirdGuess == false
                                        ? const Text(
                                            "0s",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14),
                                          )
                                        : const Text(
                                            "10s",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14),
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
                                      '${price2} TL',
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
                                        decoration: index == lockNumber
                                            ? lockTheme
                                            : (value.canThirdGuess == true &&
                                                    value.isRight2 == false)
                                                ? redTheme
                                                : (value.canThirdGuess ==
                                                            true &&
                                                        value.isRight2 == true)
                                                    ? successTheme
                                                    : normalTheme,
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
                                          onChanged: (v) {
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
                                            if (value.endTheGame == false) {
                                              if (index == 5 ||
                                                  (index == 4 &&
                                                      lockNumber == 5)) {
                                                String word = '';
                                                controller2.forEach(
                                                  (element) =>
                                                      word += element.text,
                                                );
                                                context
                                                    .read<WordGameState>()
                                                    .openThird();
                                                WordController.guessWordGame(
                                                    prevHelp: char,
                                                    index: 2,
                                                    word: word,
                                                    context: context);

                                                print(word);
                                              }
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
                  const SizedBox(
                    height: 10,
                  ),
                  IgnorePointer(
                    ignoring: value.canThirdGuess == false ||
                        value.canFourthGuess == true,
                    child: Container(
                      width: 340,
                      foregroundDecoration: value.canThirdGuess == false
                          ? BoxDecoration(
                              color: Colors.grey.withOpacity(0.4),
                              image: DecorationImage(
                                  image:
                                      AssetImage("lib/assets/images/lock.png")))
                          : null,
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 18.0, bottom: 9),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                value.canThirdGuess == true &&
                                        value.endTheGame == false
                                    ? Countdown(
                                        seconds: 10,
                                        build: (BuildContext context,
                                                double time) =>
                                            Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
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
                                          if (value.canFourthGuess == false) {
                                            String word = '';
                                            controller3.forEach(
                                              (element) => word += element.text,
                                            );
                                            context
                                                .read<WordGameState>()
                                                .openFourth();
                                            WordController.guessWordGame(
                                                prevHelp: char,
                                                index: 3,
                                                word: word,
                                                context: context);
                                          }
                                        },
                                      )
                                    : value.canFourthGuess == false
                                        ? const Text(
                                            "0s",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14),
                                          )
                                        : const Text(
                                            "10s",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14),
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
                                      '${price3} TL',
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
                                        decoration: index == lockNumber
                                            ? lockTheme
                                            : (value.canFourthGuess == true &&
                                                    value.isRight3 == false)
                                                ? redTheme
                                                : (value.canFourthGuess ==
                                                            true &&
                                                        value.isRight3 == true)
                                                    ? successTheme
                                                    : normalTheme,
                                        child: TextFormField(
                                          controller: controller3[index],
                                          maxLength: 1,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontSize: 22,
                                            color: Colors.white,
                                          ),
                                          focusNode: foc3[index],
                                          autofocus: false,
                                          showCursor: true,
                                          onChanged: (v) {
                                            if (controller3[index]
                                                .text
                                                .isNotEmpty) {
                                              foc3[index].nextFocus();
                                              if (index + 1 == lockNumber) {
                                                foc3[index].nextFocus();
                                              }
                                            } else {
                                              foc3[index].previousFocus();
                                            }
                                            if (value.endTheGame == false) {
                                              if (index == 5 ||
                                                  (index == 4 &&
                                                      lockNumber == 5)) {
                                                String word = '';
                                                controller3.forEach(
                                                  (element) =>
                                                      word += element.text,
                                                );
                                                context
                                                    .read<WordGameState>()
                                                    .openFourth();
                                                WordController.guessWordGame(
                                                    prevHelp: char,
                                                    index: 3,
                                                    word: word,
                                                    context: context);

                                                print(word);
                                              }
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
                  const SizedBox(
                    height: 10,
                  ),
                  IgnorePointer(
                    ignoring: value.canFourthGuess == false ||
                        value.endTheGame == true,
                    child: Container(
                      width: 340,
                      foregroundDecoration: value.canFourthGuess == false
                          ? BoxDecoration(
                              color: Colors.grey.withOpacity(0.4),
                              image: DecorationImage(
                                  image:
                                      AssetImage("lib/assets/images/lock.png")))
                          : null,
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 18.0, bottom: 9),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                value.canFourthGuess == true &&
                                        value.endTheGame == false
                                    ? Countdown(
                                        seconds: 10,
                                        build: (BuildContext context,
                                                double time) =>
                                            Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
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
                                          if (value.endTheGame == false) {
                                            String word = '';
                                            controller4.forEach(
                                              (element) => word += element.text,
                                            );
                                            context
                                                .read<WordGameState>()
                                                .endGame();
                                            WordController.guessWordGame(
                                                prevHelp: char,
                                                index: 4,
                                                word: word,
                                                context: context);
                                          }
                                        },
                                      )
                                    : value.endTheGame == false
                                        ? const Text(
                                            "0s",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14),
                                          )
                                        : const Text(
                                            "10s",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14),
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
                                      '${price4} TL',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: List.generate(6, (index) {
                              if (index == value.indexLock3) {
                                print(value.helpChar);
                                controller4[value.indexLock3].text =
                                    value.helpChar;
                              }
                              return Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: index == lockNumber ||
                                          index == value.indexLock3
                                      ? lockTheme
                                      : (value.endTheGame == true &&
                                              value.isRight4 == false)
                                          ? redTheme
                                          : (value.endTheGame == true &&
                                                  value.isRight4 == true)
                                              ? successTheme
                                              : normalTheme,
                                  child: TextFormField(
                                    controller: controller4[index],
                                    maxLength: 1,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 22,
                                      color: Colors.white,
                                    ),
                                    focusNode: foc4[index],
                                    autofocus: false,
                                    showCursor: true,
                                    onChanged: (v) {
                                      if (controller4[index].text.isNotEmpty) {
                                        foc4[index].nextFocus();
                                        if (index + 1 == lockNumber ||
                                            index == value.indexLock3) {
                                          foc4[index].nextFocus();
                                        }
                                      } else {
                                        foc4[index].previousFocus();
                                      }
                                      if (value.endTheGame == false) {
                                        if (index == 5 ||
                                            (index == 4 &&
                                                (lockNumber == 5 ||
                                                    value.indexLock3 == 4))) {
                                          String word = '';
                                          controller4.forEach(
                                            (element) => word += element.text,
                                          );
                                          context
                                              .read<WordGameState>()
                                              .endGame();
                                          WordController.guessWordGame(
                                              prevHelp: char,
                                              index: 4,
                                              word: word,
                                              context: context);

                                          print(word);
                                        }
                                      }
                                    },
                                    readOnly: index == lockNumber ||
                                        index == value.indexLock3,
                                    contextMenuBuilder:
                                        (context, editableTextState) =>
                                            SizedBox(),
                                    decoration: InputDecoration(
                                      counterText: "",
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  IgnorePointer(
                    ignoring: true,
                    child: Container(
                      width: 340,
                      child: Column(
                        children: [
                          Row(
                            children: List.generate(
                                6,
                                (index) => Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Container(
                                        width: 50,
                                        height: 50,
                                        decoration: successTheme,
                                        child: TextFormField(
                                          controller: TextEditingController(
                                              text: value.word.isNotEmpty
                                                  ? value.word[index]
                                                  : ""),
                                          maxLength: 1,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontSize: 22,
                                            color: Colors.white,
                                          ),
                                          autofocus: false,
                                          showCursor: false,
                                          onChanged: (value) {},
                                          readOnly: true,
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
                  const SizedBox(
                    height: 30,
                  ),

                  value.endTheGame == true
                      ? Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  PageRouteBuilder(
                                      pageBuilder: (_, __, ___) =>
                                          const WalleteScreen(),
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
                                width: 300,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.15),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 4),
                                      child: Image.asset(
                                        'lib/assets/images/wallettext.png',
                                        width: 35,
                                        height: 16,
                                      ),
                                    ),
                                    const Text(
                                      'go to the wallet',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 246, 176, 71),
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushAndRemoveUntil(
                                      PageRouteBuilder(
                                        pageBuilder: (_, __, ___) =>
                                            const GemQuizScreen(),
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
                                    // StartQuizController.startQuiz(context: context);
                                    // if (!tapedPlay) {
                                    //   print("tapped $tapedPlay");
                                    //   tapedPlay = true;
                                    //   print("tapped $tapedPlay");

                                    //   if (value.userBalance >= 2) {
                                    //     context.read<QuizState>().resetCount();
                                    //     StartQuizController.startQuiz(
                                    //             context: context)
                                    //         .then((value) {
                                    //       ProfileController.getUserBalance(
                                    //           context: context);
                                    //       tapedPlay = false;
                                    //     });
                                    //   } else {
                                    //     noCoinAlert(context);
                                    //   }
                                    // }
                                  },
                                  child: Container(
                                    width: 150,
                                    height: 48,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                    child: const Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Gems',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 16),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    // StartQuizController.startQuiz(context: context);
                                    if (!tapedPlay) {
                                      print("tapped $tapedPlay");
                                      tapedPlay = true;
                                      print("tapped $tapedPlay");

                                      WordController.startWordGame(
                                          context: context,
                                          lvlId: widget.lvlId);

                                      tapedPlay = false;
                                    }
                                  },
                                  child: Container(
                                    width: 150,
                                    height: 48,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: const Color.fromARGB(
                                          255, 86, 196, 90),
                                    ),
                                    child: const Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.refresh,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          Text(
                                            'Again',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 16),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      : const SizedBox(),
                  const SizedBox(
                    height: 25,
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
      ),
    );
  }
}
