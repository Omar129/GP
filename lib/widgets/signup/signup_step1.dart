// ignore_for_file: deprecated_member_use, must_be_immutable
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:flutter/foundation.dart';
//
import './signup_step2.dart';

class FormStep1 extends StatefulWidget {
  String name;
  final String email;
  final String password;
  final String age;
  final String mobile;
  final String relationship;
  final String address;
  final List<dynamic> medications;
  final List<dynamic> problems;
  final List<dynamic> allergies;
  FocusNode userNameFocusNode = FocusNode();
  FocusNode userPasswordFocusNode = FocusNode();
  FocusNode userEmailFocusNode = FocusNode();
  FocusNode userMobileFocusNode = FocusNode();
  FocusNode userAgeFocusNode = FocusNode();
  FocusNode userRelationFocusNode = FocusNode();
  FocusNode userAddressFocusNode = FocusNode();

  FormStep1({
    Key? key,
    this.isLogin = false,
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
  static const routeName = '/step1';
  final bool isLogin;

  @override
  State<FormStep1> createState() => _FormStep1State();
}

class _FormStep1State extends State<FormStep1> {
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;
  var _userEmail = '';
  var _userName = '';
  var _userPassword = '';
  var _userMobileNo = '';
  var _userAddress = '';
  var _userAge = '';
  var _userRelationshipStatus = '';

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
    if (widget.isLogin == true) {
      setState(() {
        _userName = widget.name;
        _userEmail = widget.email;
        _userPassword = widget.password;
        _userMobileNo = widget.mobile;
        _userAddress = widget.address;
        _userAge = widget.age;
        _userRelationshipStatus = widget.relationship;
      });
    }
  }

  // render input field ==> to avoid code repeatition
  Widget _renderInputField(
      String labelText, String hintText, BuildContext ctx) {
    Size size = MediaQuery.of(context).size;
    if (labelText == 'Full Name') {
      return SizedBox(
        width: size.width * 0.90,
        child: TextFormField(
          key: const ValueKey('username'),
          validator: (value) {
            if (value!.isEmpty || value.length < 4) {
              return 'Username must be at least 4 characters long.';
            }
            return null;
          },
          // controller: widget.isLogin ? controller : inputVal,
          initialValue: widget.isLogin ? _userName : '',
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).primaryColorDark,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
              ),
            ),
            labelText: labelText,
            hintText: hintText,
            labelStyle: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
          ),
          onChanged: (value) {
            setState(() {
              _userName = value;
              widget.name = value;
            });
          },
        ),
      );
    }
    if (labelText == 'Age') {
      return SizedBox(
        width: size.width * 0.90,
        child: TextFormField(
          keyboardType: TextInputType.number,
          key: const ValueKey('age'),
          validator: (value) {
            if (value!.isEmpty ||
                (double.parse(value) < 20 || double.parse(value) > 100)) {
              return 'Please Enter a valid age (between 20 and 100).';
            }
            return null;
          },
          initialValue: widget.isLogin ? _userAge : '',
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).primaryColorDark,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
              ),
            ),
            labelText: labelText,
            hintText: hintText,
            labelStyle: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
          ),
          onChanged: (value) {
            setState(() {
              _userAge = value;
            });
          },
        ),
      );
    }
    if (labelText == 'Address') {
      return SizedBox(
        width: size.width * 0.90,
        child: TextFormField(
          key: const ValueKey('address'),
          validator: (value) {
            if (value!.isEmpty || value.length < 4) {
              return 'Please Enter a valid address.';
            }
            return null;
          },
          initialValue: widget.isLogin ? _userAddress : '',
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).primaryColorDark,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
              ),
            ),
            labelText: labelText,
            hintText: hintText,
            labelStyle: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
          ),
          onChanged: (value) {
            setState(() {
              _userAddress = value;
            });
          },
        ),
      );
    }
    if (labelText == 'Relationship Status') {
      return SizedBox(
        width: size.width * 0.90,
        child: TextFormField(
          key: const ValueKey('relationshipStatus'),
          initialValue: widget.isLogin ? _userRelationshipStatus : '',
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).primaryColorDark,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
              ),
            ),
            labelText: labelText,
            hintText: hintText,
            labelStyle: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
          ),
          onChanged: (value) {
            setState(() {
              _userRelationshipStatus = value;
            });
          },
        ),
      );
    }
    if (labelText == 'Mobile Number') {
      return SizedBox(
        width: size.width * 0.90,
        child: IntlPhoneField(
          initialValue:
              widget.isLogin ? _userMobileNo.toString().substring(3) : '',
          initialCountryCode: 'EG',
          countryCodeTextColor: Theme.of(context).primaryColor,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).primaryColorDark,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
              ),
            ),
            labelText: labelText,
            hintText: hintText,
            labelStyle: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
          ),
          onChanged: (value) {
            setState(() {
              _userMobileNo = value.completeNumber;
            });
          },
        ),
      );
    }
    if (labelText == 'Password') {
      return SizedBox(
        key: const ValueKey('password'),
        width: size.width * 0.90,
        child: TextFormField(
          initialValue: widget.isLogin ? _userPassword : '',
          validator: (value) {
            if (value!.isEmpty || value.length < 8) {
              return 'Password must be at least 8 characters long.';
            }
            return null;
          },
          keyboardType: TextInputType.text,
          obscureText: !_passwordVisible, //This will obscure text dynamically
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).primaryColorDark,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
              ),
            ),
            labelText: labelText,
            hintText: hintText,
            labelStyle: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
            // Here is key idea
            suffixIcon: IconButton(
              icon: Icon(
                // Based on passwordVisible state choose the icon
                _passwordVisible ? Icons.visibility : Icons.visibility_off,
                color: Theme.of(context).primaryColorDark,
              ),
              onPressed: () {
                // Update the state i.e. toogle the state of passwordVisible variable
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
            ),
          ),
          onChanged: (value) {
            setState(() {
              _userPassword = value;
            });
          },
          // onSaved: (value) {
          //   _userPassword = value!;
          // },
        ),
      );
    }
    if (labelText == 'Email') {
      return SizedBox(
        width: size.width * 0.90,
        child: TextFormField(
          key: const ValueKey('email'),
          initialValue: widget.isLogin ? _userEmail : '',
          validator: (value) {
            if (value!.isEmpty || !value.contains('@')) {
              return 'Please Enter a valid email address.';
            }
            return null;
          },
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).primaryColorDark,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
              ),
            ),
            labelText: labelText,
            hintText: hintText,
            labelStyle: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
          ),
          onChanged: (value) {
            setState(() {
              _userEmail = value;
            });
          },
        ),
      );
    }
    return const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      // backgroundColor: const Color(0xFF3f3d56),
      // ignore: sized_box_for_whitespace
      body: Container(
        height: double.infinity,
        // decoration: const BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment.topCenter,
        //     end: Alignment.bottomCenter,
        //     colors: [
        //       Color(0xFF3f3d56),
        //       Color(0xFF3f3d56),
        //       // Color(0xFF585675),
        //     ],
        //   ),
        // ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: size.height * .05),
              // SvgPicture.asset(
              //   "assets/icons/login_woman.svg",
              //   height: size.height * 0.35,
              // ),
              Text(
                'Personal Information',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Theme.of(context).primaryColor),
              ),
              SizedBox(height: size.height * .02),
              StepProgressIndicator(
                totalSteps: 3,
                currentStep: 1,
                size: 12,
                padding: 8,
                roundedEdges: const Radius.circular(10),
                selectedColor: Theme.of(context).primaryColor,
                // Theme.of(context).primaryColorLight
                unselectedColor: Theme.of(context).primaryColorLight,
              ),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: size.height * .02),
                    _renderInputField(
                        'Full Name', 'i.e. Sarah Mohamed Mahmoud', context),
                    SizedBox(height: size.height * .01),
                    _renderInputField('Age', 'i.e. 45', context),
                    SizedBox(height: size.height * .01),
                    _renderInputField(
                        'Address', 'i.e. Al-Haram, Giza', context),
                    SizedBox(height: size.height * .01),
                    _renderInputField('Mobile Number', '10111111111', context),
                    SizedBox(height: size.height * .005),
                    _renderInputField(
                        'Relationship Status', 'Married', context),
                    SizedBox(height: size.height * .01),
                    _renderInputField('Email', 'example@example.com', context),
                    SizedBox(height: size.height * .01),
                    _renderInputField(
                        'Password', 'Enter your password', context),
                    SizedBox(height: size.height * .03),

                    // Two Bottom Buttons
                  ],
                ),
              ),
              SizedBox(
                width: size.width * .90,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RaisedButton(
                      onPressed: () => Navigator.pushNamed(context, '/'),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        side: BorderSide(
                            color: Theme.of(context).primaryColorLight),
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
                                'Back',
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FormStep2(
                                name: _userName,
                                email: _userEmail,
                                password: _userPassword,
                                age: _userAge,
                                mobile: _userMobileNo,
                                relationship: _userRelationshipStatus,
                                address: _userAddress,
                                medications: widget.medications,
                                allergies: widget.allergies,
                                problems: widget.problems,
                              ),
                            ));
                        // final isValid = _formKey.currentState!.validate();
                        // debugPrint('$isValid');
                        // if (isValid) {
                        //   Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //         builder: (context) => FormStep2(
                        //           name: _userName,
                        //           email: _userEmail,
                        //           password: _userPassword,
                        //           age: _userAge,
                        //           mobile: _userMobileNo,
                        //           relationship: _userRelationshipStatus,
                        //           address: _userAddress,
                        //           medications: widget.medications,
                        //           allergies: widget.allergies,
                        //           problems: widget.problems,
                        //         ),
                        //       ));
                        // }
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
                              Text(
                                'Continue',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * .02),
            ],
          ),
        ),
      ),
    );
  }
}
