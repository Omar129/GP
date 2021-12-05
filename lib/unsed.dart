/// STEP 1 - 

// Future _getUserData() async {
  //   DocumentReference docRef = FirebaseFirestore.instance
  //       .collection("users")
  //       .doc('gugdIc6HqEW71Qes3eaPGoA8EJU2');
  //   DocumentSnapshot docSnap = await docRef.get();
  //   var data = docSnap.data() as Map<String, dynamic>;

  //   setState(() {
  //     _userName = data['username'];
  //     _userEmail = data['email'];
  //     _userPassword = '';
  //     _userMobileNo;
  //     _userAddress = '';
  //     _userAge = '';
  //     _userRelationshipStatus = '';
  //   });
  // }

  
  // void _trySubmit() {
  //   final isValid = _formKey.currentState!.validate();
  //   FocusScope.of(context).unfocus();

  //   if (isValid) {
  //     _formKey.currentState!.save();
  //     print('VALID');
  //     // widget.submitFn(
  //     //   _userEmail.trim(),
  //     //   _userPassword.trim(),
  //     //   _userName.trim(),
  //     //   _userMobileNo.trim(),
  //     //   _userAddress.trim(),
  //     //   _userAge.trim(),
  //     //   _userRelationshipStatus.trim(),
  //     //   _isLogin,
  //     //   context,
  //     // );
  //   }
  // }


    // if (widget.isLogin) {
    //   return TextFormField(
    //     key: const ValueKey('email'),
    //     validator: (value) {
    //       if (value!.isEmpty || !value.contains('@')) {
    //         return 'Please Enter a valid email address.';
    //       }
    //       return null;
    //     },
    //     onChanged: (value) {
    //       setState(() {
    //         _userEmail = value;
    //       });
    //     },
    //   );
    // }


  ////////////////////////////////// Signup - /////////////////////////////////
  /// 
  ///   // final _auth = FirebaseAuth.instance;

  // void _submitAuthForm(
  //   String email,
  //   String password,
  //   String username,
  //   String mobileNo,
  //   String address,
  //   String age,
  //   String relationshipStatus,
  //   bool isLogin,
  //   BuildContext ctx,
  // ) async {
  //   UserCredential authResult;
  //   try {
  //     setState(() {
  //       _isLoading = true;
  //     });
  //     authResult = await _auth.createUserWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //     await FirebaseFirestore.instance
  //         .collection('users')
  //         .doc(authResult.user!.uid)
  //         .set({
  //       'username': username,
  //       'email': email,
  //       'mobileNo': mobileNo,
  //       'address': address,
  //       'age': age,
  //       'relationshipStatus': relationshipStatus,
  //     });
  //     // setState(() {
  //     //   _userID = authResult.user!.uid;
  //     // });
  //     // ignore: avoid_print
  //     print('USER CREATED!');
  //   } on PlatformException catch (err) {
  //     var message = 'An error occured, please check your credentials!';

  //     if (err.message != null) {
  //       message = err.message!;
  //     }

  //     Scaffold.of(ctx).showSnackBar(
  //       SnackBar(
  //         content: Text(message),
  //         backgroundColor: Theme.of(ctx).errorColor,
  //       ),
  //     );

  //     setState(() {
  //       _isLoading = false;
  //     });
  //   } catch (err) {
  //     setState(() {
  //       _isLoading = false;
  //     });
  //   }
  // }



// .replaceAll('[', '')
// .replaceAll(']', '')
// .split(','),


// Text('Username: ${widget.name}'),
// Text('Email: ${widget.email}'),
// Text('Age: ${widget.age}'),
// Text('Mobile Number: ${widget.mobile}'),
// Text('Relationship: ${widget.relationship}'),
// Text('Address: ${widget.address}'),
// Text('Medications: ${widget.medications}'),
// Text('Allergies: ${widget.allergies}'),
// Text('Problems: ${widget.problems}'),
