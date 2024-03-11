import 'dart:async';

import 'package:bilgimizde/view/home/dashboard/home_screen.dart';
import 'package:flutter/material.dart';

class BackgroundServices {
  static Stream timeStream = Stream.periodic(const Duration(seconds: 1));
  static StreamSubscription? streamSubscription;
  static int secondsElapsed = 600;
  static inactive(BuildContext context) {
    streamSubscription = timeStream.listen((seconds) {
      secondsElapsed--;
      print(secondsElapsed);
      print(secondsElapsed <= 0);
      if (secondsElapsed <= 0) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
            (route) => false);
        stop();
        cancel();
      }
    });
  }

  static void stop() {
    if (streamSubscription != null) {
      streamSubscription!.pause();
    }
  }

  static void cancel() {
    if (streamSubscription != null) {
      streamSubscription!.cancel();
    }
  }
}
