import 'package:bilgimizde/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

alertCup() {
  return AlertDialog.adaptive(
    title: const Text('Dear User'),
    content: const Text(
      'We care about your privacy and data security. We keep this app free by showing ads. '
      'Can we continue to use your data to tailor ads for you?\n\nYou can change your choice anytime in the app settings. '
      'Our partners will collect data and use a unique identifier on your device to show you ads.',
    ),
    actions: [
      TextButton(
        onPressed: () {
          Navigator.pop(NavigationService.navigatorKey.currentContext!);
          sharedTru();
        },
        child: const Text('Allow'),
      ),
      TextButton(
        onPressed: () {
          Navigator.pop(NavigationService.navigatorKey.currentContext!);
          sharedTru();
        },
        child: const Text('Do not Allow'),
      ),
    ],
  );
}

sharedTru() async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  sp.setBool("iosOpen", true);
}
