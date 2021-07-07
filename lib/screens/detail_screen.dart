import 'package:flutter/material.dart';
import 'package:omicxvn/notifiers/detail_notifier.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  static final String routeName = "/detail";
  @override
  Widget build(BuildContext context) {
    Provider.of<DetailNotifier>(context, listen: false).count = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text("detail"),
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.add),
        //     onPressed: () {
        //       Navigator.pushNamed(context, AddPostScreen.routeName);
        //     },
        //   ),
        // ],
      ),
      body: Center(
        child: Container(
          color: Colors.black12,
          child: Consumer<DetailNotifier>(
            builder: (context, detail, child) => Text(
              "count : ${detail.count}",
            ),
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
          elevation: 0.0,
          child: Icon(
            Icons.add,
          ),
          onPressed: () {
            Provider.of<DetailNotifier>(context, listen: false).increaseCount();
          }),
      // drawer: MyDrawer(),
    );
  }
}
