import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/core/core.dart';
import '/app/data/constants/constant.dart';

import 'components/ticket_item.dart';
import 'tickets_controller.dart';

class TicketsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ticketsColor,
        title: Text(
          TextConstants.ticketsTitle,
          style: toolbarTextStyle,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.sort),
            onPressed: () {},
          ),
        ],
      ),
      body: GetBuilder<TicketController>(
        builder: (controller) => ListView.builder(
          controller: controller.scrollController,
          itemCount: controller.listTickets.length,
          itemBuilder: (context, index) {
            return TicketItem(
              ticket: controller.listTickets[index],
            );
          },
        ),
      ),
    );
  }
}
