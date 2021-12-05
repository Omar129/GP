// ignore_for_file: deprecated_member_use
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:animated_card/animated_card.dart';
//
import 'package:smart_app/home.dart';
import 'package:smart_app/widgets/signup/signup_step2.dart';
import 'package:smart_app/widgets/step_progress.dart';

class ConfirmationStep extends StatefulWidget {
  final String name;
  final String email;
  final String password;
  final String age;
  final String mobile;
  final String relationship;
  final String address;
  final List<dynamic> medications;
  final List<dynamic> problems;
  final List<dynamic> allergies;

  const ConfirmationStep({
    Key? key,
    this.name = '',
    this.email = '',
    this.password = '',
    this.age = '',
    this.mobile = '',
    this.relationship = '',
    this.address = '',
    this.medications = const [],
    this.problems = const [],
    this.allergies = const [],
  }) : super(key: key);
  static const routeName = '/step3';

  @override
  _ConfirmationStepState createState() => _ConfirmationStepState();
}

class _ConfirmationStepState extends State<ConfirmationStep> {
  final _auth = FirebaseAuth.instance;
  void _trySubmit(
      String email,
      String password,
      String username,
      String mobileNo,
      String address,
      String age,
      String relationshipStatus,
      bool isLogin,
      BuildContext ctx,
      var medications,
      var allergies,
      var problems) async {
    UserCredential authResult;
    try {
      authResult = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await FirebaseFirestore.instance
          .collection('users')
          .doc(authResult.user!.uid)
          .set({
        'username': username,
        'email': email,
        'mobileNo': mobileNo,
        'address': address,
        'age': age,
        'password': password,
        'relationshipStatus': relationshipStatus,
        'history': {
          'allergies': medications,
          'medications': allergies,
          'problems': problems,
        }
      });
      // authResult.user!.uid
      Navigator.pushReplacementNamed(context, homePage.routeName);
      debugPrint('USER CREATED!');
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
      // ignore: avoid_print
      print(err);
    }
  }

  Widget _renderTwoNavigatorBtns(Size size) {
    return SizedBox(
      width: size.width * .9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RaisedButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FormStep2(
                    name: widget.name,
                    email: widget.email,
                    password: widget.password,
                    age: widget.age,
                    mobile: widget.mobile,
                    relationship: widget.relationship,
                    address: widget.address,
                    medications: widget.medications,
                    allergies: widget.allergies,
                    problems: widget.problems,
                  ),
                )),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
              side: BorderSide(color: Theme.of(context).primaryColorLight),
            ),
            color: Theme.of(context).primaryColorLight,
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      Icons.arrow_back,
                      color: Theme.of(context).primaryColor,
                    ),
                    Text(
                      'Previous',
                      style: TextStyle(
                        fontSize: 15,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          RaisedButton(
            onPressed: () {
              _trySubmit(
                widget.email,
                widget.password,
                widget.name,
                widget.mobile,
                widget.address,
                widget.age,
                widget.relationship,
                true,
                context,
                widget.medications,
                widget.allergies,
                widget.problems,
              );
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
              side: BorderSide(color: Theme.of(context).primaryColor),
            ),
            color: Theme.of(context).primaryColor,
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                    Text(
                      'Next',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderCard(String text, Size size) {
    return AnimatedCard(
      direction: AnimatedCardDirection.left, //Initial animation direction
      initDelay: const Duration(milliseconds: 1), //Delay to initial animation
      duration: const Duration(seconds: 1), //Initial animation duration
      curve: Curves.bounceOut, //Animation curve
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Card(
          color: Theme.of(context).primaryColorLight,
          elevation: 10,
          child: ListTile(
            title: SizedBox(
              height: size.height * .05,
              child: Center(
                  child: Text(
                text,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w700,
                ),
              )),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * .05),
            Text(
              'Confirmation',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Theme.of(context).primaryColor),
            ),
            SizedBox(height: size.height * .02),
            const StepProgress(currentStep: 3),
            SizedBox(height: size.height * .02),
            SvgPicture.asset(
              "assets/icons/confirmed_woman.svg",
              height: size.height * 0.3,
            ),
            SizedBox(height: size.height * .01),
            Text(
              'Personal Info',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Theme.of(context).primaryColor),
            ),
            _renderCard('Username: ${widget.name}', size),
            _renderCard('Email: ${widget.email}', size),
            _renderCard('Age: ${widget.age}', size),
            _renderCard('Mobile Number: ${widget.mobile}', size),
            _renderCard('Relationship: ${widget.relationship}', size),
            _renderCard('Address: ${widget.address}', size),
            SizedBox(height: size.height * .02),
            Text(
              'Medical Info',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Theme.of(context).primaryColor),
            ),
            _renderCard('Medications: ${widget.medications}', size),
            _renderCard('Allergies: ${widget.allergies}', size),
            _renderCard('Problems: ${widget.problems}', size),
            SizedBox(height: size.height * .02),

            // TWO BOTTOM BUTTONS
            _renderTwoNavigatorBtns(size),
            SizedBox(height: size.height * .02),
          ],
        ),
      ),
    );
  }
}
