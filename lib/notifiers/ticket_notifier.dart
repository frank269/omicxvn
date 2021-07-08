import 'package:flutter/material.dart';
import 'package:omicxvn/injection/injection.dart';
import 'package:omicxvn/interfaces/ITicketRepository.dart';
import 'package:omicxvn/models/Ticket.dart';
import 'package:omicxvn/models/param/TicketParam.dart';

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

  void loadData(TicketParam param) async {
    _ticketList = await getIt<ITicketRepository>().getTicket(param);
    notifyListeners();
  }

  void getData(TicketParam param) async {
    var list = await getIt<ITicketRepository>().getTicket(param);
    _ticketList.addAll(list);
    notifyListeners();
  }
}
