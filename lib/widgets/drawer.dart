import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:omicxvn/screens/dialpad_screen.dart';
import 'package:omicxvn/screens/home_screen.dart';
import 'package:omicxvn/screens/login_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.blue,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                accountName: Text(
                  "admin",
                  textScaleFactor: 1.3,
                ),
                accountEmail: Text(
                  "admin@metechvn.com",
                ),
                currentAccountPicture: CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                      "https://img.icons8.com/bubbles/2x/user-male.png"),
                ),
              ),
            ),
            ListTile(
              onTap: () =>
                  Navigator.pushReplacementNamed(context, HomeScreen.routeName),
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text(
                "Home",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              onTap: null,
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text(
                "Profile",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              onTap: () =>
                  Navigator.pushReplacementNamed(context, DialPad.routeName),
              leading: Icon(
                CupertinoIcons.dial,
                color: Colors.white,
              ),
              title: Text(
                "Metech call",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              onTap: () => Navigator.pushReplacementNamed(
                  context, LoginScreen.routeName),
              leading: Icon(
                CupertinoIcons.square_arrow_left,
                color: Colors.white,
              ),
              title: Text(
                "Logout",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
