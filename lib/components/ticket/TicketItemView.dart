import 'package:flutter/material.dart';
import 'package:omicxvn/models/Ticket.dart';

class TicketItemWidget extends StatefulWidget {
  final Ticket ticket;

  const TicketItemWidget({Key? key, required this.ticket}) : super(key: key);

  @override
  _TicketItemWidgetState createState() => _TicketItemWidgetState();
}

class _TicketItemWidgetState extends State<TicketItemWidget> {
  bool isShow = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Card(
            child: ListTile(
              onTap: () => _showAdvanced(),
              minLeadingWidth: 10,
              leading: Text(widget.ticket.id.toString()),
              title: Text(widget.ticket.title.toString()),
              trailing: Text(widget.ticket.status.toString()),
            ),
          ),
          isShow ? Text("Hello") : Container()
        ],
      ),
    );
  }

  _showAdvanced() {
    print(isShow);
    setState(() {
      isShow = !isShow;
    });
  }
}
