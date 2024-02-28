import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StopWatchProvider with ChangeNotifier {
  Stream<int> timeStream = Stream.periodic(const Duration(seconds: 1));

  StreamSubscription<int>? streamSubscription;

  int secondsElapsed = 30;

  void init() {
    // secondsElapsed = storageService.get(StorageKey.secondsElapsed) ?? 0;
  }

  void start() {
    if (streamSubscription != null && streamSubscription!.isPaused) {
      streamSubscription!.resume();
    } else {
      streamSubscription = timeStream.listen((seconds) {
        secondsElapsed--;
        print("secondsElapsed $secondsElapsed");
        notifyListeners();
        // storageService.set(StorageKey.secondsElapsed, secondsElapsed);
      });
    }
  }

  void stop() {
    if (streamSubscription != null && !streamSubscription!.isPaused) {
      // storageService.set(StorageKey.secondsElapsed, secondsElapsed);
      streamSubscription!.pause();
      secondsElapsed = 30;
      notifyListeners();
      // storageService.set(StorageKey.secondsElapsed, secondsElapsed);
    }
  }

  void cancel() {
    if (streamSubscription != null) {
      streamSubscription!.cancel();
    }
  }
}
