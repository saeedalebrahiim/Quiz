import 'dart:async';

import 'package:bilgimizde/view/home/dashboard/home_screen.dart';
import 'package:flutter/material.dart';

class BackgroundServices {
  static Stream timeStream = Stream.periodic(const Duration(seconds: 1));
  static StreamSubscription? streamSubscription;
  static int secondsElapsed = 600;
  static bool isCalled = false;
  static inactive(BuildContext context) {
    if (!isCalled) {
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
      isCalled = true;
    }
  }

  static void stop() {
    if (streamSubscription != null) {
      streamSubscription!.pause();
      isCalled = false;
    }
  }

  static void cancel() {
    if (streamSubscription != null) {
      streamSubscription!.cancel();
      isCalled = false;
    }
  }
}
