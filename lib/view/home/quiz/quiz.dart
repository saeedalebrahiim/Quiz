import 'package:bilgimizde/controller/profile/profile.dart';
import 'package:bilgimizde/services/admob.dart';
import 'package:flutter/material.dart';
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

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key, required this.index});
  final int index;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int selectedIndex = 0;
  bool isSelectedAny = false;
  StopWatchProvider? stopWatchProvider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getStop();
    // _createRewardedAd();
  }

  getStop() {
    stopWatchProvider = Provider.of<StopWatchProvider>(context, listen: false);
    stopWatchProvider!.start(context: context, index: widget.index);
    // context
    //     .read<StopWatchProvider>()
    //     .start(context: context, index: widget.index);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    stopWatchProvider!.stop();
    // context.read<StopWatchProvider>().stop();
    // context.read<StopWatchProvider>().cancel();

    stopWatchProvider!.cancel();
    super.dispose();
  }

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
      _showRewardedAd();
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
        onUserEarnedReward: (ad, reward) => print("this is $ad + $reward"),
      );
      _rewardedAd = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            color: primaryColor,
            image: const DecorationImage(
                image: AssetImage('lib/assets/images/bg2.png'),
                fit: BoxFit.fill)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 45),
                      child: InkWell(
                        onTap: () {
                          // Navigator.pop(context);
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ),
                              (route) => false);
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
                      child: Consumer<StopWatchProvider>(
                        builder: (c, stopWatchProvider, _) {
                          Duration duration = Duration(
                              seconds: stopWatchProvider.secondsElapsed);

                          return Padding(
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
                                Text(
                                  "${duration.inSeconds.toString()} s",
                                  style: const TextStyle(color: Colors.white),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: SizedBox(
                                    width: 150,
                                    height: 10,
                                    child: LinearProgressIndicator(
                                      backgroundColor: Colors.black,
                                      color: Colors.green,
                                      value: (duration.inSeconds / 30),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
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
                  ],
                ),
              ),
              Consumer<QuizState>(
                builder: (context, value, child) => SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height - 70,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              value.quiz!.quizQuestions[widget.index]
                                  .questionText,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                shadows: [
                                  Shadow(color: Colors.white, blurRadius: 20)
                                ],
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'lib/assets/images/quizbg.png'),
                                  fit: BoxFit.fill)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${widget.index + 1} / ${value.quiz!.quizQuestions.length}",
                                style: const TextStyle(color: Colors.white),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              const Text(
                                'Doğru şıkkı seç:',
                                style: TextStyle(color: Colors.white),
                              ),
                              Wrap(
                                direction: Axis.horizontal,
                                children: [
                                  value.eliminateAnswers.isNotEmpty &&
                                          value.eliminateAnswers.contains(1)
                                      ? const SizedBox()
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
                                                  .read<StopWatchProvider>()
                                                  .stop();
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(3.0),
                                              child: AnswerCard(
                                                helpPercentage: value.percentHint !=
                                                        null
                                                    ? value.percentHint!
                                                            .selectedAnswer1Count /
                                                        (value.percentHint!
                                                                .selectedAnswer1Count +
                                                            value.percentHint!
                                                                .selectedAnswer2Count +
                                                            value.percentHint!
                                                                .selectedAnswer3Count +
                                                            value.percentHint!
                                                                .selectedAnswer4Count)
                                                    : null,
                                                question: value
                                                    .quiz!
                                                    .quizQuestions[widget.index]
                                                    .answer1,
                                                isSelected: selectedIndex == 1,
                                                correctAnswerIndex: value
                                                    .quiz!
                                                    .quizQuestions[widget.index]
                                                    .currectAnswer,
                                                currentIndex: 1,
                                              ),
                                            ),
                                          ),
                                        ),
                                  value.eliminateAnswers.isNotEmpty &&
                                          value.eliminateAnswers.contains(2)
                                      ? const SizedBox()
                                      : Padding(
                                          padding: const EdgeInsets.all(3.0),
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
                                                    .read<StopWatchProvider>()
                                                    .stop();
                                              },
                                              child: AnswerCard(
                                                helpPercentage: value.percentHint !=
                                                        null
                                                    ? value.percentHint!
                                                            .selectedAnswer2Count /
                                                        (value.percentHint!
                                                                .selectedAnswer1Count +
                                                            value.percentHint!
                                                                .selectedAnswer2Count +
                                                            value.percentHint!
                                                                .selectedAnswer3Count +
                                                            value.percentHint!
                                                                .selectedAnswer4Count)
                                                    : null,
                                                question: value
                                                    .quiz!
                                                    .quizQuestions[widget.index]
                                                    .answer2,
                                                isSelected: selectedIndex == 2,
                                                correctAnswerIndex: value
                                                    .quiz!
                                                    .quizQuestions[widget.index]
                                                    .currectAnswer,
                                                currentIndex: 2,
                                              ),
                                            ),
                                          ),
                                        ),
                                  value.eliminateAnswers.isNotEmpty &&
                                          value.eliminateAnswers.contains(3)
                                      ? const SizedBox()
                                      : Padding(
                                          padding: const EdgeInsets.all(3.0),
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
                                                    .read<StopWatchProvider>()
                                                    .stop();
                                              },
                                              child: AnswerCard(
                                                helpPercentage: value.percentHint !=
                                                        null
                                                    ? value.percentHint!
                                                            .selectedAnswer3Count /
                                                        (value.percentHint!
                                                                .selectedAnswer1Count +
                                                            value.percentHint!
                                                                .selectedAnswer2Count +
                                                            value.percentHint!
                                                                .selectedAnswer3Count +
                                                            value.percentHint!
                                                                .selectedAnswer4Count)
                                                    : null,
                                                question: value
                                                    .quiz!
                                                    .quizQuestions[widget.index]
                                                    .answer3,
                                                isSelected: selectedIndex == 3,
                                                correctAnswerIndex: value
                                                    .quiz!
                                                    .quizQuestions[widget.index]
                                                    .currectAnswer,
                                                currentIndex: 3,
                                              ),
                                            ),
                                          ),
                                        ),
                                  value.eliminateAnswers.isNotEmpty &&
                                          value.eliminateAnswers.contains(4)
                                      ? const SizedBox()
                                      : Padding(
                                          padding: const EdgeInsets.all(3.0),
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
                                                    .read<StopWatchProvider>()
                                                    .stop();
                                              },
                                              child: AnswerCard(
                                                helpPercentage: value.percentHint !=
                                                        null
                                                    ? value.percentHint!
                                                            .selectedAnswer4Count /
                                                        (value.percentHint!
                                                                .selectedAnswer1Count +
                                                            value.percentHint!
                                                                .selectedAnswer2Count +
                                                            value.percentHint!
                                                                .selectedAnswer3Count +
                                                            value.percentHint!
                                                                .selectedAnswer4Count)
                                                    : null,
                                                question: value
                                                    .quiz!
                                                    .quizQuestions[widget.index]
                                                    .answer4,
                                                isSelected: selectedIndex == 4,
                                                correctAnswerIndex: value
                                                    .quiz!
                                                    .quizQuestions[widget.index]
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
                                      padding: const EdgeInsets.all(5),
                                      child: SizedBox(
                                        width: 300,
                                        child: RawMaterialButton(
                                          onPressed: () {
                                            //TODO everting should be on report
                                            bool isLast = (widget.index + 1) <
                                                value
                                                    .quiz!.quizQuestions.length;
                                            StartQuizController.addAwnswer(
                                                userQuizId: value.quiz!.quizId,
                                                userDQuizId:
                                                    value.quiz!.dQuizId,
                                                isLast: !isLast,
                                                questionId: value
                                                    .quiz!
                                                    .quizQuestions[widget.index]
                                                    .questionId,
                                                selectedAnswer: selectedIndex,
                                                questionNumber: widget.index,
                                                context: context);
                                            context
                                                .read<QuizState>()
                                                .removePercentHint();
                                            context
                                                .read<QuizState>()
                                                .removeEliminateAnswers();
                                          },
                                          fillColor: Colors.green,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                          child: const Text(
                                            "Sıradaki",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    )
                                  : const SizedBox(),
                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IgnorePointer(
                                      ignoring: isSelectedAny,
                                      child: InkWell(
                                        onTap: () {
                                          StartQuizController.hinteliminate(
                                              questionId: value
                                                  .quiz!
                                                  .quizQuestions[widget.index]
                                                  .questionId,
                                              context: context);
                                        },
                                        child: Container(
                                          width: 80,
                                          height: 60,
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
                                      ignoring: isSelectedAny,
                                      child: InkWell(
                                        onTap: () {
                                          StartQuizController.hintPercent(
                                              questionId: value
                                                  .quiz!
                                                  .quizQuestions[widget.index]
                                                  .questionId,
                                              context: context);
                                        },
                                        child: Container(
                                          width: 95,
                                          height: 58,
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'lib/assets/images/2.png'),
                                                  fit: BoxFit.fill)),
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
                                              _createRewardedAd();
                                              // _showRewardedAd();
                                            },
                                            child: Container(
                                              width: 90,
                                              height: 55,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: const Border(
                                                  bottom: BorderSide(
                                                      width: 3,
                                                      color: Colors.orange),
                                                ),
                                                color: Colors.white,
                                              ),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            1.0),
                                                    child: Image.asset(
                                                      'lib/assets/images/mainstar.png',
                                                      width: 25,
                                                    ),
                                                  ),
                                                  const Text(
                                                    "TL topla",
                                                    style:
                                                        TextStyle(fontSize: 10),
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        : InkWell(
                                            onTap: () {
                                              StartQuizController
                                                  .reportQuestion(
                                                      questionId: value
                                                          .quiz!
                                                          .quizQuestions[
                                                              widget.index]
                                                          .questionId,
                                                      context: context);
                                              bool isLast = (widget.index + 1) <
                                                  value.quiz!.quizQuestions
                                                      .length;
                                              StartQuizController.addAwnswer(
                                                  userQuizId:
                                                      value.quiz!.quizId,
                                                  userDQuizId:
                                                      value.quiz!.dQuizId,
                                                  isLast: !isLast,
                                                  questionId: value
                                                      .quiz!
                                                      .quizQuestions[
                                                          widget.index]
                                                      .questionId,
                                                  selectedAnswer: selectedIndex,
                                                  questionNumber: widget.index,
                                                  context: context);
                                              context
                                                  .read<QuizState>()
                                                  .removePercentHint();
                                              context
                                                  .read<QuizState>()
                                                  .removeEliminateAnswers();
                                            },
                                            child: Container(
                                              width: 90,
                                              height: 60,
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
