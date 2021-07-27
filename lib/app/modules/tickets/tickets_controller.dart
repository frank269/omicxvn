import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/app/data/models/models.dart';
import '/app/modules/tickets/tickets_repository.dart';

class TicketController extends GetxController {
  final _ticketsRepository = TicketsRepository();
  var listTickets = <Ticket>[].obs;
  int _skipcount = 0;
  final int MAX = 20;
  var isbusy = false;

  _ticketParam(skip, take) => TicketParam(
        ticketFilterField:
            TicketFilterField(campaigns: [], groupProcessing: [], status: []),
        skipCount: skip,
        maxResultCount: take,
      );

  loadData() async {
    isbusy = true;
    _skipcount = 0;
    listTickets.value =
        await _ticketsRepository.getTicket(_ticketParam(_skipcount, MAX));
    update();
    isbusy = false;
  }

  loadMore() async {
    isbusy = true;
    var result = await await _ticketsRepository
        .getTicket(_ticketParam(_skipcount + MAX, MAX));
    if (result.isNotEmpty) {
      listTickets.value.addAll(result);
      _skipcount += MAX;
      update();
    }
    isbusy = false;
  }
}
