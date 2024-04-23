import 'package:bilgimizde/model/dto/transactions.dart';
import 'package:flutter/material.dart';
import 'package:bilgimizde/model/dto/ticket.dart';

class RequestState extends ChangeNotifier {
  List<TransactionDto> requests = [];
  getRequestList({required List<TransactionDto> val}) {
    requests = val;
    notifyListeners();
  }
}
