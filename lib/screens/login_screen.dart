import 'package:flutter/material.dart';
import 'package:omicxvn/components/common/conditional_builder.dart';
import 'package:omicxvn/components/common/default_widget.dart';
import 'package:omicxvn/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  String errorMsg = '';
  bool isPassword = true;
  var isBusy = false;
  setBusy(bool isbusy) {
    if (mounted) {
      setState(() => isBusy = isbusy);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setBusy(true);
      await Future.delayed(const Duration(seconds: 1));
      setBusy(false);
      await Navigator.pushReplacementNamed(context, HomeScreen.routeName);
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
              Text(
                errorMsg,
                style: const TextStyle(
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
                          return 'Username cannot be empty';
                        }
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
              ConditionalBuilder(
                condition: !isBusy,
                builder: (context) => defautButton(
                  text: 'Login',
                  onclicked: () => moveToHome(context),
                ),
                fallback: (context) => const CircularProgressIndicator(),
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
