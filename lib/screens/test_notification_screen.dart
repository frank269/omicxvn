import 'package:flutter/material.dart';
import 'package:omicxvn/screens/ticket_screen.dart';
import 'package:omicxvn/utils/LocalNotifyManager.dart';
import 'package:omicxvn/widgets/drawer.dart';

class NotificationScreen extends StatefulWidget {
  static const String routeName = '/notifi';
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  LocalNotifyManager localNotifyManager = LocalNotifyManager();
  @override
  void initState() {
    super.initState();
    localNotifyManager.setOnNotificationReceive(onNotificationReceive);
    localNotifyManager.setOnNotificationClick(onNotificationClick);
  }

  onNotificationReceive(ReceiveNotification notification) {
    print('Notification Received: ${notification.id}');
  }

  onNotificationClick(String payload) {
    print('Payload: $payload');
    // Navigator.pushReplacementNamed(context, TicketScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("test notify"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("show notification"),
          onPressed: () async {
            // await localNotifyManager.showNotification();
            await localNotifyManager.scheduleNotification(10);
            // await localNotifyManager.showDailyAtTimeNotification();
            // localNotifyManager.cancelAllNotification();
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
