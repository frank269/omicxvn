import 'package:flutter/material.dart';
import 'package:omicxvn/models/Ticket.dart';

class TicketItemWidget extends StatelessWidget {
  final Ticket ticket;

  const TicketItemWidget({Key? key, required this.ticket}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        minLeadingWidth: 10,
        leading: Text(ticket.id.toString()),
        title: Text(ticket.title.toString()),
        trailing: Text(ticket.status.toString()),
      ),
    );
  }
}
