import 'package:flutter/material.dart';
import 'package:bilgimizde/model/dto/ticket.dart';

class TicketStateProvider extends ChangeNotifier {
  List<TicketDto> tickets = [];
  bool gotList = false;

  List<ChatDto> chats = [];

  getTicketList({required List<TicketDto> val}) {
    tickets = val;
    gotList = true;
    notifyListeners();
  }

  getChatsList({required List<ChatDto> val}) {
    chats = val;
    notifyListeners();
  }
}
