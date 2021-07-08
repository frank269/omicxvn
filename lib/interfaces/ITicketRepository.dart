import 'package:omicxvn/models/Ticket.dart';

abstract class ITicketRepository {
  Future<List<Ticket>> getTicket(int skipCount, int maxResult);
  // Future<bool> addTicket(Ticket ticket);
}
