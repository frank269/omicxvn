import 'package:flutter/material.dart';
import 'package:omicxvn/injection/injection.dart';
import 'package:omicxvn/interfaces/ITicketRepository.dart';
import 'package:omicxvn/models/Ticket.dart';

class TicketDetailNotifier with ChangeNotifier {
  Ticket _ticket = Ticket();

  setTicket(Ticket t) {
    _ticket = t;
    notifyListeners();
  }

  deleteTicket() {
    _ticket = Ticket();
    notifyListeners();
  }

  Ticket getTicket() {
    return _ticket;
  }

  Future<Ticket> loadData(int id) async {
    _ticket = await getIt<ITicketRepository>().getDetailTicket(id);
    notifyListeners();
    return _ticket;
  }
}
