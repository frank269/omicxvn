import 'package:flutter/material.dart';
import 'package:omicxvn/models/Ticket.dart';
import 'package:omicxvn/screens/ticket/ticket_detail_screen.dart';

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
          isShow
              ? Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Icon(
                              Icons.call,
                              size: 40,
                            ),
                            Text("Gọi")
                          ],
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Icon(
                              Icons.sticky_note_2,
                              size: 40,
                            ),
                            Text("Gộp")
                          ],
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Icon(
                              Icons.person,
                              size: 40,
                            ),
                            Text("Phân công")
                          ],
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        child: GestureDetector(
                          child: Column(
                            children: [
                              Icon(
                                Icons.info_outline,
                                size: 40,
                              ),
                              Text("Chi tiết")
                            ],
                          ),
                          onTap: () => Navigator.pushNamed(
                              context, TicketDetailScreen.routeName, arguments: widget.ticket.id),
                        ),
                        flex: 1,
                      ),
                    ],
                  ),
                )
              : Container()
        ],
      ),
    );
  }

  _showAdvanced() {
    setState(() {
      isShow = !isShow;
    });
  }
}
