import 'dart:async';
import 'dart:convert';

import 'package:bilgimizde/view/help/help_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:bilgimizde/model/api/swagger/generated/quiz.swagger.dart';
import 'package:bilgimizde/model/dto/ticket.dart';
import 'package:bilgimizde/provider/ticket.dart';
import 'package:bilgimizde/services/headers.dart';
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

  static Future<List<ChatDto>?> getTicketDetail(
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
      print("body $body");
      if (body["isSuccess"] == true) {
        List data = body["data"]["items"];
        List<ChatDto> values = [];
        print("befor");

        for (var v in data) {
          ChatDto value = ChatDto.fromJson(v);
          values.add(value);
        }
        print("${values.length}values length");
        // context.read<TicketStateProvider>().getChatsList(val: values);
        return values;
      }
    } catch (e) {
      print("faq error $e");
      return [];
    }
    return null;
  }

  static Future<void> addTicket(
      {required BuildContext context,
      required String? subject,
      required String? desc,
      required int? id}) async {
    final api = Quiz.create(interceptors: [TokenIndicator()]);
    try {
      print(id);
      print(desc);
      print(subject);

      await api
          .apiV1TicketCreateTicketByUserPost(
              desc: desc, id: id, subject: subject)
          .then((postResult) {
        final body = jsonDecode(postResult.bodyString);

        print(body["message"]);

        if (body["isSuccess"] == true) {
          print("one");
          QuickAlert.show(
              context: context,
              type: QuickAlertType.success,
              onConfirmBtnTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacement(
                  PageRouteBuilder(
                      pageBuilder: (_, __, ___) => const HelpScreen(),
                      transitionDuration: const Duration(milliseconds: 500),
                      transitionsBuilder: (_, a, __, c) => FadeTransition(
                            opacity: a,
                            child: c,
                          )),
                );
              });
        }
      });
    } catch (e) {
      print("add error $e");
    }
  }

  static Future<void> addTicketAnswer(
      {required BuildContext context,
      required String? subject,
      required String? desc,
      required int? id}) async {
    final api = Quiz.create(interceptors: [TokenIndicator()]);
    try {
      print(id);
      print(desc);
      print(subject);

      await api
          .apiV1TicketAddTicketAnswerByUserPost(desc: desc, id: 0, ticketId: id)
          .then((postResult) {
        final body = jsonDecode(postResult.bodyString);

        print(body["message"]);

        if (body["isSuccess"] == true) {
          print("one");
        }
      });
    } catch (e) {
      print("add error $e");
    }
  }
}
