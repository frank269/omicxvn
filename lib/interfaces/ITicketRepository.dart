import 'package:omicxvn/models/Ticket.dart';
import 'package:omicxvn/models/param/TicketParam.dart';

abstract class ITicketRepository {
  Future<List<Ticket>> getTicket(TicketParam ticketParam);

  Future<Ticket> getDetailTicket(int id);
  // Future<bool> addTicket(Ticket ticket);
}
