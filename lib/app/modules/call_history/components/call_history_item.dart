import 'package:flutter/material.dart';
import '/app/data/models/models.dart';

class CallHistoryItem extends StatelessWidget {
  const CallHistoryItem({Key? key, required this.item}) : super(key: key);
  final CallHistory item;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.phoneNumber,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.outbound_outlined),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Cuộc gọi đi'),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(item.date),
                  Text(item.time),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
