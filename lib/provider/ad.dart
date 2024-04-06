import 'package:bilgimizde/services/admob.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdState extends ChangeNotifier {
  static RewardedAd? rewardedAd;

  createRewardedAd() {
    try {
      RewardedAd.load(
        adUnitId: AdMobService.rewardedAdUnitId2!,
        request: const AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (ad) {
            rewardedAd = ad;
            print("loaaaaaded");
          },
          onAdFailedToLoad: (error) => rewardedAd = null,
        ),
      );
      // _showRewardedAd();
    } catch (e) {
      print("error $e");
    }
    notifyListeners();
  }

  makeItNull() {
    rewardedAd = null;
    notifyListeners();
  }
}
