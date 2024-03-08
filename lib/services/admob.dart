import 'dart:io';

class AdMobService {
  //bottom banner
  static String? get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/6300978111';
    } else if (Platform.isIOS) {
      return '';
    }
    return null;
  }

  static String? get appOpenAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-5344393902349142/9190629770';
    } else if (Platform.isIOS) {
      return '';
    }
    return null;
  }

// rewarded ad for homepage
  static String? get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-5344393902349142/8395158826';
    } else if (Platform.isIOS) {
      return '';
    }
    return null;
  }

  static String? get rewardedAdUnitId2 {
    if (Platform.isAndroid) {
      return 'ca-app-pub-5344393902349142/9532980678';
    } else if (Platform.isIOS) {
      return '';
    }
    return null;
  }
}
