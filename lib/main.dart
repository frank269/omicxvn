import 'package:flutter/material.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:injectable/injectable.dart';
import 'package:omicxvn/notifiers/posts_notifier.dart';
import 'package:omicxvn/screens/add_post_screen.dart';
import 'package:omicxvn/screens/home_screen.dart';
import 'package:omicxvn/screens/login_screen.dart';
import 'package:omicxvn/injection/injection.dart';
import 'package:omicxvn/widgets/themes.dart';
import 'package:provider/provider.dart';

void main() {
  configureDependencies(Environment.dev);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => PostsNotifier()),
    ],
    child: MyApp(),
  ));
}

void showBadge() async {
  if (await FlutterAppBadger.isAppBadgeSupported()) {
    FlutterAppBadger.updateBadgeCount(1);
  }
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
        };
        var builder = routes[settings.name] as WidgetBuilder;
        return MaterialPageRoute<dynamic>(
          builder: (ctx) => builder(ctx),
        );
      },
    );
  }
}
