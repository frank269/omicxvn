import 'package:flutter/material.dart';
import 'package:omicxvn/notifiers/PostsNotifier.dart';
import 'package:omicxvn/screens/add_post_screen.dart';
import 'package:omicxvn/screens/home_screen.dart';
import 'package:omicxvn/screens/login_screen.dart';
import 'package:omicxvn/services/injection.dart';
import 'package:omicxvn/widgets/themes.dart';
import 'package:provider/provider.dart';

void main() async {
  await configureDependencies();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => PostsNotifier()),
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
          HomeScreen.routeName: (context) => HomeScreen(title: "Home"),
          AddPostScreen.routeName: (context) => AddPostScreen(),
        };
        WidgetBuilder builder = routes[settings.name] as WidgetBuilder;
        return MaterialPageRoute(builder: (ctx) => builder(ctx));
      },
    );
  }
}
