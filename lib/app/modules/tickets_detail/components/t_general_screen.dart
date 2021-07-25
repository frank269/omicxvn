import 'package:flutter/material.dart';
import '/app/data/models/models.dart';

class TGeneralScreen extends StatelessWidget {
  final Ticket ticket;
  const TGeneralScreen({Key? key, required this.ticket}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/ticket_box.png',
                  fit: BoxFit.cover,
                  width: 40,
                  // height: 1000,
                ),
                Text("Thông tin chung"),
                Icon(
                  Icons.call,
                  size: 40,
                  color: Colors.green,
                ),
                Icon(
                  Icons.email,
                  size: 40,
                  color: Colors.red,
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  size: 40,
                  color: Colors.blue,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Trạng thái:",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    flex: 2,
                  ),
                  Expanded(
                    child: Text("${ticket.status}"),
                    flex: 3,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Loại ticket:",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    flex: 2,
                  ),
                  Expanded(
                    child: Text("${ticket.ticketType}"),
                    flex: 3,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Mức độ ưu tiên:",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    flex: 2,
                  ),
                  Expanded(
                    child: Text("${ticket.priority}"),
                    flex: 3,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Hạn hoàn thành:",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    flex: 2,
                  ),
                  Expanded(
                    child: Text("${ticket.completedDate}"),
                    flex: 3,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Người xử lý:",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    flex: 2,
                  ),
                  Expanded(
                    child: Text("${ticket.agentAssignee}"),
                    flex: 3,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Nhóm xử lý:",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    flex: 2,
                  ),
                  Expanded(
                    child: Text("${ticket.groupProcessing}"),
                    flex: 3,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Người tạo:",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    flex: 2,
                  ),
                  Expanded(
                    child: Text("${ticket.creationUser}"),
                    flex: 3,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Ngày tạo:",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    flex: 2,
                  ),
                  Expanded(
                    child: Text("${ticket.creationDate}"),
                    flex: 3,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Ngày cập nhập:",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    flex: 2,
                  ),
                  Expanded(
                    child: Text("${ticket.lastUpdateDate}"),
                    flex: 3,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Đánh giá ticket:",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    flex: 2,
                  ),
                  Expanded(
                    child: Text(""),
                    flex: 3,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
