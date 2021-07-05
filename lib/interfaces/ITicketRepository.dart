import 'package:omicxvn/models/Ticket.dart';

abstract class ITicketRepository {
  Future<List<Ticket>> getTicket();
  // Future<bool> addTicket(Ticket ticket);
}
