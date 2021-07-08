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
  ScrollController _scrollController = ScrollController();
  int _skipcount = 0;
  int _maxResult = 20;
  @override
  void initState() {
    Provider.of<TicketsNotifier>(context, listen: false).getData(_skipcount,_maxResult);
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print("loadmore");
        _skipcount += _maxResult;
        _getMoreData(_skipcount,_maxResult);
      }
    });
  }

  _getMoreData(int skip, int result) {
    Provider.of<TicketsNotifier>(context, listen: false).getData(skip,result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: null,
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ))
        ],
      ),
      body: Consumer<TicketsNotifier>(
        builder: (context, tickets, child) => Container(
          color: Colors.black12,
          child: ListView.builder(
              controller: _scrollController,
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
