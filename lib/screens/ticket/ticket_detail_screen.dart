import 'package:flutter/material.dart';
import 'package:omicxvn/notifiers/ticket/ticket_detail_notifier.dart';
import 'package:omicxvn/screens/ticket/pager/t_general_screen.dart';
import 'package:provider/provider.dart';

class TicketDetailScreen extends StatelessWidget {
  final int id;
  const TicketDetailScreen({Key? key, required this.id}) : super(key: key);
  static const String routeName = '/ticket_detail';

  @override
  Widget build(BuildContext context) {
    Provider.of<TicketDetailNotifier>(context,listen: false).loadData(id);
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
              Consumer<TicketDetailNotifier>(builder: (context, tickets, child) =>
              TGeneralScreen(ticket: tickets.getTicket())),
              Text("Liên quan"),
              Text("Lịch sử cập nhập"),
              Text("File đính kèm"),
            ],
          )),
    );
  }
}
