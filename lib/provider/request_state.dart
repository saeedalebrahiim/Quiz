import 'package:flutter/material.dart';
import 'package:bilgimizde/model/dto/ticket.dart';

class RequestState extends ChangeNotifier {
  List requests = [];
  getRequestList({required List<TicketDto> val}) {
    notifyListeners();
  }
}
