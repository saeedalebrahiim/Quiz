import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:quiz/model/api/swagger/generated/quiz.swagger.dart';
import 'package:quiz/model/dto/banks.dart';
import 'package:quiz/model/dto/ticket.dart';
import 'package:quiz/provider/settings.dart';
import 'package:quiz/provider/ticket.dart';
import 'package:quiz/services/headers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class TicketController {
  static Future<void> getTicketList({required BuildContext context}) async {
    final api = Quiz.create(interceptors: [TokenIndicator()]);
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      String token = sharedPreferences.getString('token').toString();
      var postResult = await http.get(
        Uri.parse(
            'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Ticket/UserTicketList'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
      );
      final body = jsonDecode(postResult.body);
      // print("body");
      if (body["isSuccess"] == true) {
        List data = body["data"];
        List<TicketDto> values = [];
        print("befor");
        print(data);
        for (var v in data) {
          TicketDto value = TicketDto.fromJson(v);
          values.add(value);
        }
        context.read<TicketStateProvider>().getTicketList(val: values);

        print("after");
      }
    } catch (e) {
      print("faq error $e");
    }
  }

  static Future<void> getTicketDetail(
      {required BuildContext context, required int ticketId}) async {
    final api = Quiz.create(interceptors: [TokenIndicator()]);
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      String token = sharedPreferences.getString('token').toString();
      var postResult = await http.get(
        Uri.parse(
            'https://s6kbp78g353qcceapplication.bilgimizde.com/api/v1/Ticket/TicketDetail?ticketId=$ticketId'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
      );
      final body = jsonDecode(postResult.body);
      // print("body");
      if (body["isSuccess"] == true) {
        List data = body["data"];
        List<Chat> values = [];
        print("befor");
        print(data);
        for (var v in data) {
          Chat value = Chat.fromJson(v);
          values.add(value);
        }
        context.read<TicketStateProvider>().getChatsList(val: values);

        print("after");
      }
    } catch (e) {
      print("faq error $e");
    }
  }

  static Future<void> addTicket({
    required BuildContext context,
    required String? subject,
    required String? desc,
  }) async {
    final api = Quiz.create(interceptors: [TokenIndicator()]);
    try {
      await api
          .apiV1TicketCreateTicketByUserPost(
              desc: desc, id: 0, subject: subject)
          .then((postResult) {
        final body = jsonDecode(postResult.bodyString);

        if (body["isSuccess"] == true) {
          print("one");
          QuickAlert.show(
              context: context,
              type: QuickAlertType.success,
              onConfirmBtnTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              });
        }
      });
    } catch (e) {
      print("faq error $e");
    }
  }
}
