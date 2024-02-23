import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/model/api/swagger/generated/quiz.swagger.dart';
import 'package:quiz/provider/banners.dart';

class BannersController {
  static Future<void> getBanners({required BuildContext context}) async {
    final api = Quiz.create();
    try {
      await api.apiV1BanerGetBannerGet().then((postResult) {
        print("called banners");

        final body = jsonDecode(postResult.bodyString)["data"];
        if (postResult.isSuccessful == true) {
          // for (var i = 0; i < 3; i++) {
          context.read<BannersState>().changeBanners(
              index: 0,
              address: body['banerFilePath1'],
              url: body['banerTitle1']);
          // }
        }
      });
    } catch (e) {
      // print(e);
    }
  }
}
