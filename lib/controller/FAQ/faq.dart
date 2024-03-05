import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bilgimizde/model/api/swagger/generated/quiz.swagger.dart';
import 'package:bilgimizde/model/dto/faq.dart';
import 'package:bilgimizde/provider/faq.dart';
import 'package:bilgimizde/services/headers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class FAQController {
  static Future<void> pageList({required BuildContext context}) async {
    final api = Quiz.create(interceptors: [TokenIndicator()]);
    try {
      print("FAQ");
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      String token = sharedPreferences.getString('token').toString();
      var response = await http.get(
        Uri.parse(
            'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/FAQ/PagedList?PageNumber=1&PageSize=10'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
      );
      print(response.body);
      final body = jsonDecode(response.body);

      if (body["isSuccess"] == true) {
        List data = body["data"];
        List<FAQDto> values = [];
        print("in succ");
        print(data);

        for (var v in data) {
          FAQDto value = FAQDto.fromJson(v);
          values.add(value);
        }
        print("after");
        context.read<FAQState>().getFAQs(values: values);
      }

      // var res = await api.apiV1FAQPagedListGet(pageNumber: 1, pageSize: 10);
      // print(res.error);
      // await api.apiV1FAQPagedListGet().then((postResult) {
      //   print("FAQ 2");

      //   // final body = jsonDecode(postResult.bodyString);

      //   // if (body["isSuccess"] == true) {
      //   //   final data = body["data"];
      //   //   List<FAQDto> values = [];
      //   //   print("befor");
      //   //   print(data);
      //   //   Map.from(data).forEach((key, v) {
      //   //     FAQDto value = FAQDto.fromJson(v);
      //   //     values.add(value);
      //   //   });
      //   //   print("after");
      //   //   context.read<FAQState>().getFAQs(values: values);
      //   // }
      // });
    } catch (e) {
      print("faq error $e");
    }
  }
}
