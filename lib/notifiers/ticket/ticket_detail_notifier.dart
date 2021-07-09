
import 'package:flutter/material.dart';
import 'package:omicxvn/injection/injection.dart';
import 'package:omicxvn/interfaces/ITicketRepository.dart';
import 'package:omicxvn/models/Ticket.dart';

class TicketDetailNotifier with ChangeNotifier {
    Ticket? _ticket;

    setTicket(Ticket t) {
      _ticket = t;
      notifyListeners();
    }

    deleteTicket() {
      _ticket = null;
      notifyListeners();
    }

    Ticket? getTicket() {
      return _ticket;
    }

    void loadData(int id) async {
      _ticket = await getIt<ITicketRepository>().getDetailTicket(id);
      notifyListeners();
    }

}