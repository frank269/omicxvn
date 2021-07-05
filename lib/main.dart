import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';
import 'package:omicxvn/notifiers/call_notifier.dart';
import 'package:omicxvn/notifiers/detail_notifier.dart';
import 'package:omicxvn/notifiers/posts_notifier.dart';
import 'package:omicxvn/notifiers/ticket_notifier.dart';
import 'package:omicxvn/screens/add_post_screen.dart';
import 'package:omicxvn/screens/detail_screen.dart';
import 'package:omicxvn/screens/dialpad_screen.dart';
import 'package:omicxvn/screens/home_screen.dart';
import 'package:omicxvn/screens/login_screen.dart';
import 'package:omicxvn/injection/injection.dart';
import 'package:omicxvn/screens/ticket_screen.dart';
import 'package:omicxvn/widgets/themes.dart';
import 'package:provider/provider.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

/// Create a [AndroidNotificationChannel] for heads up notifications
late AndroidNotificationChannel channel;

/// Initialize the [FlutterLocalNotificationsPlugin] package.
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

void main() async {
  configureDependencies(Environment.dev);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  if (!kIsWeb) {
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      'This channel is used for important notifications.', // description
      importance: Importance.high,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    /// Create an Android Notification Channel.
    ///
    /// We use this channel in the `AndroidManifest.xml` file to override the
    /// default FCM channel to enable heads up notifications.
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    /// Update the iOS foreground notification presentation options to allow
    /// heads up notifications.
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  var settings = await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: true,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('User granted permission');
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    print('User granted provisional permission');
  } else {
    print('User declined or has not accepted permission');
  }
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => PostsNotifier()),
      ChangeNotifierProvider(create: (context) => DetailNotifier()),
      ChangeNotifierProvider(create: (context) => CallNotifier()),
      ChangeNotifierProvider(create: (context) => TicketsNotifier())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Omicx App',
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.routeName,
      onGenerateRoute: (settings) {
        var routes = <String, WidgetBuilder>{
          LoginScreen.routeName: (context) => LoginScreen(),
          HomeScreen.routeName: (context) => const HomeScreen(title: 'Home'),
          AddPostScreen.routeName: (context) => AddPostScreen(),
          DetailScreen.routeName: (context) => DetailScreen(),
          DialPad.routeName: (context) => const DialPad(),
          TicketScreen.routeName: (context) => const TicketScreen(title: 'Quản lý ticket')
        };
        var builder = routes[settings.name] as WidgetBuilder;
        return MaterialPageRoute<dynamic>(
          builder: (ctx) => builder(ctx),
        );
      },
    );
  }
}
