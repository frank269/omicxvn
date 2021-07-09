import 'package:flutter/material.dart';
import 'package:omicxvn/screens/ticket/pager/t_general_screen.dart';

class TicketDetailScreen extends StatelessWidget {
  const TicketDetailScreen({Key? key}) : super(key: key);
  static const String routeName = '/ticket_detail';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            title: Text("Chi tiết ticket"),
            bottom: TabBar(
              tabs: [
                Tab(
                  text: "Chung",
                ),
                Tab(
                  text: "Liên quan",
                ),
                Tab(
                  text: "Lịch sử cập nhập",
                ),
                Tab(
                  text: "File đính kèm",
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [
              TGeneralScreen(),
              Text("Liên quan"),
              Text("Lịch sử cập nhập"),
              Text("File đính kèm"),
            ],
          )),
    );
  }
}
