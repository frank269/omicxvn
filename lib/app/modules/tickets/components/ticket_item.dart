import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omicxvn/app/routes/pages.dart';
import '/app/data/models/models.dart';

class TicketItem extends StatefulWidget {
  final Ticket ticket;

  const TicketItem({Key? key, required this.ticket}) : super(key: key);
  @override
  _TicketItemState createState() => _TicketItemState();
}

class _TicketItemState extends State<TicketItem> {
  bool isShow = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            onTap: () => _showAdvanced(),
            minLeadingWidth: 10,
            leading: Text(widget.ticket.id.toString()),
            title: Text(widget.ticket.title.toString()),
            trailing: Text(widget.ticket.status.toString()),
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
                          onTap: () => Get.toNamed(
                              '${Routes.TICKET_DETAIL}?id=${widget.ticket.id}'),
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
