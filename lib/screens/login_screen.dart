// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:wave/config.dart';
// import 'package:wave/wave.dart';
//
import 'package:smart_app/home.dart';
import 'package:smart_app/screens/signup_screen.dart';
import 'package:smart_app/widgets/already_have_an_account_acheck.dart';
import 'package:smart_app/widgets/rounded_button.dart';
import 'package:smart_app/widgets/rounded_input_field.dart';
import 'package:smart_app/widgets/rounded_password_field.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String? _userEmail;
  String? _userPassword;

  @override
  void initState() {
    super.initState();
    _userEmail = '';
    _userPassword = '';
  }

  void _trySubmit(
    String email,
    String password,
    bool isLogin,
    BuildContext ctx,
  ) async {
    try {
      // ignore: unused_local_variable
      UserCredential authResult;

      if (isLogin) {
        authResult = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        debugPrint(authResult.user!.uid);
        // authResult.user!.uid
        Navigator.pushReplacementNamed(context, homePage.routeName);
        debugPrint('USER LOGGED IN!');
      }
    } on PlatformException catch (err) {
      var message = 'An error occured, please check your credentials!';

      if (err.message != null) {
        message = err.message!;
      }

      Scaffold.of(ctx).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Theme.of(ctx).errorColor,
        ),
      );
    } catch (err) {
      debugPrint('$err');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).primaryColorDark,
              Theme.of(context).primaryColorLight
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // ignore: prefer_const_constructors
                SizedBox(height: size.height * .08),
                // const Text(
                //   "LOGIN",
                //   style: TextStyle(
                //     color: Color(0xFFf76a94),
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                SizedBox(height: size.height * 0.03),
                SvgPicture.asset(
                  "assets/icons/login_woman.svg",
                  height: size.height * 0.35,
                ),
                SizedBox(height: size.height * 0.03),
                RoundedInputField(
                  hintText: "Your Email",
                  onChanged: (value) {
                    setState(() {
                      _userEmail = value;
                    });
                  },
                ),
                RoundedPasswordField(
                  onChanged: (value) {
                    setState(() {
                      _userPassword = value;
                    });
                  },
                ),
                RoundedButton(
                  text: "LOGIN",
                  press: () {
                    _trySubmit(_userEmail!, _userPassword!, true, context);
                  },
                ),
                SizedBox(height: size.height * 0.03),
                AlreadyHaveAnAccountCheck(
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const SignupScreen();
                        },
                      ),
                    );
                  },
                ),

//                 SizedBox(
//                   height: 100,
//                   child: WaveWidget(
//                     config: CustomConfig(
//                       gradients: [
//                         [Color(0xFFffc36d), Color(0xFFfc7664)],
//                         [Color(0xFF1baaed), Color(0xFF0aeeb3)],
//                         [Color(0xFF41b0eb), Color(0xFF3457af)],
//                         [Color(0xFFea6fcb), Color(0xFF8f72ed)],
//                       ],
//                       durations: [35000, 19440, 10800, 6000],
//                       heightPercentages: [0.25, 0.26, 0.28, 0.31],
//                       gradientBegin: Alignment.bottomLeft,
//                       gradientEnd: Alignment.topRight,
//                     ),
// //                    backgroundColor: Colors.yellow,
//                     size: const Size(double.infinity, double.infinity),
//                     waveAmplitude: 0,
//                   ),
//                 ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
