import 'package:flutter/material.dart';
import 'package:omicxvn/injection/injection.dart';
import 'package:omicxvn/interfaces/ITicketRepository.dart';
import 'package:omicxvn/models/Ticket.dart';

class TicketsNotifier with ChangeNotifier {
  List<Ticket> _ticketList = [];

  addTicketToList(Ticket ticket) {
    _ticketList.add(ticket);
    notifyListeners();
  }

  setTicketList(List<Ticket> ticketList) {
    _ticketList = [];
    _ticketList = ticketList;
    notifyListeners();
  }

  clearTicketList() {
    _ticketList = [];
    notifyListeners();
  }

  List<Ticket> getTicketList() {
    return _ticketList;
  }

  void getData(int skipCount, int maxResult) async {
    var list = await getIt<ITicketRepository>().getTicket(skipCount, maxResult);
    _ticketList.addAll(list);
    notifyListeners();
  }
}
