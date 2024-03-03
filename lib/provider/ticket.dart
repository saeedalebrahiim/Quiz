import 'package:flutter/material.dart';
import 'package:quiz/model/api/swagger/generated/quiz.models.swagger.dart';
import 'package:quiz/model/dto/banks.dart';
import 'package:quiz/model/dto/ticket.dart';

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
