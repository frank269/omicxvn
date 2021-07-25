import 'package:get/get.dart';

import '/app/data/models/models.dart';
import '/app/modules/tickets/tickets_repository.dart';

class TicketDetailController extends GetxController {
  final _ticketsRepository = TicketsRepository();
  var ticket = Ticket();
  loadTicket(int id) async {
    ticket = await _ticketsRepository.getDetailTicket(id);
    update();
  }
}
