import 'package:flutter/material.dart';
import 'package:omicxvn/components/common/conditional_builder.dart';
import 'package:omicxvn/components/common/default_widget.dart';
import 'package:omicxvn/notifiers/auth_notifier.dart';
import 'package:omicxvn/notifiers/auth_provider.dart';
import 'package:omicxvn/notifiers/call_notifier.dart';
import 'package:omicxvn/screens/home_screen.dart';
import 'package:omicxvn/screens/register_screen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool isPassword = true;

  @override
  void initState() {
    emailController.text = 'diemlt';
    passwordController.text = '123456aA@';
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      // var _authProvider = Provider.of<AuthProvider>(context, listen: false);
      var _authProvider = Provider.of<AuthNotifier>(context, listen: false);
      try {
        // if (await _authProvider.loginUser(
        //     emailController.text, passwordController.text)) {
        if (await _authProvider.login(
                emailController.text, passwordController.text) ==
            AuthState.success) {
          // Provider.of<CallNotifier>(context, listen: false).register();
          await Navigator.pushReplacementNamed(context, HomeScreen.routeName);
        }
      } catch (e) {
        print(e);
      }
    }
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
              const SizedBox(
                height: 40,
              ),
              Image.asset(
                'assets/images/welcome.png',
                fit: BoxFit.cover,
                width: 400,
                // height: 1000,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Omicx Mobile App',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              const SizedBox(
                height: 20,
              ),
              Consumer<AuthNotifier>(
                builder: (context, auth, child) =>
                    auth.authState == AuthState.failed
                        ? Text(
                            "UserName or Password is incorrect!",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.red,
                            ),
                          )
                        : Container(),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                child: Column(
                  children: [
                    defaultFormField(
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      hintText: 'Enter your email',
                      text: 'Email',
                      prefix: Icons.email,
                      textInputAction: TextInputAction.next,
                      // border: true,
                      onEditingComplete: node.nextFocus,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Email cannot be empty';
                        }
                        // else if (!(value?.contains('@') ?? false)) {
                        //   return 'Email format is wrong!';
                        // }
                        return null;
                      },
                    ),
                    defaultFormField(
                      controller: passwordController,
                      type: TextInputType.emailAddress,
                      hintText: 'Enter your password',
                      text: 'Password',
                      prefix: Icons.lock,
                      suffix:
                          isPassword ? Icons.visibility : Icons.visibility_off,
                      onSuffixPressed: () => setState(() => {
                            isPassword = !isPassword,
                          }),
                      textInputAction: TextInputAction.done,
                      // border: true,
                      isPassword: isPassword,
                      onEditingComplete: node.unfocus,
                      onSubmit: (value) => moveToHome(context),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Password cannot be empty';
                        } else if ((value?.length ?? 0) < 6) {
                          return 'Password length should be atleast 6';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              defautButton(
                text: 'Login',
                onclicked: () => moveToHome(context),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RegisterScreen.routeName);
                },
                child: RichText(
                  text: const TextSpan(
                    text: "Don't have an account?",
                    style: TextStyle(fontSize: 15.0, color: Colors.black),
                    children: [
                      TextSpan(
                        text: ' Register Now',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
