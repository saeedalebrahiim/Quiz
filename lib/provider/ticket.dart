import 'package:flutter/material.dart';
import 'package:bilgimizde/model/api/swagger/generated/quiz.models.swagger.dart';
import 'package:bilgimizde/model/dto/banks.dart';
import 'package:bilgimizde/model/dto/ticket.dart';

class TicketStateProvider extends ChangeNotifier {
  List<TicketDto> tickets = [];
  List<ChatDto> chats = [];

  getTicketList({required List<TicketDto> val}) {
    tickets = val;
    notifyListeners();
  }

  getChatsList({required List<ChatDto> val}) {
    chats = val;
    notifyListeners();
  }
}
