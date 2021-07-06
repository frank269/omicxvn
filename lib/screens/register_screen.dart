import 'package:flutter/material.dart';
import 'package:omicxvn/components/common/conditional_builder.dart';
import 'package:omicxvn/components/common/default_widget.dart';
import 'package:omicxvn/notifiers/auth_provider.dart';
import 'package:omicxvn/notifiers/call_notifier.dart';
import 'package:omicxvn/screens/home_screen.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = '/register';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
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
      var _authProvider = Provider.of<AuthProvider>(context, listen: false);
      try {
        if (await _authProvider.signUpUser(
            emailController.text, passwordController.text)) {
          Provider.of<CallNotifier>(context, listen: false).register();
          await Navigator.pushReplacementNamed(context, HomeScreen.routeName);
        } else {
          setBusy(false);
          setState(() => errorMsg = 'User is exist, please login');
        }
      } catch (e) {
        print(e);
        setBusy(false);
        setState(() => errorMsg = e.toString());
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
              // Image.asset(
              //   'assets/images/welcome.png',
              //   fit: BoxFit.cover,
              //   width: 400,
              //   // height: 1000,
              // ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Đăng ký tài khoản',
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
                      controller: firstNameController,
                      type: TextInputType.emailAddress,
                      hintText: 'Enter your First Name',
                      text: 'First Name',
                      prefix: Icons.supervised_user_circle,
                      textInputAction: TextInputAction.next,
                      // border: true,
                      onEditingComplete: node.nextFocus,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'First Name cannot be empty';
                        }
                        return null;
                      },
                    ),
                    defaultFormField(
                      controller: lastNameController,
                      type: TextInputType.emailAddress,
                      hintText: 'Enter your Last Name',
                      text: 'Last Name',
                      prefix: Icons.card_giftcard,
                      textInputAction: TextInputAction.next,
                      // border: true,
                      onEditingComplete: node.nextFocus,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Last Name cannot be empty';
                        }
                        return null;
                      },
                    ),
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
                        } else if (!(value?.contains('@') ?? false)) {
                          return 'Email format is wrong!';
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
                  text: 'Register',
                  onclicked: () => moveToHome(context),
                ),
                fallback: (context) => const CircularProgressIndicator(),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: RichText(
                  text: const TextSpan(
                    text: 'Have an account?',
                    style: TextStyle(fontSize: 15.0, color: Colors.black),
                    children: [
                      TextSpan(
                        text: ' Login Now',
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
