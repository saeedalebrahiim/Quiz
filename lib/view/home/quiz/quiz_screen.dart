import 'dart:async';
import 'dart:ui';

import 'package:bilgimizde/components/alarms_functions/exit_alarm.dart';
import 'package:bilgimizde/controller/profile/profile.dart';
import 'package:bilgimizde/services/admob.dart';
import 'package:bilgimizde/services/background.dart';
import 'package:bilgimizde/view/home/dashboard/drawer_screen.dart';
import 'package:easy_count_timer/easy_count_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:bilgimizde/controller/Quiz/start_quiz.dart';
import 'package:bilgimizde/global.dart';
import 'package:bilgimizde/provider/profile.dart';
import 'package:bilgimizde/provider/quiz.dart';
import 'package:bilgimizde/provider/stop_watch.dart';
import 'package:bilgimizde/view/home/dashboard/home_screen.dart';
import 'package:bilgimizde/view/home/quiz/answer_card.dart';
import 'package:timer_count_down/timer_count_down.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key, required this.index});
  final int index;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int selectedIndex = 0;
  bool isSelectedAny = false;

  late final AppLifecycleListener _listener;
  final List<String> _states = <String>[];
  late AppLifecycleState? _state;
  // Stream timeStream = Stream.periodic(const Duration(seconds: 1));
  // StreamSubscription? streamSubscription;
  // int secondsElapsed = 30;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _state = SchedulerBinding.instance.lifecycleState;
    _listener = AppLifecycleListener(
      onShow: () => print('show'),
      onResume: () {
        BackgroundServices.stop();
        BackgroundServices.cancel();
      },
      onHide: () {
        BackgroundServices.inactive(context);
      },
      onInactive: () {
        BackgroundServices.inactive(context);
      },
      onPause: () {
        BackgroundServices.inactive(context);
      },
      onDetach: () => print('detach'),
      onRestart: () => print('restart'),
      // This fires for each state change. Callbacks above fire only for
      // specific state transitions.
      onStateChange: _handleStateChange,
    );
    if (_state != null) {
      _states.add(_state!.name);
    }
    // getStop();
    // _createRewardedAd();
  }

  @override
  void dispose() {
    _listener.dispose();
    super.dispose();
  }

  void _handleStateChange(AppLifecycleState state) {
    setState(() {
      _state = state;
    });
  }
  // getStop() {
  //   streamSubscription = timeStream.listen((seconds) {
  //     secondsElapsed--;
  //     print("secondsElapsed $secondsElapsed");
  //     print(secondsElapsed <= 0);
  //     if (secondsElapsed <= 0) {
  //       print("seirosali $secondsElapsed");
  //       streamSubscription!.cancel();

  //       // QuizState quiz = Provider.of<QuizState>(context, listen: false);
  //       //TODO call add
  //       // StartQuizController.addAwnswer(
  //       //     userQuizId: quiz.quiz!.quizId,
  //       //     userDQuizId: quiz.quiz!.dQuizId,
  //       //     questionId: quiz.quiz!.quizQuestions[index].questionId,
  //       //     selectedAnswer: 0,
  //       //     questionNumber: index,
  //       //     context: context);
  //     }
  //   });
  // }

  // @override
  // void dispose() {
  //   // _createRewardedAd();
  //   streamSubscription!.cancel();
  //   super.dispose();
  // }

  RewardedAd? _rewardedAd;

  _createRewardedAd() {
    try {
      RewardedAd.load(
        adUnitId: AdMobService.rewardedAdUnitId2!,
        request: const AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (ad) => _rewardedAd = ad,
          onAdFailedToLoad: (error) => _rewardedAd = null,
        ),
      );
      // _showRewardedAd();
    } catch (e) {
      print("error $e");
    }
  }

  _showRewardedAd() {
    print(_rewardedAd);
    if (_rewardedAd != null) {
      _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          // _createRewardedAd();
          ProfileController.getUserBalance(context: context);
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          ad.dispose();
          // _createRewardedAd();
          ProfileController.getUserBalance(context: context);
        },
      );
      _rewardedAd!.show(
        onUserEarnedReward: (ad, reward) =>
            ProfileController.addToWatchScore(context: context),
      );

      _rewardedAd = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundShapes(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              // color: primaryColor,
              // image: const DecorationImage(
              //     image: AssetImage('lib/assets/images/bg2.png'),
              //     fit: BoxFit.fill),
              ),
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: 75,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 22.0),
                        child: InkWell(
                          onTap: () {
                            // Navigator.pop(context);
                            // Navigator.of(context).pushAndRemoveUntil(
                            //     MaterialPageRoute(
                            //       builder: (context) => const HomeScreen(),
                            //     ),
                            //     (route) => false);
                            exitAlarm(context);
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
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.timer,
                                color: Colors.white,
                                size: 24,
                              ),
                              // Text(
                              //   "${secondsElapsed.toString()} s",
                              //   style: const TextStyle(color: Colors.white),
                              // ),
                              Countdown(
                                seconds: 30,
                                build: (BuildContext context, double time) =>
                                    Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        "${time.toInt()} S",
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: SizedBox(
                                        width: 150,
                                        height: 10,
                                        child: LinearProgressIndicator(
                                          backgroundColor: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: time > 15
                                              ? Colors.green
                                              : time > 9
                                                  ? Colors.amber
                                                  : Colors.red,
                                          value: (time / 30),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                interval: Duration(milliseconds: 100),
                                onFinished: () {
                                  print('Timer is done!');
                                  setState(() {
                                    isSelectedAny = true;
                                  });
                                },
                              ),
                              // Padding(
                              //   padding:
                              //       const EdgeInsets.symmetric(horizontal: 10),
                              //   child: SizedBox(
                              //     width: 150,
                              //     height: 10,
                              //     child: LinearProgressIndicator(
                              //       backgroundColor: Colors.black,
                              //       color: Colors.green,
                              //       value: (secondsElapsed / 30),
                              //     ),
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0, right: 15),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'lib/assets/images/coin.png',
                              width: 25,
                              height: 25,
                            ),
                            Consumer<ProfileState>(
                              builder: (context, value, child) {
                                var _formattedNumber = NumberFormat.compact()
                                    .format(value.userBalance);
                                return Text(
                                  _formattedNumber,
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
                    ],
                  ),
                ),
              ),
              Consumer<QuizState>(
                builder: (context, value, child) => SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height - 75,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 2,
                        child: AnimationConfiguration.synchronized(
                          duration: const Duration(milliseconds: 2000),
                          child: SlideAnimation(
                            verticalOffset: 500.0,
                            child: FadeInAnimation(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4.0),
                                    child: Text(
                                      value.quiz!.quizQuestions[widget.index]
                                          .questionText,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        shadows: const [
                                          Shadow(
                                              color: Colors.white,
                                              blurRadius: 53)
                                        ],
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: value
                                                    .quiz!
                                                    .quizQuestions[widget.index]
                                                    .questionText
                                                    .length <
                                                48
                                            ? 32
                                            : 24,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 5,
                        child: AnimationConfiguration.synchronized(
                          duration: const Duration(milliseconds: 1000),
                          child: SlideAnimation(
                            verticalOffset: 200.0,
                            child: FadeInAnimation(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'lib/assets/images/quizbg.png'),
                                        fit: BoxFit.fill)),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${widget.index + 1} / ${value.quiz!.quizQuestions.length}",
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    const Text(
                                      'Doğru şıkkı seç:',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        value.eliminateAnswers.isNotEmpty &&
                                                value.eliminateAnswers
                                                    .contains(1)
                                            ? const SizedBox(
                                                width: 163,
                                                height: 77,
                                              )
                                            : IgnorePointer(
                                                ignoring: isSelectedAny,
                                                child: RawMaterialButton(
                                                  onPressed: () {
                                                    print("wt");
                                                    setState(() {
                                                      isSelectedAny = true;
                                                      selectedIndex = 1;
                                                    });
                                                    if (selectedIndex ==
                                                        value
                                                            .quiz!
                                                            .quizQuestions[
                                                                widget.index]
                                                            .currectAnswer) {
                                                      context
                                                          .read<QuizState>()
                                                          .plusCount();
                                                    } else {
                                                      context
                                                          .read<QuizState>()
                                                          .falsePlusCount();
                                                    }
                                                    // stopWatchProvider!.stop();
                                                    context
                                                        .read<
                                                            StopWatchProvider>()
                                                        .stop();
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            3.0),
                                                    child: AnswerCard(
                                                      helpPercentage: value
                                                                  .percentHint !=
                                                              null
                                                          ? value.percentHint!
                                                                  .selectedAnswer1Count /
                                                              (value.percentHint!
                                                                      .selectedAnswer1Count +
                                                                  value
                                                                      .percentHint!
                                                                      .selectedAnswer2Count +
                                                                  value
                                                                      .percentHint!
                                                                      .selectedAnswer3Count +
                                                                  value
                                                                      .percentHint!
                                                                      .selectedAnswer4Count)
                                                          : null,
                                                      question: value
                                                          .quiz!
                                                          .quizQuestions[
                                                              widget.index]
                                                          .answer1,
                                                      isSelected:
                                                          selectedIndex == 1,
                                                      correctAnswerIndex: value
                                                          .quiz!
                                                          .quizQuestions[
                                                              widget.index]
                                                          .currectAnswer,
                                                      currentIndex: 1,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                        value.eliminateAnswers.isNotEmpty &&
                                                value.eliminateAnswers
                                                    .contains(2)
                                            ? const SizedBox(
                                                width: 163,
                                                height: 77,
                                              )
                                            : Padding(
                                                padding:
                                                    const EdgeInsets.all(3.0),
                                                child: IgnorePointer(
                                                  ignoring: isSelectedAny,
                                                  child: RawMaterialButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        isSelectedAny = true;

                                                        selectedIndex = 2;
                                                      });

                                                      if (selectedIndex ==
                                                          value
                                                              .quiz!
                                                              .quizQuestions[
                                                                  widget.index]
                                                              .currectAnswer) {
                                                        context
                                                            .read<QuizState>()
                                                            .plusCount();
                                                      } else {
                                                        context
                                                            .read<QuizState>()
                                                            .falsePlusCount();
                                                      }
                                                      // stopWatchProvider!.stop();
                                                      context
                                                          .read<
                                                              StopWatchProvider>()
                                                          .stop();
                                                    },
                                                    child: AnswerCard(
                                                      helpPercentage: value
                                                                  .percentHint !=
                                                              null
                                                          ? value.percentHint!
                                                                  .selectedAnswer2Count /
                                                              (value.percentHint!
                                                                      .selectedAnswer1Count +
                                                                  value
                                                                      .percentHint!
                                                                      .selectedAnswer2Count +
                                                                  value
                                                                      .percentHint!
                                                                      .selectedAnswer3Count +
                                                                  value
                                                                      .percentHint!
                                                                      .selectedAnswer4Count)
                                                          : null,
                                                      question: value
                                                          .quiz!
                                                          .quizQuestions[
                                                              widget.index]
                                                          .answer2,
                                                      isSelected:
                                                          selectedIndex == 2,
                                                      correctAnswerIndex: value
                                                          .quiz!
                                                          .quizQuestions[
                                                              widget.index]
                                                          .currectAnswer,
                                                      currentIndex: 2,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        value.eliminateAnswers.isNotEmpty &&
                                                value.eliminateAnswers
                                                    .contains(3)
                                            ? const SizedBox(
                                                width: 163,
                                                height: 77,
                                              )
                                            : Padding(
                                                padding:
                                                    const EdgeInsets.all(3.0),
                                                child: IgnorePointer(
                                                  ignoring: isSelectedAny,
                                                  child: RawMaterialButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        isSelectedAny = true;

                                                        selectedIndex = 3;
                                                      });

                                                      if (selectedIndex ==
                                                          value
                                                              .quiz!
                                                              .quizQuestions[
                                                                  widget.index]
                                                              .currectAnswer) {
                                                        context
                                                            .read<QuizState>()
                                                            .plusCount();
                                                      } else {
                                                        context
                                                            .read<QuizState>()
                                                            .falsePlusCount();
                                                      }
                                                      // stopWatchProvider!.stop();
                                                      context
                                                          .read<
                                                              StopWatchProvider>()
                                                          .stop();
                                                    },
                                                    child: AnswerCard(
                                                      helpPercentage: value
                                                                  .percentHint !=
                                                              null
                                                          ? value.percentHint!
                                                                  .selectedAnswer3Count /
                                                              (value.percentHint!
                                                                      .selectedAnswer1Count +
                                                                  value
                                                                      .percentHint!
                                                                      .selectedAnswer2Count +
                                                                  value
                                                                      .percentHint!
                                                                      .selectedAnswer3Count +
                                                                  value
                                                                      .percentHint!
                                                                      .selectedAnswer4Count)
                                                          : null,
                                                      question: value
                                                          .quiz!
                                                          .quizQuestions[
                                                              widget.index]
                                                          .answer3,
                                                      isSelected:
                                                          selectedIndex == 3,
                                                      correctAnswerIndex: value
                                                          .quiz!
                                                          .quizQuestions[
                                                              widget.index]
                                                          .currectAnswer,
                                                      currentIndex: 3,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                        value.eliminateAnswers.isNotEmpty &&
                                                value.eliminateAnswers
                                                    .contains(4)
                                            ? const SizedBox(
                                                width: 163,
                                                height: 77,
                                              )
                                            : Padding(
                                                padding:
                                                    const EdgeInsets.all(3.0),
                                                child: IgnorePointer(
                                                  ignoring: isSelectedAny,
                                                  child: RawMaterialButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        isSelectedAny = true;

                                                        selectedIndex = 4;
                                                      });

                                                      if (selectedIndex ==
                                                          value
                                                              .quiz!
                                                              .quizQuestions[
                                                                  widget.index]
                                                              .currectAnswer) {
                                                        context
                                                            .read<QuizState>()
                                                            .plusCount();
                                                      } else {
                                                        context
                                                            .read<QuizState>()
                                                            .falsePlusCount();
                                                      }
                                                      // stopWatchProvider!.stop();
                                                      context
                                                          .read<
                                                              StopWatchProvider>()
                                                          .stop();
                                                    },
                                                    child: AnswerCard(
                                                      helpPercentage: value
                                                                  .percentHint !=
                                                              null
                                                          ? value.percentHint!
                                                                  .selectedAnswer4Count /
                                                              (value.percentHint!
                                                                      .selectedAnswer1Count +
                                                                  value
                                                                      .percentHint!
                                                                      .selectedAnswer2Count +
                                                                  value
                                                                      .percentHint!
                                                                      .selectedAnswer3Count +
                                                                  value
                                                                      .percentHint!
                                                                      .selectedAnswer4Count)
                                                          : null,
                                                      question: value
                                                          .quiz!
                                                          .quizQuestions[
                                                              widget.index]
                                                          .answer4,
                                                      isSelected:
                                                          selectedIndex == 4,
                                                      correctAnswerIndex: value
                                                          .quiz!
                                                          .quizQuestions[
                                                              widget.index]
                                                          .currectAnswer,
                                                      currentIndex: 4,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                      ],
                                    ),
                                    isSelectedAny
                                        ? Padding(
                                            padding: const EdgeInsets.all(0),
                                            child: SizedBox(
                                              width: 346,
                                              height: 65,
                                              child: RawMaterialButton(
                                                onPressed: () {
                                                  //TODO everting should be on report
                                                  bool isLast =
                                                      (widget.index + 1) <
                                                          value
                                                              .quiz!
                                                              .quizQuestions
                                                              .length;
                                                  StartQuizController
                                                      .addAwnswer(
                                                          userQuizId: value
                                                              .quiz!.quizId,
                                                          userDQuizId: value
                                                              .quiz!.dQuizId,
                                                          isLast: !isLast,
                                                          questionId: value
                                                              .quiz!
                                                              .quizQuestions[
                                                                  widget.index]
                                                              .questionId,
                                                          selectedAnswer:
                                                              selectedIndex,
                                                          questionNumber:
                                                              widget.index,
                                                          context: context);

                                                  context
                                                      .read<QuizState>()
                                                      .removePercentHint();
                                                  context
                                                      .read<QuizState>()
                                                      .removeEliminateAnswers();
                                                  if (isLast) {
                                                    Navigator.of(context)
                                                        .pushReplacement(
                                                      PageRouteBuilder(
                                                          pageBuilder: (_, __,
                                                                  ___) =>
                                                              QuizScreen(
                                                                  index: (widget
                                                                          .index +
                                                                      1)),
                                                          transitionDuration:
                                                              const Duration(
                                                                  milliseconds:
                                                                      500),
                                                          transitionsBuilder:
                                                              (_, a, __, c) =>
                                                                  FadeTransition(
                                                                    opacity: a,
                                                                    child: c,
                                                                  )),
                                                    );
                                                  } else {}
                                                },
                                                fillColor: const Color.fromARGB(
                                                    255, 8, 194, 104),
                                                shape: RoundedRectangleBorder(
                                                  side: BorderSide(
                                                      color:
                                                          Colors.green.shade200,
                                                      width: 3),
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                child: const Text(
                                                  "Sıradaki",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20),
                                                ),
                                              ),
                                            ),
                                          )
                                        : const SizedBox(
                                            height: 65,
                                          ),
                                    Padding(
                                      padding: const EdgeInsets.all(0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IgnorePointer(
                                            ignoring: isSelectedAny ||
                                                value.usedEliminate,
                                            child: InkWell(
                                              onTap: () {
                                                StartQuizController
                                                    .hinteliminate(
                                                        questionId: value
                                                            .quiz!
                                                            .quizQuestions[
                                                                widget.index]
                                                            .questionId,
                                                        context: context);
                                              },
                                              child: Container(
                                                width: 100,
                                                height: 70,
                                                foregroundDecoration:
                                                    isSelectedAny ||
                                                            value.usedEliminate
                                                        ? BoxDecoration(
                                                            color:
                                                                Colors.black26,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          )
                                                        : null,
                                                decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          'lib/assets/images/1.png'),
                                                      fit: BoxFit.fill),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          IgnorePointer(
                                            ignoring: isSelectedAny ||
                                                value.usedPercentage,
                                            child: InkWell(
                                              onTap: () {
                                                StartQuizController.hintPercent(
                                                    questionId: value
                                                        .quiz!
                                                        .quizQuestions[
                                                            widget.index]
                                                        .questionId,
                                                    context: context);
                                              },
                                              child: Container(
                                                width: 127,
                                                height: 70,
                                                foregroundDecoration:
                                                    isSelectedAny ||
                                                            value.usedPercentage
                                                        ? BoxDecoration(
                                                            color:
                                                                Colors.black26,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                          )
                                                        : null,
                                                decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        'lib/assets/images/2.png'),
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          isSelectedAny
                                              ? InkWell(
                                                  onTap: () {
                                                    //see ads
                                                    // _createRewardedAd();
                                                    _showRewardedAd();
                                                  },
                                                  child: Container(
                                                    width: 100,
                                                    height: 70,
                                                    foregroundDecoration:
                                                        _rewardedAd == null
                                                            ? BoxDecoration(
                                                                color: Colors
                                                                    .black26,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                              )
                                                            : null,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        // border: Border(
                                                        //   bottom: BorderSide(
                                                        //       width: 3,
                                                        //       color: Colors.orange),
                                                        // ),
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                'lib/assets/images/4.png'),
                                                            fit: BoxFit.fill)),
                                                    // child: Column(
                                                    //   children: [
                                                    //     Padding(
                                                    //       padding:
                                                    //           const EdgeInsets.all(1.0),
                                                    //       child: Image.asset(
                                                    //         'lib/assets/images/mainstar.png',
                                                    //         width: 25,
                                                    //       ),
                                                    //     ),
                                                    //     const Text(
                                                    //       "TL topla",
                                                    //       style:
                                                    //           TextStyle(fontSize: 10),
                                                    //     )
                                                    //   ],
                                                    // ),
                                                  ),
                                                )
                                              : InkWell(
                                                  onTap: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) =>
                                                          AlertDialog(
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        content: Container(
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20)),
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width -
                                                              50,
                                                          height: 150,
                                                          child: Column(
                                                            children: [
                                                              const SizedBox(
                                                                height: 15,
                                                              ),
                                                              const Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            10.0),
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Are you sure about the crash ',
                                                                      style: TextStyle(
                                                                          fontWeight:
                                                                              FontWeight.w600),
                                                                    ),
                                                                    Text(
                                                                      'report question?',
                                                                      style: TextStyle(
                                                                          fontWeight:
                                                                              FontWeight.w600),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height: 10,
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  InkWell(
                                                                    onTap: () {
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop();
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          100,
                                                                      height:
                                                                          40,
                                                                      decoration: const BoxDecoration(
                                                                          image: DecorationImage(
                                                                              image: AssetImage('lib/assets/images/nobtn.png'),
                                                                              fit: BoxFit.fill)),
                                                                      child:
                                                                          const Center(
                                                                        child:
                                                                            Text(
                                                                          'No',
                                                                          style: TextStyle(
                                                                              color: Colors.white,
                                                                              fontWeight: FontWeight.bold),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  InkWell(
                                                                    onTap: () {
                                                                      StartQuizController.reportQuestion(
                                                                          questionId: value
                                                                              .quiz!
                                                                              .quizQuestions[widget
                                                                                  .index]
                                                                              .questionId,
                                                                          context:
                                                                              context);
                                                                      bool isLast = (widget.index +
                                                                              1) <
                                                                          value
                                                                              .quiz!
                                                                              .quizQuestions
                                                                              .length;
                                                                      StartQuizController.addAwnswer(
                                                                          userQuizId: value
                                                                              .quiz!
                                                                              .quizId,
                                                                          userDQuizId: value
                                                                              .quiz!
                                                                              .dQuizId,
                                                                          isLast:
                                                                              !isLast,
                                                                          questionId: value
                                                                              .quiz!
                                                                              .quizQuestions[widget
                                                                                  .index]
                                                                              .questionId,
                                                                          selectedAnswer:
                                                                              selectedIndex,
                                                                          questionNumber: widget
                                                                              .index,
                                                                          context:
                                                                              context);
                                                                      context
                                                                          .read<
                                                                              QuizState>()
                                                                          .removePercentHint();
                                                                      context
                                                                          .read<
                                                                              QuizState>()
                                                                          .removeEliminateAnswers();
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          100,
                                                                      height:
                                                                          40,
                                                                      decoration: const BoxDecoration(
                                                                          image: DecorationImage(
                                                                              image: AssetImage('lib/assets/images/yesbtn.png'),
                                                                              fit: BoxFit.fill)),
                                                                      child:
                                                                          const Center(
                                                                        child:
                                                                            Text(
                                                                          'Yes',
                                                                          style: TextStyle(
                                                                              color: Colors.white,
                                                                              fontWeight: FontWeight.bold),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  )
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: Container(
                                                    width: 100,
                                                    height: 70,
                                                    decoration: const BoxDecoration(
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                'lib/assets/images/3.png'),
                                                            fit: BoxFit.fill)),
                                                  ),
                                                ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
