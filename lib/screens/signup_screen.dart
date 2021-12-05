// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
//
import '../widgets/signup/signup_step1.dart';

class SignupScreen extends StatefulWidget {
  static const routeName = '/signup';
  const SignupScreen({
    Key? key,
    this.isLogin = false,
  }) : super(key: key);
  final bool isLogin;

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.isLogin ? FormStep1(isLogin: true) : FormStep1(),
    );
  }
}
