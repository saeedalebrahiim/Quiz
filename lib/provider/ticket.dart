import 'package:flutter/material.dart';
import 'package:quiz/model/api/swagger/generated/quiz.models.swagger.dart';
import 'package:quiz/model/dto/banks.dart';
import 'package:quiz/model/dto/ticket.dart';

class TicketStateProvider extends ChangeNotifier {
  List<TicketDto> tickets = [];
  List<Chat> chats = [];

  getTicketList({required List<TicketDto> val}) {
    tickets = val;
    notifyListeners();
  }

  getChatsList({required List<Chat> val}) {
    chats = val;
    notifyListeners();
  }
}
