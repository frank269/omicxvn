import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/app/data/models/models.dart';
import '/app/modules/tickets/tickets_repository.dart';

class TicketController extends GetxController {
  final _ticketsRepository = TicketsRepository();
  var scrollController = ScrollController();
  var listTickets = <Ticket>[].obs;
  int _skipcount = 0;
  final int MAX = 5;

  TicketController() {
    scrollController.addListener(() {
      var max = scrollController.position.maxScrollExtent;
      if (scrollController.position.pixels > max) {
        _skipcount += MAX;
        _getMoreData(_skipcount, MAX);
      }
    });
  }

  _ticketParam(skip, take) => TicketParam(
        ticketFilterField:
            TicketFilterField(campaigns: [], groupProcessing: [], status: []),
        skipCount: skip,
        maxResultCount: take,
      );

  loadData() async {
    _skipcount = 0;
    listTickets.value =
        await _ticketsRepository.getTicket(_ticketParam(_skipcount, MAX));
    update();
  }

  _getMoreData(int skip, int result) async {
    listTickets.value
        .addAll(await _ticketsRepository.getTicket(_ticketParam(skip, result)));
    update();
  }
}
