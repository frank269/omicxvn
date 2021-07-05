import 'package:flutter/material.dart';
import 'package:omicxvn/models/Ticket.dart';

class TicketItemWidget extends StatelessWidget {
  final Ticket ticket;

  const TicketItemWidget({Key? key, required this.ticket}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 30,
              child: Text(ticket.id.toString()),
            ),
            Container(
              width: 250,
              child: Text(ticket.title.toString()),
            ),
            Container(
              width: 80,
              child: Text(ticket.status.toString())
            )
          ],
        ),
      ),
    );
  }
}
