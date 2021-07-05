import 'package:flutter/material.dart';
import 'package:omicxvn/notifiers/ticket_notifier.dart';
import 'package:omicxvn/widgets/drawer.dart';
import 'package:omicxvn/components/ticket/TicketItemView.dart';
import 'package:provider/provider.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  static const String routeName = '/ticket';

  @override
  _TicketScreenState createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  @override
  void initState() {
    Provider.of<TicketsNotifier>(context, listen: false).getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: null,
              icon: Icon(Icons.add, color: Colors.white,))
        ],
      ),
      body: Consumer<TicketsNotifier>(
        builder: (context, tickets, child) =>
            Container(
              color: Colors.black12,
              child: ListView.builder(
                  itemCount: tickets.getTicketList().length,
                  itemBuilder: (context, index) {
                    return TicketItemWidget(ticket: tickets.getTicketList()[index]);
                  }),
            ),
      ),
      drawer: MyDrawer(),
    );
  }
}


