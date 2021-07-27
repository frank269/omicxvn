import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omicxvn/app/modules/tickets/components/ticket_item.dart';
import '/app/core/core.dart';
import '/app/data/constants/constant.dart';
import 'tickets_controller.dart';

class TicketsScreen extends StatelessWidget {
  bool loadMore(controller, scrollInfo) {
    if (!controller.isbusy &&
        scrollInfo.metrics.pixels > scrollInfo.metrics.maxScrollExtent * 0.9) {
      controller.loadMore();
    }
    return true;
  }

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
          builder: (controller) => NotificationListener<ScrollNotification>(
                child: ListView.builder(
                  itemCount: controller.listTickets.length,
                  itemBuilder: (context, index) {
                    return TicketItem(item: controller.listTickets[index]);
                  },
                ),
                onNotification: (notification) =>
                    loadMore(controller, notification),
              )),
    );
  }
}
