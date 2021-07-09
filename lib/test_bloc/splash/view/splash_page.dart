import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  static const routeName = '/splash';
  static Route route() {
    return MaterialPageRoute(builder: (_) => SplashPage());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
