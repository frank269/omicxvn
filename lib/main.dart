import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:omicxvn/notifiers/auth_notifier.dart';
import 'package:omicxvn/notifiers/call_notifier.dart';
import 'package:omicxvn/notifiers/detail_notifier.dart';
import 'package:omicxvn/notifiers/posts_notifier.dart';
import 'package:omicxvn/notifiers/ticket/ticket_notifier.dart';
import 'package:omicxvn/screens/add_post_screen.dart';
import 'package:omicxvn/screens/detail_screen.dart';
import 'package:omicxvn/screens/dialpad_screen.dart';
import 'package:omicxvn/screens/home_screen.dart';
import 'package:omicxvn/screens/login_screen.dart';
import 'package:omicxvn/injection/injection.dart';
import 'package:omicxvn/screens/register_screen.dart';
import 'package:omicxvn/screens/test_notification_screen.dart';
import 'package:omicxvn/screens/ticket/ticket_detail_screen.dart';
import 'package:omicxvn/screens/ticket/ticket_screen.dart';
import 'package:omicxvn/utils/FirebaseManager.dart';
import 'package:omicxvn/widgets/themes.dart';
import 'package:provider/provider.dart';
import 'package:workmanager/workmanager.dart';

import 'notifiers/auth_provider.dart';

void main() async {
  configureDependencies(Environment.dev);
  WidgetsFlutterBinding.ensureInitialized();
  await configureFirebase();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => PostsNotifier()),
      ChangeNotifierProvider(create: (context) => DetailNotifier()),
      ChangeNotifierProvider(create: (context) => CallNotifier()),
      ChangeNotifierProvider(create: (context) => AuthProvider()),
      ChangeNotifierProvider(create: (context) => TicketsNotifier()),
      ChangeNotifierProvider(create: (context) => AuthNotifier()),
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
          RegisterScreen.routeName: (context) => RegisterScreen(),
          DialPad.routeName: (context) => DialPad(),
          NotificationScreen.routeName: (context) => const NotificationScreen(),
          TicketScreen.routeName: (context) =>
              const TicketScreen(title: 'Quản lý ticket'),
          TicketDetailScreen.routeName: (context) => const TicketDetailScreen()
        };
        var builder = routes[settings.name] as WidgetBuilder;
        return MaterialPageRoute<dynamic>(
          builder: (ctx) => builder(ctx),
        );
      },
    );
  }
}
