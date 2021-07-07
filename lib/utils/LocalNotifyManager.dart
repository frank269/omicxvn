// import 'dart:io' show Platform;
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:rxdart/subjects.dart';
// import 'package:timezone/data/latest.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;

// class LocalNotifyManager {
//   late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
//   late InitializationSettings initSetting;
//   BehaviorSubject<ReceiveNotification> get didReceiveNotificationSubject =>
//       BehaviorSubject();

//   LocalNotifyManager() {
//     tz.initializeTimeZones();
//     flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//     if (Platform.isIOS) {
//       requestIOSPermission();
//     }
//     initializePlatform();
//   }

//   requestIOSPermission() {
//     flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//             IOSFlutterLocalNotificationsPlugin>()
//         ?.requestPermissions(
//           alert: true,
//           badge: true,
//           sound: true,
//         );
//   }

//   initializePlatform() {
//     var initSettingAndroid = AndroidInitializationSettings(
//       'app_notification_icon',
//     );
//     var initSettingIOS = IOSInitializationSettings(
//       requestSoundPermission: true,
//       requestBadgePermission: true,
//       requestAlertPermission: true,
//       onDidReceiveLocalNotification: (id, title, body, payload) async {
//         var notification = ReceiveNotification(
//             title: title, body: body, payload: payload, id: id);
//         didReceiveNotificationSubject.add(notification);
//       },
//     );
//     initSetting = InitializationSettings(
//         android: initSettingAndroid, iOS: initSettingIOS);
//   }

//   setOnNotificationReceive(Function onNotificationReceive) {
//     didReceiveNotificationSubject.listen((notification) {
//       onNotificationReceive(notification);
//     });
//   }

//   setOnNotificationClick(Function onNotificationClick) async {
//     await flutterLocalNotificationsPlugin.initialize(initSetting,
//         onSelectNotification: (payload) async {
//       onNotificationClick(payload);
//     });
//   }

//   Future<void> showNotification() async {
//     var androidChannel = AndroidNotificationDetails(
//       'high_importance_channel', // id
//       'High Importance Notifications', // title
//       'This channel is used for important notifications.', // description
//       importance: Importance.max,
//       priority: Priority.high,
//       playSound: true,
//       // sound: const RawResourceAndroidNotificationSound('notification_sound'),
//       // icon: 'icon_notification_replace',
//       // largeIcon:
//       //const DrawableResourceAndroidBitmap('icon_large_notification'),
//       // timeoutAfter: 5000,
//       enableLights: true,
//     );

//     var iosChannel = IOSNotificationDetails(
//         // sound: 'notification_sound.mp3',
//         );
//     var platformChannel =
//         NotificationDetails(android: androidChannel, iOS: iosChannel);
//     await flutterLocalNotificationsPlugin.show(
//       0,
//       'test title',
//       'test body',
//       platformChannel,
//       payload: 'new payload',
//     );
//   }

//   Future<void> scheduleNotification(int second) async {
//     var scheduleNotificationDateTime =
//         tz.TZDateTime.now(tz.local).add(Duration(seconds: second));
//     var androidChannel = AndroidNotificationDetails(
//       'high_importance_channel', // id
//       'High Importance Notifications', // title
//       'This channel is used for important notifications.', // description
//       importance: Importance.max,
//       priority: Priority.high,
//       playSound: true,
//       // sound: const RawResourceAndroidNotificationSound('notification_sound'),
//       // icon: 'icon_notification_replace',
//       // largeIcon:
//       //const DrawableResourceAndroidBitmap('icon_large_notification'),
//       // timeoutAfter: 5000,
//       enableLights: true,
//       fullScreenIntent: true,
//     );

//     var iosChannel = IOSNotificationDetails(
//         // sound: 'a_long_cold_sting.wav',
//         // presentAlert: true,
//         // presentBadge: true,
//         // presentSound: true
//         );
//     var platformChannel =
//         NotificationDetails(android: androidChannel, iOS: iosChannel);
//     await flutterLocalNotificationsPlugin.zonedSchedule(
//       0,
//       'schedule title',
//       'schedule body',
//       scheduleNotificationDateTime,
//       platformChannel,
//       androidAllowWhileIdle: true,
//       uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.absoluteTime,
//       payload: 'new payload',
//     );
//   }

//   Future<void> repeatNotification() async {
//     var androidChannel = AndroidNotificationDetails(
//       'high_importance_channel', // id
//       'High Importance Notifications', // title
//       'This channel is used for important notifications.', // description
//       importance: Importance.max,
//       priority: Priority.high,
//       playSound: true,
//       // sound: const RawResourceAndroidNotificationSound('notification_sound'),
//       // icon: 'icon_notification_replace',
//       // largeIcon:
//       //const DrawableResourceAndroidBitmap('icon_large_notification'),
//       timeoutAfter: 5000,
//       enableLights: true,
//     );

//     var iosChannel = IOSNotificationDetails(
//         // sound: 'a_long_cold_sting.wav',
//         // presentAlert: true,
//         // presentBadge: true,
//         // presentSound: true
//         );
//     var platformChannel =
//         NotificationDetails(android: androidChannel, iOS: iosChannel);
//     await flutterLocalNotificationsPlugin.periodicallyShow(
//       0,
//       'repeat title',
//       'repeat body',
//       RepeatInterval.everyMinute,
//       platformChannel,
//       androidAllowWhileIdle: true,
//       payload: 'new payload',
//     );
//   }

//   Future<void> showDailyAtTimeNotification() async {
//     var androidChannel = AndroidNotificationDetails(
//       'high_importance_channel', // id
//       'High Importance Notifications', // title
//       'This channel is used for important notifications.', // description
//       importance: Importance.max,
//       priority: Priority.high,
//       playSound: true,
//       // sound: const RawResourceAndroidNotificationSound('notification_sound'),
//       // icon: 'icon_notification_replace',
//       // largeIcon:
//       //const DrawableResourceAndroidBitmap('icon_large_notification'),
//       timeoutAfter: 5000,
//       enableLights: true,
//     );

//     var iosChannel = IOSNotificationDetails(
//         // sound: 'a_long_cold_sting.wav',
//         // presentAlert: true,
//         // presentBadge: true,
//         // presentSound: true
//         );
//     var platformChannel =
//         NotificationDetails(android: androidChannel, iOS: iosChannel);
//     var scheduleNotificationDateTime =
//         tz.TZDateTime.now(tz.local).add(Duration(seconds: 5));
//     await flutterLocalNotificationsPlugin.zonedSchedule(
//       0,
//       'repeat daily title',
//       'repeat daily body',
//       scheduleNotificationDateTime,
//       platformChannel,
//       androidAllowWhileIdle: true,
//       uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.absoluteTime,
//       matchDateTimeComponents: DateTimeComponents.time,
//       payload: 'new payload',
//     );
//   }

//   void cancelAllNotification() async {
//     await flutterLocalNotificationsPlugin.cancelAll();
//   }
// }

// class ReceiveNotification {
//   final int id;
//   final String? title;
//   final String? body;
//   final String? payload;
//   ReceiveNotification({
//     required this.id,
//     this.title,
//     this.body,
//     this.payload,
//   });
// }
