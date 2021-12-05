import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_app/screens/login_screen.dart';
import 'package:smart_app/screens/splash_screen.dart';
import 'package:smart_app/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import './screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'risk_calculator.dart';
import 'home.dart';
import './widgets/signup/signup_step2.dart';
import 'package:smart_app/widgets/signup/signup_step3.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xFFf76a94),
        primaryColorLight: const Color(0xFFfce1e9),
        primaryColorDark: const Color(0xFFfc9fbb),
        scaffoldBackgroundColor: Colors.white,
      ),
      // initialRoute: WelcomeScreen.routeName,
      home: const SplashScreen(),
      // home: StreamBuilder(
      //   stream: FirebaseAuth.instance.authStateChanges(),
      //   builder: (ctx, userSnapshot) {
      //     if (userSnapshot.hasData) {
      //       return const homePage();
      //     }
      //     return const SplashScreen();
      //   },
      // ),
      routes: {
        WelcomeScreen.routeName: (ctx) => const WelcomeScreen(),
        SignupScreen.routeName: (ctx) => const SignupScreen(),
        FormStep2.routeName: (ctx) => const FormStep2(),
        ConfirmationStep.routeName: (ctx) => const ConfirmationStep(),
        LoginScreen.routeName: (ctx) => const LoginScreen(),
        RiskCalculator.routeName: (context) => const RiskCalculator(),
        homePage.routeName: (context) => const homePage(),
        // '/': (context) => const WelcomeScreen(),
      },
    );
  }
}
