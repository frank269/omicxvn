import 'package:flutter/material.dart';
import 'package:omicxvn/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  static final String routeName = "/login";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String username = "";
  String password = "";
  String errorMsg = "";
  var isBusy = false;
  setBusy(bool isbusy) {
    if (this.mounted) {
      setState(() => isBusy = isbusy);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
    setBusy(true);
    await Future.delayed(Duration(seconds: 1));
    setBusy(false);
    Navigator.pushReplacementNamed(context, HomeScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Image.asset(
                "assets/images/welcome.png",
                fit: BoxFit.cover,
                width: 400,
                // height: 1000,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Omicx Mobile App",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                errorMsg,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.red,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Enter Username", labelText: "UserName"),
                      onChanged: (value) {
                        username = value;
                        // setState(() {});
                      },
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () => node.nextFocus(),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return "Username cannot be empty";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      textInputAction: TextInputAction.done,
                      onEditingComplete: () => node.unfocus(),
                      decoration: InputDecoration(
                          hintText: "Enter Password", labelText: "Password"),
                      onChanged: (value) {
                        password = value;
                      },
                      onFieldSubmitted: (value) => moveToHome(context),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return "Password cannot be empty";
                        } else if ((value?.length ?? 0) < 6) {
                          return "Password length should be atleast 6";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              isBusy
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () => moveToHome(context),
                      style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                      child: Text("Login")),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
