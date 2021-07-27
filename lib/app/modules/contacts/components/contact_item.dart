import 'package:flutter/material.dart';
import '/app/data/models/models.dart';

class ContactItem extends StatelessWidget {
  const ContactItem({Key? key, required this.item}) : super(key: key);
  final Contact item;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: ListTile(
          minLeadingWidth: 20,
          leading: Icon(
            Icons.account_circle_rounded,
            color: Colors.green,
            size: 40,
          ),
          title: Text(
            '${item.fullName}',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text('${item.phoneNumber1}'),
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
                        Icons.archive,
                        size: 30,
                        color: Colors.green,
                      ),
                      Text("Tạo Tickket")
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
                      Text("Nhân bản")
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
                    onTap: () {},
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
