import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omicxvn/app/routes/pages.dart';
import '/app/data/models/models.dart';

class TicketItem extends StatelessWidget {
  final Ticket item;
  const TicketItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: ListTile(
          minLeadingWidth: 10,
          leading: Text(item.id.toString()),
          title: Text(item.title.toString()),
          trailing: Text(item.status.toString()),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Icon(
                        Icons.call,
                        size: 30,
                        color: Colors.green,
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
                        size: 30,
                        color: Colors.green,
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
                        size: 30,
                        color: Colors.green,
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
                          size: 30,
                          color: Colors.green,
                        ),
                        Text("Chi tiết")
                      ],
                    ),
                    onTap: () =>
                        Get.toNamed('${Routes.TICKET_DETAIL}?id=${item.id}'),
                  ),
                  flex: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
