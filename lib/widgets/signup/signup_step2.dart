// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
//
import 'package:smart_app/widgets/signup/signup_step1.dart';
import 'package:smart_app/widgets/signup/signup_step3.dart';
import 'package:smart_app/widgets/step_progress.dart';

class FormStep2 extends StatefulWidget {
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

  const FormStep2({
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
  static const routeName = '/step2';

  @override
  State<FormStep2> createState() => _FormStep2State();
}

class _FormStep2State extends State<FormStep2> {
  final _formKey = GlobalKey<FormState>();

  //
  final List<dynamic>? _allergiesData = const [
    {
      "display": "Type I reaction (IgE-mediated)",
      "value": "Type I reaction (IgE-mediated)",
    },
    {
      "display": "Type II reaction (cytotoxic)",
      "value": "Type II reaction (cytotoxic)",
    },
    {
      "display": "Type III reaction (immune complex)",
      "value": "Type III reaction (immune complex)",
    },
    {
      "display": "Type IV reaction (delayed, cell-mediated)",
      "value": "Type IV reaction (delayed, cell-mediated)",
    },
    {
      "display": "Specific T-cell activation",
      "value": "Specific T-cell activation",
    },
    {
      "display": "Fas/Fas ligand-induced apoptosis",
      "value": "Fas/Fas ligand-induced apoptosis",
    },
  ];
  final List<dynamic>? _problemsData = const [
    {
      "display": "High Blood Pressure",
      "value": "High Blood Pressure",
    },
    {
      "display": "Irregular Heart Rythm",
      "value": "Irregular Heart Rythm",
    },
    {
      "display": "Diabetes",
      "value": "Diabetes",
    },
    {
      "display": "Heart Attack",
      "value": "Heart Attack",
    },
    {
      "display": "Stroke",
      "value": "Stroke",
    },
    {
      "display": "Thyroid Problems",
      "value": "Thyroid Problems",
    },
  ];
  final List<dynamic>? _medicationsData = const [
    {
      "display":
          "taxanes (docetaxel, paclitaxel, and protein-bound paclitaxel)",
      "value": "taxanes (docetaxel, paclitaxel, and protein-bound paclitaxel)",
    },
    {
      "display": "platinum agents (carboplatin, cisplatin)",
      "value": "platinum agents (carboplatin, cisplatin)",
    },
    {
      "display": "vinorelbine",
      "value": "vinorelbine",
    },
    {
      "display": "eribulin",
      "value": "eribulin",
    },
    {
      "display": "ixabepilone",
      "value": "ixabepilone",
    },
  ];
  //
  List? _myAllergies;
  List? _myProblems;
  List? _myMedications;
  late List _myAllergiesResult;
  late List _myProblemsResult;
  late List _myMedicationsResult;

  @override
  void initState() {
    if (widget.allergies.isEmpty || widget.allergies[0] == '') {
      _myAllergies = [];
      _myAllergiesResult = [];
    } else {
      _myAllergies = widget.allergies;
      _myAllergiesResult = widget.allergies;
    }
    if (widget.problems.isEmpty || widget.problems[0] == '') {
      _myProblems = [];
      _myProblemsResult = [];
    } else {
      _myProblems = widget.problems;
      _myProblemsResult = widget.problems;
    }
    if (widget.medications.isEmpty || widget.medications[0] == '') {
      _myMedications = [];
      _myMedicationsResult = [];
    } else {
      _myMedications = widget.medications;
      _myMedicationsResult = widget.medications;
    }

    super.initState();
  }

  Widget _renderMultiSelectField(
      List<dynamic>? data, dynamic initialValue, String title, List result) {
    return SizedBox(
      child: MultiSelectFormField(
        close: () {
          setState(() {
            result = initialValue;
          });
        },
        autovalidate: false,
        chipBackGroundColor: Colors.blue,
        chipLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        dialogTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        checkBoxActiveColor: Colors.blue,
        checkBoxCheckColor: Colors.white,
        dialogShapeBorder: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
        title: Text(
          title,
          style: const TextStyle(fontSize: 16),
        ),
        dataSource: data,
        textField: 'display',
        valueField: 'value',
        okButtonLabel: 'OK',
        cancelButtonLabel: 'CANCEL',
        hintWidget: const Text('Please choose one or more (optional)'),
        initialValue: initialValue,
        onSaved: (value) {
          if (value == null) return;
          if (title == 'Allergies') {
            setState(() {
              initialValue = value;
              result = initialValue;
              _myAllergiesResult = result;
            });
          }
          if (title == 'Problems') {
            setState(() {
              initialValue = value;
              result = initialValue;
              _myProblemsResult = result;
            });
          }
          if (title == 'Medications') {
            setState(() {
              initialValue = value;
              result = initialValue;
              _myMedicationsResult = result;
            });
          }
        },
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
            SizedBox(height: size.height * .08),
            const Text('Form Step 2'),
            SizedBox(height: size.height * .02),
            const StepProgress(currentStep: 2),
            SizedBox(height: size.height * .02),
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: size.width * .90,
                    child: _renderMultiSelectField(
                      _allergiesData,
                      _myAllergies,
                      'Allergies',
                      _myAllergiesResult,
                    ),
                  ),
                  SizedBox(height: size.height * .01),
                  SizedBox(
                    width: size.width * .90,
                    child: _renderMultiSelectField(
                      _problemsData,
                      _myProblems,
                      'Problems',
                      _myProblemsResult,
                    ),
                  ),
                  SizedBox(height: size.height * .01),
                  SizedBox(
                    width: size.width * .90,
                    child: _renderMultiSelectField(
                      _medicationsData,
                      _myMedications,
                      'Medications',
                      _myMedicationsResult,
                    ),
                  ),
                  SizedBox(height: size.height * .01),
                ],
              ),
            ),

            // Two Buttons
            SizedBox(
              width: size.width * .9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RaisedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FormStep1(
                              isLogin: true,
                              address: widget.address,
                              name: widget.name,
                              password: widget.password,
                              email: widget.email,
                              mobile: widget.mobile,
                              relationship: widget.relationship,
                              age: widget.age,
                              medications: widget.medications,
                              allergies: widget.allergies,
                              problems: widget.problems,
                            ),
                          ));
                    },
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
                      // Navigator.pushNamed(context, ConfirmationStep.routeName);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ConfirmationStep(
                              name: widget.name,
                              email: widget.email,
                              password: widget.password,
                              age: widget.age,
                              mobile: widget.mobile,
                              relationship: widget.relationship,
                              address: widget.address,
                              medications: _myMedicationsResult,
                              allergies: _myAllergiesResult,
                              problems: _myProblemsResult,
                            ),
                          ));
                    },
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
                  SizedBox(height: size.height * .02),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
