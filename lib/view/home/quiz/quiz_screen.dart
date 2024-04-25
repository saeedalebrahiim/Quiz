import 'dart:async';

import 'package:bilgimizde/components/alarms_functions/exit_alarm.dart';
import 'package:bilgimizde/controller/profile/profile.dart';
import 'package:bilgimizde/provider/ad.dart';
import 'package:bilgimizde/services/admob.dart';
import 'package:bilgimizde/services/background.dart';
import 'package:bilgimizde/view/home/dashboard/drawer_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:bilgimizde/controller/Quiz/start_quiz.dart';
import 'package:bilgimizde/provider/profile.dart';
import 'package:bilgimizde/provider/quiz.dart';
import 'package:bilgimizde/provider/stop_watch.dart';
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

  bool nextTaped = false;

  late final AppLifecycleListener _listener;
  final List<String> _states = <String>[];
  late AppLifecycleState? _state;
  bool? res;
  bool eliminatedOnce = false;
  // Stream timeStream = Stream.periodic(const Duration(seconds: 1));
  // StreamSubscription? streamSubscription;
  // int secondsElapsed = 30;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _createAd();

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

  // RewardedAd? _rewardedAd;

  // _createRewardedAd() {
  //   try {
  //     RewardedAd.load(
  //       adUnitId: AdMobService.rewardedAdUnitId2!,
  //       request: const AdRequest(),
  //       rewardedAdLoadCallback: RewardedAdLoadCallback(
  //         onAdLoaded: (ad) {
  //           _rewardedAd = ad;
  //           print("loaaaaaded");
  //         },
  //         onAdFailedToLoad: (error) => _rewardedAd = null,
  //       ),
  //     );
  //     // _showRewardedAd();
  //   } catch (e) {
  //     print("error $e");
  //   }
  // }

  _createAd() {
    if (AdState.rewardedAd == null) {
      context.read<AdState>().createRewardedAd();
    }
  }

  _showRewardedAd() {
    // print(_rewardedAd);
    // RewardedAd.load(
    //   adUnitId: AdMobService.rewardedAdUnitId2!,
    //   request: const AdRequest(),
    //   rewardedAdLoadCallback: RewardedAdLoadCallback(
    //     onAdLoaded: (ad) => _rewardedAd = ad,
    //     onAdFailedToLoad: (error) => _rewardedAd = null,
    //   ),
    // );
    if (AdState.rewardedAd != null) {
      AdState.rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
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
      AdState.rewardedAd!.show(
        onUserEarnedReward: (ad, reward) =>
            ProfileController.addToWatchScore(context: context),
      );

      // _rewardedAd = null;
      context.read<AdState>().makeItNull();
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundShapes(
      child: Form(
        onWillPop: () async {
          exitAlarm(context);

          return true;
        },
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
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
                        const Padding(
                          padding: EdgeInsets.only(top: 20, left: 18, right: 8),
                          child: SizedBox(
                            width: 23,
                            child: Icon(
                              Icons.timer,
                              color: Colors.white,
                              size: 24,
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
                                // Text(
                                //   "${secondsElapsed.toString()} s",
                                //   style: const TextStyle(color: Colors.white),
                                // ),
                                Countdown(
                                  seconds: 20,
                                  build: (BuildContext context, double time) {
                                    if (time == 7) {
                                      StartQuizController.hintPercent(
                                          reduceCoin: true,
                                          questionId: context
                                              .watch<QuizState>()
                                              .quiz!
                                              .quizQuestions[widget.index]
                                              .questionId
                                          //  value
                                          //     .quiz!
                                          //     .quizQuestions[widget.index]
                                          //     .questionId
                                          ,
                                          context: context);
                                    }
                                    return Row(
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
                                            width: 140,
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
                                              value: (time / 20),
                                            ),
                                          ),
                                        )
                                      ],
                                    );
                                  },
                                  interval: const Duration(milliseconds: 100),
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
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(8, 19, 57, 0.55),
                              borderRadius: BorderRadius.circular(18),
                            ),
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
                                    var formattedNumber = NumberFormat.compact()
                                        .format(value.userBalance);
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
                            duration: const Duration(milliseconds: 700),
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
                                                      .quizQuestions[
                                                          widget.index]
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
                            duration: const Duration(milliseconds: 500),
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
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "${widget.index + 1} ",
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "/ ${value.quiz!.quizQuestions.length}",
                                            style: const TextStyle(
                                              color: Color.fromARGB(
                                                  145, 255, 255, 255),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 25,
                                      ),
                                      const Text(
                                        'Doğru şıkkı seç:',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Column(
                                        children: [
                                          SizedBox(
                                            width: 366,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                value.eliminateAnswers
                                                            .isNotEmpty &&
                                                        value.eliminateAnswers
                                                            .contains(1)
                                                    ? const SizedBox(
                                                        width: 172,
                                                        height: 79,
                                                      )
                                                    : IgnorePointer(
                                                        ignoring: isSelectedAny,
                                                        child: InkWell(
                                                          onTap: () {
                                                            print("wt");
                                                            setState(() {
                                                              isSelectedAny =
                                                                  true;
                                                              selectedIndex = 1;
                                                            });
                                                            if (selectedIndex ==
                                                                value
                                                                    .quiz!
                                                                    .quizQuestions[
                                                                        widget
                                                                            .index]
                                                                    .currectAnswer) {
                                                              context
                                                                  .read<
                                                                      QuizState>()
                                                                  .plusCount();
                                                            } else {
                                                              context
                                                                  .read<
                                                                      QuizState>()
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
                                                                const EdgeInsets
                                                                    .symmetric(
                                                              horizontal: 3.0,
                                                              vertical: 4,
                                                            ),
                                                            child: AnswerCard(
                                                              helpPercentage: value
                                                                          .percentHint !=
                                                                      null
                                                                  ? value.percentHint!
                                                                          .selectedAnswer1Count /
                                                                      (value.percentHint!.selectedAnswer1Count +
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
                                                                      widget
                                                                          .index]
                                                                  .answer1,
                                                              isSelected:
                                                                  selectedIndex ==
                                                                      1,
                                                              correctAnswerIndex: value
                                                                  .quiz!
                                                                  .quizQuestions[
                                                                      widget
                                                                          .index]
                                                                  .currectAnswer,
                                                              currentIndex: 1,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                value.eliminateAnswers
                                                            .isNotEmpty &&
                                                        value.eliminateAnswers
                                                            .contains(2)
                                                    ? const SizedBox(
                                                        width: 172,
                                                        height: 79,
                                                      )
                                                    : Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          horizontal: 3.0,
                                                          vertical: 4,
                                                        ),
                                                        child: IgnorePointer(
                                                          ignoring:
                                                              isSelectedAny,
                                                          child: InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                isSelectedAny =
                                                                    true;

                                                                selectedIndex =
                                                                    2;
                                                              });

                                                              if (selectedIndex ==
                                                                  value
                                                                      .quiz!
                                                                      .quizQuestions[
                                                                          widget
                                                                              .index]
                                                                      .currectAnswer) {
                                                                context
                                                                    .read<
                                                                        QuizState>()
                                                                    .plusCount();
                                                              } else {
                                                                context
                                                                    .read<
                                                                        QuizState>()
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
                                                                      (value.percentHint!.selectedAnswer1Count +
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
                                                                      widget
                                                                          .index]
                                                                  .answer2,
                                                              isSelected:
                                                                  selectedIndex ==
                                                                      2,
                                                              correctAnswerIndex: value
                                                                  .quiz!
                                                                  .quizQuestions[
                                                                      widget
                                                                          .index]
                                                                  .currectAnswer,
                                                              currentIndex: 2,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 366,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                value.eliminateAnswers
                                                            .isNotEmpty &&
                                                        value.eliminateAnswers
                                                            .contains(3)
                                                    ? const SizedBox(
                                                        width: 172,
                                                        height: 79,
                                                      )
                                                    : Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          horizontal: 3.0,
                                                          vertical: 4,
                                                        ),
                                                        child: IgnorePointer(
                                                          ignoring:
                                                              isSelectedAny,
                                                          child: InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                isSelectedAny =
                                                                    true;

                                                                selectedIndex =
                                                                    3;
                                                              });

                                                              if (selectedIndex ==
                                                                  value
                                                                      .quiz!
                                                                      .quizQuestions[
                                                                          widget
                                                                              .index]
                                                                      .currectAnswer) {
                                                                context
                                                                    .read<
                                                                        QuizState>()
                                                                    .plusCount();
                                                              } else {
                                                                context
                                                                    .read<
                                                                        QuizState>()
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
                                                                      (value.percentHint!.selectedAnswer1Count +
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
                                                                      widget
                                                                          .index]
                                                                  .answer3,
                                                              isSelected:
                                                                  selectedIndex ==
                                                                      3,
                                                              correctAnswerIndex: value
                                                                  .quiz!
                                                                  .quizQuestions[
                                                                      widget
                                                                          .index]
                                                                  .currectAnswer,
                                                              currentIndex: 3,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                value.eliminateAnswers
                                                            .isNotEmpty &&
                                                        value.eliminateAnswers
                                                            .contains(4)
                                                    ? const SizedBox(
                                                        width: 172,
                                                        height: 79,
                                                      )
                                                    : Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          horizontal: 3.0,
                                                          vertical: 4,
                                                        ),
                                                        child: IgnorePointer(
                                                          ignoring:
                                                              isSelectedAny,
                                                          child: InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                isSelectedAny =
                                                                    true;

                                                                selectedIndex =
                                                                    4;
                                                              });

                                                              if (selectedIndex ==
                                                                  value
                                                                      .quiz!
                                                                      .quizQuestions[
                                                                          widget
                                                                              .index]
                                                                      .currectAnswer) {
                                                                context
                                                                    .read<
                                                                        QuizState>()
                                                                    .plusCount();
                                                              } else {
                                                                context
                                                                    .read<
                                                                        QuizState>()
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
                                                                      (value.percentHint!.selectedAnswer1Count +
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
                                                                      widget
                                                                          .index]
                                                                  .answer4,
                                                              isSelected:
                                                                  selectedIndex ==
                                                                      4,
                                                              correctAnswerIndex: value
                                                                  .quiz!
                                                                  .quizQuestions[
                                                                      widget
                                                                          .index]
                                                                  .currectAnswer,
                                                              currentIndex: 4,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                              ],
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
                                                child: InkWell(
                                                  onTap: () {
                                                    //TODO everting should be on report
                                                    if (!nextTaped) {
                                                      nextTaped = true;
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
                                                              userDQuizId:
                                                                  value.quiz!
                                                                      .dQuizId,
                                                              isLast: !isLast,
                                                              questionId: value
                                                                  .quiz!
                                                                  .quizQuestions[
                                                                      widget
                                                                          .index]
                                                                  .questionId,
                                                              selectedAnswer:
                                                                  selectedIndex,
                                                              questionNumber:
                                                                  widget.index,
                                                              context: context);
                                                      if (selectedIndex == 0) {
                                                        context
                                                            .read<QuizState>()
                                                            .falsePlusCount();
                                                      }
                                                      // context
                                                      //     .read<QuizState>()
                                                      //     .removeEliminateAnswers();
                                                      context
                                                          .read<QuizState>()
                                                          .removePercentHint();
                                                      Future.delayed(
                                                          const Duration(
                                                              milliseconds: 50),
                                                          () {
                                                        // context
                                                        //     .read<QuizState>()
                                                        //     .removePercentHint();
                                                        print("why");
                                                        context
                                                            .read<QuizState>()
                                                            .removeEliminateAnswers();
                                                      });

                                                      if (isLast) {
                                                        Future.delayed(
                                                            const Duration(
                                                                milliseconds:
                                                                    150), () {
                                                          Navigator.of(context)
                                                              .pushReplacement(
                                                            PageRouteBuilder(
                                                                pageBuilder: (_,
                                                                        __,
                                                                        ___) =>
                                                                    QuizScreen(
                                                                        index: (widget.index +
                                                                            1)),
                                                                transitionDuration:
                                                                    const Duration(
                                                                        milliseconds:
                                                                            200),
                                                                transitionsBuilder: (_,
                                                                        a,
                                                                        __,
                                                                        c) =>
                                                                    FadeTransition(
                                                                      opacity:
                                                                          a,
                                                                      child: c,
                                                                    )),
                                                          );
                                                        });
                                                      } else {
                                                        showDialog(
                                                          context: context,
                                                          builder: (context) =>
                                                              const AlertDialog(
                                                            content: SizedBox(
                                                              height: 500,
                                                              child: Center(
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    CircularProgressIndicator(),
                                                                    Text(
                                                                        "Waiting for results"),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                    }
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color:
                                                          const Color.fromARGB(
                                                              255, 8, 194, 104),
                                                      border: Border.all(
                                                          color: Colors
                                                              .green.shade200,
                                                          width: 3),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                    ),
                                                    child: const Center(
                                                      child: Text(
                                                        "Sıradaki",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          : const SizedBox(
                                              height: 65,
                                            ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 6),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            IgnorePointer(
                                              ignoring: isSelectedAny ||
                                                  value.usedEliminate,
                                              child: InkWell(
                                                onDoubleTap: () {},
                                                onTap: () {
                                                  if (!eliminatedOnce) {
                                                    eliminatedOnce = true;
                                                    StartQuizController
                                                        .hinteliminate(
                                                            questionId: value
                                                                .quiz!
                                                                .quizQuestions[
                                                                    widget
                                                                        .index]
                                                                .questionId,
                                                            context: context);
                                                  }
                                                },
                                                child: Container(
                                                  width: 110,
                                                  height: 74,
                                                  foregroundDecoration:
                                                      isSelectedAny ||
                                                              value
                                                                  .usedEliminate
                                                          ? BoxDecoration(
                                                              color: Colors
                                                                  .black26,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16),
                                                            )
                                                          : null,
                                                  // decoration: const BoxDecoration(
                                                  //   image: DecorationImage(
                                                  //       image: AssetImage(
                                                  //           'lib/assets/images/1.png'),
                                                  //       fit: BoxFit.fill),
                                                  // ),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                    border: const Border(
                                                      bottom: BorderSide(
                                                          width: 4,
                                                          color: Colors.orange),
                                                    ),
                                                    // image: DecorationImage(
                                                    //     image: AssetImage(
                                                    //         'lib/assets/images/4.png'),
                                                    //     fit: BoxFit.fill)
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(1.0),
                                                            child: SizedBox(
                                                              height: 40,
                                                              width: 50,
                                                              child: Stack(
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .topRight,
                                                                    child: Image
                                                                        .asset(
                                                                      'lib/assets/images/bomb2.png',
                                                                      width: 40,
                                                                      height:
                                                                          40,
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .bottomLeft,
                                                                    child: Image
                                                                        .asset(
                                                                      'lib/assets/images/bomb.png',
                                                                      width: 35,
                                                                      height:
                                                                          35,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        1.0),
                                                                child:
                                                                    Image.asset(
                                                                  'lib/assets/images/coin.png',
                                                                  width: 20,
                                                                ),
                                                              ),
                                                              const Text(
                                                                "2",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      const Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            "50:50",
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
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
                                                  StartQuizController
                                                      .hintPercent(
                                                          reduceCoin: true,
                                                          questionId: value
                                                              .quiz!
                                                              .quizQuestions[
                                                                  widget.index]
                                                              .questionId,
                                                          context: context);
                                                },
                                                child: Container(
                                                  width: 110,
                                                  height: 74,
                                                  foregroundDecoration:
                                                      isSelectedAny ||
                                                              value
                                                                  .usedPercentage
                                                          ? BoxDecoration(
                                                              color: Colors
                                                                  .black26,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16),
                                                            )
                                                          : null,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                    border: const Border(
                                                      bottom: BorderSide(
                                                          width: 4,
                                                          color: Colors.orange),
                                                    ),
                                                    // image: DecorationImage(
                                                    //     image: AssetImage(
                                                    //         'lib/assets/images/4.png'),
                                                    //     fit: BoxFit.fill)
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(1.0),
                                                            child: Image.asset(
                                                              'lib/assets/images/disk.png',
                                                              width: 35,
                                                            ),
                                                          ),
                                                          Row(
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        1.0),
                                                                child:
                                                                    Image.asset(
                                                                  'lib/assets/images/coin.png',
                                                                  width: 20,
                                                                ),
                                                              ),
                                                              const Text(
                                                                "1",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      const Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            "İstatistik",
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            isSelectedAny
                                                ? Consumer<AdState>(
                                                    builder: (context, value,
                                                            child) =>
                                                        InkWell(
                                                      onTap: () {
                                                        //see ads
                                                        // _createRewardedAd();
                                                        _showRewardedAd();
                                                      },
                                                      child: Container(
                                                        width: 110,
                                                        height: 74,
                                                        foregroundDecoration:
                                                            AdState.rewardedAd ==
                                                                    null
                                                                ? BoxDecoration(
                                                                    color: Colors
                                                                        .black26,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16),
                                                                  )
                                                                : null,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(16),
                                                          border: const Border(
                                                            bottom: BorderSide(
                                                                width: 4,
                                                                color: Colors
                                                                    .orange),
                                                          ),
                                                          // image: DecorationImage(
                                                          //     image: AssetImage(
                                                          //         'lib/assets/images/4.png'),
                                                          //     fit: BoxFit.fill)
                                                        ),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(1.0),
                                                              child:
                                                                  Image.asset(
                                                                'lib/assets/images/mainstar.png',
                                                                width: 25,
                                                              ),
                                                            ),
                                                            const Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  "1 Coin ",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      color: Colors
                                                                          .orange,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                Text(
                                                                  " topla",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                : InkWell(
                                                    onTap: () {
                                                      showDialog(
                                                        context: context,
                                                        builder: (context) =>
                                                            AlertDialog(
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          content: Container(
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                    .white,
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
                                                                      onTap:
                                                                          () {
                                                                        Navigator.of(context)
                                                                            .pop();
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            100,
                                                                        height:
                                                                            40,
                                                                        decoration:
                                                                            const BoxDecoration(image: DecorationImage(image: AssetImage('lib/assets/images/nobtn.png'), fit: BoxFit.fill)),
                                                                        child:
                                                                            const Center(
                                                                          child:
                                                                              Text(
                                                                            'No',
                                                                            style:
                                                                                TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    InkWell(
                                                                      onTap:
                                                                          () {
                                                                        StartQuizController.reportQuestion(
                                                                            questionId:
                                                                                value.quiz!.quizQuestions[widget.index].questionId,
                                                                            context: context);
                                                                        bool
                                                                            isLast =
                                                                            (widget.index + 1) <
                                                                                value.quiz!.quizQuestions.length;
                                                                        StartQuizController.addAwnswer(
                                                                            userQuizId: value
                                                                                .quiz!.quizId,
                                                                            userDQuizId: value
                                                                                .quiz!.dQuizId,
                                                                            isLast:
                                                                                !isLast,
                                                                            questionId:
                                                                                value.quiz!.quizQuestions[widget.index].questionId,
                                                                            selectedAnswer: selectedIndex,
                                                                            questionNumber: widget.index,
                                                                            context: context);
                                                                        context
                                                                            .read<QuizState>()
                                                                            .removePercentHint();
                                                                        // context
                                                                        //     .read<
                                                                        //         QuizState>()
                                                                        //     .removeEliminateAnswers();
                                                                        if (isLast) {
                                                                          Navigator.of(context)
                                                                              .pushReplacement(
                                                                            PageRouteBuilder(
                                                                                pageBuilder: (_, __, ___) => QuizScreen(index: (widget.index + 1)),
                                                                                transitionDuration: const Duration(milliseconds: 500),
                                                                                transitionsBuilder: (_, a, __, c) => FadeTransition(
                                                                                      opacity: a,
                                                                                      child: c,
                                                                                    )),
                                                                          );
                                                                          Future.delayed(
                                                                              const Duration(milliseconds: 350),
                                                                              () {
                                                                            context.read<QuizState>().removeEliminateAnswers();
                                                                          });
                                                                        } else {
                                                                          showDialog(
                                                                            context:
                                                                                context,
                                                                            builder: (context) =>
                                                                                const AlertDialog(
                                                                              content: SizedBox(
                                                                                height: 500,
                                                                                child: Center(
                                                                                  child: Column(
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      CircularProgressIndicator(),
                                                                                      Text("Waiting for results"),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            100,
                                                                        height:
                                                                            40,
                                                                        decoration:
                                                                            const BoxDecoration(image: DecorationImage(image: AssetImage('lib/assets/images/yesbtn.png'), fit: BoxFit.fill)),
                                                                        child:
                                                                            const Center(
                                                                          child:
                                                                              Text(
                                                                            'Yes',
                                                                            style:
                                                                                TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
                                                      width: 110,
                                                      height: 74,
                                                      // decoration:
                                                      //     const BoxDecoration(
                                                      //   image: DecorationImage(
                                                      //       image: AssetImage(
                                                      //           'lib/assets/images/3.png'),
                                                      //       fit: BoxFit.fill),
                                                      // ),
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16),
                                                        border: const Border(
                                                          bottom: BorderSide(
                                                              width: 4,
                                                              color:
                                                                  Colors.green),
                                                        ),
                                                        // image: DecorationImage(
                                                        //     image: AssetImage(
                                                        //         'lib/assets/images/4.png'),
                                                        //     fit: BoxFit.fill)
                                                      ),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(1.0),
                                                            child: Image.asset(
                                                              'lib/assets/images/report.png',
                                                              width: 25,
                                                            ),
                                                          ),
                                                          const Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                "Report",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
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
      ),
    );
  }
}
