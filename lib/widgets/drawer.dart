import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:omicxvn/screens/home_screen.dart';
import 'package:omicxvn/screens/login_screen.dart';
import 'package:omicxvn/screens/ticket_screen.dart';

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
              onTap: () => Navigator.pushReplacementNamed(
                  context, HomeScreen.routeName),
              leading: Icon(
                Icons.dashboard,
                color: Colors.white,
              ),
              title: Text(
                "Dashboard",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              onTap: null,
              leading: Icon(
                Icons.perm_phone_msg,
                color: Colors.white,
              ),
              title: Text(
                "Lịch sử cuộc gọi",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              onTap: null,
              leading: Icon(
                Icons.contact_phone,
                color: Colors.white,
              ),
              title: Text(
                "Danh sách khách hàng",
                textScaleFactor: 1.2,
                style: TextStyle(
                    color: Colors.white
                ),
              ),
            ),
            ListTile(
              onTap: () => Navigator.pushReplacementNamed(
                  context, TicketScreen.routeName),
              leading: Icon(
                Icons.credit_card,
                color: Colors.white,
              ),
              title: Text(
                "Quản lý ticket",
                textScaleFactor: 1.2,
                style: TextStyle(
                    color: Colors.white
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
                "Thông tin cá nhân",
                textScaleFactor: 1.2,
                style: TextStyle(
                    color: Colors.white
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
