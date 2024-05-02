import 'dart:io';

import 'package:user_messaging_platform/user_messaging_platform.dart';

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

  // Using a field to access the plugin makes access less verbose and allows
  // replacing it with a mock for testing.
  static final ump = UserMessagingPlatform.instance;

  // Only applicable to iOS.
  static TrackingAuthorizationStatus? trackingAuthorizationStatus;

  // The latest consent info.
  static ConsentInformation? consentInformation;
  // Settings for ConsentRequestParameters
  static bool tagAsUnderAgeOfConsent = false;
  static bool debugSettings = false;
  static String? testDeviceId;

  static Future<void> loadTrackingAuthorizationStatus() {
    return ump.getTrackingAuthorizationStatus().then((status) {
      trackingAuthorizationStatus = status;
    });
  }

  static Future<void> loadConsentInfo() {
    print("loaded");
    return ump.getConsentInfo().then((info) {
      consentInformation = info;
      print("loaded $info");
    });
  }
}
