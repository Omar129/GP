// ignore_for_file: deprecated_member_use
import 'package:smart_app/screens/login_screen.dart';
import 'package:smart_app/widgets/home_wave.dart';

import '../screens/signup_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  static const routeName = '/welcome';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[200],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Welcome Screen'),
          RaisedButton(
            onPressed: () =>
                Navigator.pushNamed(context, SignupScreen.routeName),
            child: const Text('Signup'),
          ),
          RaisedButton(
            onPressed: () =>
                Navigator.pushNamed(context, LoginScreen.routeName),
            child: const Text('Sign-in'),
          ),
          CustomPaint(
            painter: CurvePainter(),
            child: Container(),
          ),
        ],
      ),
    );
  }
}
