import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:omicxvn/screens/ticket_screen.dart';
import 'package:omicxvn/utils/LocalNotifyManager.dart';
import 'package:omicxvn/widgets/drawer.dart';
import 'package:giffy_dialog/giffy_dialog.dart';

class NotificationScreen extends StatefulWidget {
  static const String routeName = '/notifi';
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  // LocalNotifyManager localNotifyManager = LocalNotifyManager();
  @override
  void initState() {
    super.initState();
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        // Insert here your friendly dialog box before call the request method
        // This is very important to not harm the user experience
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });

    AwesomeNotifications().actionStream.listen((receivedNotification) {
      Navigator.pushReplacementNamed(context, TicketScreen.routeName);
    });
    // localNotifyManager.setOnNotificationReceive(onNotificationReceive);
    // localNotifyManager.setOnNotificationClick(onNotificationClick);
  }

  // onNotificationReceive(ReceiveNotification notification) {
  //   print('Notification Received: ${notification.id}');
  // }

  // onNotificationClick(String payload) {
  //   print('Payload: $payload');
  //   // Navigator.pushReplacementNamed(context, TicketScreen.routeName);
  // }

  showGiffyDialog() {
    {
      showDialog(
          context: context,
          builder: (_) => NetworkGiffyDialog(
                image: Image.network(
                    "https://raw.githubusercontent.com/Shashank02051997/FancyGifDialog-Android/master/GIF's/gif14.gif"),
                title: const Text('Granny Eating Chocolate',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600)),
                description: const Text(
                  '''
                  This is a granny eating chocolate dialog box. This library helps you easily create fancy giffy dialog
                  ''',
                  textAlign: TextAlign.center,
                ),
                entryAnimation: EntryAnimation.DEFAULT,
                onOkButtonPressed: () {},
              ));
    }
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
            await AwesomeNotifications().createNotification(
              content: NotificationContent(
                  id: 10,
                  channelKey: 'basic_channel',
                  title: 'Simple Notification',
                  body: 'Simple body'),
            );
            // showGiffyDialog();
            // await localNotifyManager.showNotification();
            // await localNotifyManager.scheduleNotification(10);
            // await localNotifyManager.showDailyAtTimeNotification();
            // localNotifyManager.cancelAllNotification();
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
