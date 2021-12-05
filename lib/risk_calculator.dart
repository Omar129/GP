import 'package:flutter/material.dart';

class RiskCalculator extends StatefulWidget {
  const RiskCalculator({Key? key}) : super(key: key);
  static const routeName = '/riskcalculator';

  @override
  _RiskCalculatorState createState() => _RiskCalculatorState();
}

class _RiskCalculatorState extends State<RiskCalculator> {
  String dropDownValue_ethnicity = '';
  String dropDownValue_years = '';
  String dropDownValue_gavebirth = '';
  FontWeight fontbutton = FontWeight.normal;
  List<bool> isSelected_eligibility_1 = List.generate(2, (_) => false);
  List<bool> isSelected_eligibility_2 = List.generate(3, (_) => false);
  List<bool> isSelected_family_1 = List.generate(3, (_) => false);
  List<bool> isSelected_family_2 = List.generate(2, (_) => false);
  List<bool> isSelected_family_3 = List.generate(3, (_) => false);
  List<bool> isSelected_family_4 = List.generate(3, (_) => false);
  List<bool> isSelected_family_5 = List.generate(4, (_) => false);

  List gave_birth = [
    'No Birth',
    '< 20',
    '20 - 4',
    '25 - 29',
    '30 or order',
    'Unknown'
  ];
  List ethnicity = ['White', 'African American', 'Asian', 'Unknown'];
  List years = [
    '35',
    '36',
    '37',
    '38',
    '39',
    '40',
    '41',
    '42',
    '43',
    '44',
    '45',
    '46',
    '47',
    '48',
    '49',
    '50',
    '51',
    '52',
    '53',
    '54',
    '55',
    '56',
    '57',
    '58',
    '59',
    '60',
    '61',
    '62',
    '63',
    '64',
    '65',
    '66',
    '67',
    '68',
    '69',
    '70',
    '71',
    '72',
    '73',
    '74',
    '75',
    '76',
    '77',
    '78',
    '79',
    '80',
    '81',
    '82',
    '83',
    '84',
    '85',
  ];
  showMesg() {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              backgroundColor: Colors.redAccent,
              content: Flexible(
                child: Text(
                    'This tool cannot accurately calculate breast cancer risk for women with a medical history of any breast cancer or DCIS or LCIS.'),
              ),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isSelected_eligibility_2[0] = false;
                        isSelected_eligibility_2[2] = true;
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      });
                    },
                    child: Text('Ok'))
              ],
              elevation: 24.0,
            ));
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height * 0.65;
    double w = MediaQuery.of(context).size.height * 0.03;
    double capitalText = MediaQuery.of(context).size.height * 0.05;
    double smallText = MediaQuery.of(context).size.height * 0.025;
    double dropdownheight = MediaQuery.of(context).size.height * 0.06;

    // String value;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF926C68),
          centerTitle: true,
        ),
        body: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            color: Colors.pinkAccent,
            child:
                ListView(padding: const EdgeInsets.all(8), children: <Widget>[
              Card(
                margin: const EdgeInsets.all(10),
                color: isSelected_eligibility_2[0]
                    ? Colors.grey.withOpacity(0.7)
                    : Colors.white,
                elevation: 20,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    Row(
                      children: [
                        VerticalDivider(
                          color: Colors.transparent,
                          thickness: 3.0,
                          width: w,
                        ),
                        Flexible(
                          child: Text(
                            'Patient Eligibility',
                            style: TextStyle(
                                fontSize: capitalText, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.blueGrey,
                      thickness: 1.0,
                      height: w / 2,
                      indent: w,
                      endIndent: w,
                    ),
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          VerticalDivider(
                            color: Colors.blue,
                            thickness: 3.0,
                            width: w,
                          ),
                          Flexible(
                            child: Text(
                              'Does the woman have a medical history of any breast cancer or of ductal carcinoma in situ (DCIS) or lobular carcinoma in situ(LCIS) or has she received previous radiation therapy to the chest for treatment of Hodgkin lymphoma?',
                              style: TextStyle(fontSize: smallText),
                            ),
                          ),
                          VerticalDivider(
                            color: Colors.transparent,
                            thickness: 3.0,
                            width: w,
                          ),
                        ],
                      ),
                    ),
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          VerticalDivider(
                            color: Colors.transparent,
                            thickness: 3.0,
                            width: w,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  for (int i = 0;
                                      i < isSelected_eligibility_1.length;
                                      i++) {
                                    if (i == 0) {
                                      isSelected_eligibility_1[0] = true;
                                    } else {
                                      isSelected_eligibility_1[i] = false;
                                    }
                                  }
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: isSelected_eligibility_1[0]
                                      ? Colors.blueGrey
                                      : Colors.blue),
                              child: Text(
                                'Yes',
                                style: TextStyle(
                                    fontSize: smallText * 0.9,
                                    fontWeight: isSelected_eligibility_1[0]
                                        ? FontWeight.bold
                                        : FontWeight.normal),
                              )),
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  for (int i = 0;
                                      i < isSelected_eligibility_1.length;
                                      i++) {
                                    if (i == 1) {
                                      isSelected_eligibility_1[1] = true;
                                    } else {
                                      isSelected_eligibility_1[i] = false;
                                    }
                                  }
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: isSelected_eligibility_1[1]
                                      ? Colors.blueGrey
                                      : Colors.blue),
                              child: Text(
                                'No',
                                style: TextStyle(
                                    fontSize: smallText * 0.9,
                                    fontWeight: isSelected_eligibility_1[1]
                                        ? FontWeight.bold
                                        : FontWeight.normal),
                              )),

                          // isSelected_eligibility_1: isSelected_eligibility_1),
                          VerticalDivider(
                            color: Colors.transparent,
                            thickness: 3.0,
                            width: w,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.blueGrey,
                      thickness: 1.0,
                      height: w / 2,
                      indent: w,
                      endIndent: w,
                    ),
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          VerticalDivider(
                            color: Colors.blue,
                            thickness: 3.0,
                            width: w,
                          ),
                          Flexible(
                            child: Text(
                                'Does the woman have a mutation in either the BRCA1 or BRCA2 gene, or a diagnosis of a genetic syndrome that may be associated with elevated risk of breast cancer?',
                                style: TextStyle(fontSize: smallText)),
                          ),
                          VerticalDivider(
                            color: Colors.transparent,
                            thickness: 3.0,
                            width: w,
                          ),
                        ],
                      ),
                    ),
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          VerticalDivider(
                            color: Colors.transparent,
                            thickness: 3.0,
                            width: w,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  for (int i = 0;
                                      i < isSelected_eligibility_2.length;
                                      i++) {
                                    if (i == 0) {
                                      isSelected_eligibility_2[0] = true;
                                    } else {
                                      isSelected_eligibility_2[i] = false;
                                    }
                                    showMesg();
                                  }
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: isSelected_eligibility_2[0]
                                      ? Colors.blueGrey
                                      : Colors.blue),
                              child: Text(
                                'Yes',
                                style: TextStyle(
                                    fontSize: smallText * 0.9,
                                    fontWeight: isSelected_eligibility_2[0]
                                        ? FontWeight.bold
                                        : FontWeight.normal),
                              )),
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  for (int i = 0;
                                      i < isSelected_eligibility_2.length;
                                      i++) {
                                    if (i == 1) {
                                      isSelected_eligibility_2[1] = true;
                                    } else {
                                      isSelected_eligibility_2[i] = false;
                                    }
                                  }
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: isSelected_eligibility_2[1]
                                      ? Colors.blueGrey
                                      : Colors.blue),
                              child: Text(
                                'No',
                                style: TextStyle(
                                    fontSize: smallText * 0.9,
                                    fontWeight: isSelected_eligibility_2[1]
                                        ? FontWeight.bold
                                        : FontWeight.normal),
                              )),
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  for (int i = 0;
                                      i < isSelected_eligibility_2.length;
                                      i++) {
                                    if (i == 2) {
                                      isSelected_eligibility_2[2] = true;
                                    } else {
                                      isSelected_eligibility_2[i] = false;
                                    }
                                  }
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: isSelected_eligibility_2[2]
                                      ? Colors.blueGrey
                                      : Colors.blue),
                              child: Text(
                                'Unkown',
                                style: TextStyle(
                                    fontSize: smallText * 0.9,
                                    fontWeight: isSelected_eligibility_2[2]
                                        ? FontWeight.bold
                                        : FontWeight.normal),
                              )),
                          VerticalDivider(
                            color: Colors.transparent,
                            thickness: 3.0,
                            width: w,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  ],
                ),
              ),
              Card(
                margin: const EdgeInsets.all(10),
                color: isSelected_eligibility_2[0]
                    ? Colors.grey.withOpacity(0.7)
                    : Colors.white,
                elevation: 20,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    Row(
                      children: [
                        VerticalDivider(
                          color: Colors.transparent,
                          thickness: 3.0,
                          width: w,
                        ),
                        Flexible(
                          child: Text(
                            'Demographics',
                            style: TextStyle(
                                fontSize: capitalText, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.blueGrey,
                      thickness: 1.0,
                      height: w / 2,
                      indent: w,
                      endIndent: w,
                    ),
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          VerticalDivider(
                            color: Colors.blue,
                            thickness: 3.0,
                            width: w,
                          ),
                          Flexible(
                            child: Text(
                                'What is the patient’s age? "This tool calculates risk for women between the ages of 35 and 85"',
                                style: TextStyle(fontSize: smallText)),
                          ),
                          VerticalDivider(
                            color: Colors.transparent,
                            thickness: 3.0,
                            width: w,
                          ),
                        ],
                      ),
                    ),
                    Container(
                        height: dropdownheight,
                        margin: EdgeInsets.all(10),
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        // height: ,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.blue, width: 2)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            hint: Text(
                              dropDownValue_years,
                              style: TextStyle(color: Colors.blue),
                            ),
                            isExpanded: true,
                            dropdownColor: Colors.grey,
                            iconSize: capitalText,
                            style: TextStyle(color: Colors.blueGrey[900]),
                            items: years.map(
                              (val) {
                                return DropdownMenuItem<String>(
                                  value: val,
                                  child: Text(val),
                                );
                              },
                            ).toList(),
                            onChanged: (val) {
                              setState(
                                () {
                                  dropDownValue_years = val.toString();
                                },
                              );
                            },
                          ),
                        )),
                    Divider(
                      color: Colors.blueGrey,
                      thickness: 1.0,
                      height: w / 2,
                      indent: w,
                      endIndent: w,
                    ),
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          VerticalDivider(
                            color: Colors.blue,
                            thickness: 3.0,
                            width: w,
                          ),
                          Flexible(
                            child: Text(
                              'What is the patient’s race/ethnicity?',
                              style: TextStyle(
                                  fontSize: smallText, color: Colors.black),
                            ),
                          ),
                          VerticalDivider(
                            color: Colors.transparent,
                            thickness: 3.0,
                            width: w,
                          ),
                        ],
                      ),
                    ),
                    Container(
                        height: dropdownheight,
                        margin: EdgeInsets.all(10),
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.blue, width: 2)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            hint: Text(
                              dropDownValue_ethnicity,
                              style: TextStyle(color: Colors.blue),
                            ),
                            dropdownColor: Colors.grey,
                            isExpanded: true,
                            iconSize: capitalText,
                            style: TextStyle(color: Colors.blueGrey[900]),
                            items: ethnicity.map(
                              (val) {
                                return DropdownMenuItem<String>(
                                  value: val,
                                  child: Text(
                                    val,
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                );
                              },
                            ).toList(),
                            onChanged: (val) {
                              setState(
                                () {
                                  dropDownValue_ethnicity = val.toString();
                                },
                              );
                            },
                          ),
                        )),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  ],
                ),
              ),
              Card(
                margin: const EdgeInsets.all(10),
                color: isSelected_eligibility_2[0]
                    ? Colors.grey.withOpacity(0.7)
                    : Colors.white,
                elevation: 20,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    Row(
                      children: [
                        VerticalDivider(
                          color: Colors.transparent,
                          thickness: 3.0,
                          width: w,
                        ),
                        Flexible(
                          child: Text(
                            'Patient & Family History',
                            style: TextStyle(
                                fontSize: capitalText, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.blueGrey,
                      thickness: 1.0,
                      height: w / 2,
                      indent: w,
                      endIndent: w,
                    ),
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          VerticalDivider(
                            color: Colors.blue,
                            thickness: 3.0,
                            width: w,
                          ),
                          Flexible(
                            child: Text(
                              'Has the woman ever had a breast biopsy?',
                              style: TextStyle(fontSize: smallText),
                            ),
                          ),
                          VerticalDivider(
                            color: Colors.transparent,
                            thickness: 3.0,
                            width: w,
                          ),
                        ],
                      ),
                    ),
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          VerticalDivider(
                            color: Colors.transparent,
                            thickness: 3.0,
                            width: w,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  for (int i = 0;
                                      i < isSelected_family_1.length;
                                      i++) {
                                    if (i == 0) {
                                      isSelected_family_1[0] = true;
                                    } else {
                                      isSelected_family_1[i] = false;
                                    }
                                  }
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: isSelected_family_1[0]
                                      ? Colors.blueGrey
                                      : Colors.blue),
                              child: Text(
                                'Yes',
                                style: TextStyle(
                                    fontSize: smallText * 0.9,
                                    fontWeight: isSelected_family_1[0]
                                        ? FontWeight.bold
                                        : FontWeight.normal),
                              )),
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  for (int i = 0;
                                      i < isSelected_family_1.length;
                                      i++) {
                                    if (i == 1) {
                                      isSelected_family_1[1] = true;
                                    } else {
                                      isSelected_family_1[i] = false;
                                    }
                                  }
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: isSelected_family_1[1]
                                      ? Colors.blueGrey
                                      : Colors.blue),
                              child: Text(
                                'No',
                                style: TextStyle(
                                    fontSize: smallText * 0.9,
                                    fontWeight: isSelected_family_1[1]
                                        ? FontWeight.bold
                                        : FontWeight.normal),
                              )),
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  for (int i = 0;
                                      i < isSelected_family_1.length;
                                      i++) {
                                    if (i == 2) {
                                      isSelected_family_1[2] = true;
                                    } else {
                                      isSelected_family_1[i] = false;
                                    }
                                  }
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: isSelected_family_1[2]
                                      ? Colors.blueGrey
                                      : Colors.blue),
                              child: Text(
                                'Unknown',
                                style: TextStyle(
                                    fontSize: smallText * 0.9,
                                    fontWeight: isSelected_family_1[2]
                                        ? FontWeight.bold
                                        : FontWeight.normal),
                              )),
                          VerticalDivider(
                            color: Colors.transparent,
                            thickness: 3.0,
                            width: w,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.blueGrey,
                      thickness: 1.0,
                      height: w / 2,
                      indent: w,
                      endIndent: w,
                    ),
                    Container(
                      color: isSelected_family_1[1]
                          ? Colors.grey.withOpacity(0.7)
                          : Colors.transparent,
                      child: Column(
                        children: [
                          IntrinsicHeight(
                            child: Row(
                              children: [
                                VerticalDivider(
                                  color: isSelected_family_1[1]
                                      ? Colors.blue.withOpacity(0.5)
                                      : Colors.blue,
                                  thickness: 3.0,
                                  width: w,
                                ),
                                Flexible(
                                  child: Text(
                                      'How many breast biopsies (positive or negative) has the woman had?',
                                      style: TextStyle(
                                        fontSize: smallText,
                                        color: isSelected_family_1[1]
                                            ? Colors.black.withOpacity(0.5)
                                            : Colors.black,
                                      )),
                                ),
                                VerticalDivider(
                                  color: Colors.transparent,
                                  thickness: 3.0,
                                  width: w,
                                ),
                              ],
                            ),
                          ),
                          IntrinsicHeight(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                VerticalDivider(
                                  color: Colors.transparent,
                                  thickness: 3.0,
                                  width: w,
                                ),
                                ElevatedButton(
                                    onPressed: isSelected_family_1[1]
                                        ? null
                                        : () {
                                            setState(() {
                                              for (int i = 0;
                                                  i <
                                                      isSelected_family_2
                                                          .length;
                                                  i++) {
                                                if (i == 0) {
                                                  isSelected_family_2[0] = true;
                                                } else {
                                                  isSelected_family_2[i] =
                                                      false;
                                                }
                                              }
                                            });
                                          },
                                    style: ElevatedButton.styleFrom(
                                        primary: isSelected_family_2[0]
                                            ? Colors.blueGrey
                                            : Colors.blue),
                                    child: Text(
                                      '1',
                                      style: TextStyle(
                                          fontSize: smallText * 0.9,
                                          fontWeight: isSelected_family_2[0]
                                              ? FontWeight.bold
                                              : FontWeight.normal),
                                    )),
                                ElevatedButton(
                                    onPressed: isSelected_family_1[1]
                                        ? null
                                        : () {
                                            setState(() {
                                              for (int i = 0;
                                                  i <
                                                      isSelected_family_2
                                                          .length;
                                                  i++) {
                                                if (i == 1) {
                                                  isSelected_family_2[1] = true;
                                                } else {
                                                  isSelected_family_2[i] =
                                                      false;
                                                }
                                              }
                                            });
                                          },
                                    style: ElevatedButton.styleFrom(
                                        primary: isSelected_family_2[1]
                                            ? Colors.blueGrey
                                            : Colors.blue),
                                    child: Text(
                                      '2 or more',
                                      style: TextStyle(
                                          fontSize: smallText * 0.9,
                                          fontWeight: isSelected_family_2[1]
                                              ? FontWeight.bold
                                              : FontWeight.normal),
                                    )),
                                VerticalDivider(
                                  color: Colors.transparent,
                                  thickness: 3.0,
                                  width: w,
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: isSelected_family_1[1]
                                ? Colors.blueGrey.withOpacity(0.5)
                                : Colors.blueGrey,
                            thickness: 1.0,
                            height: w / 2,
                            indent: w,
                            endIndent: w,
                          ),
                          IntrinsicHeight(
                            child: Row(
                              children: [
                                VerticalDivider(
                                  color: isSelected_family_1[1]
                                      ? Colors.blue.withOpacity(0.5)
                                      : Colors.blue,
                                  thickness: 3.0,
                                  width: w,
                                ),
                                Flexible(
                                  child: Text(
                                    'Has the woman ever had a breast biopsy with atypical hyperplasia?',
                                    style: TextStyle(
                                      fontSize: smallText,
                                      color: isSelected_family_1[1]
                                          ? Colors.black.withOpacity(0.5)
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                                VerticalDivider(
                                  color: Colors.transparent,
                                  thickness: 3.0,
                                  width: w,
                                ),
                              ],
                            ),
                          ),
                          IntrinsicHeight(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                VerticalDivider(
                                  color: Colors.transparent,
                                  thickness: 3.0,
                                  width: w,
                                ),
                                ElevatedButton(
                                    onPressed: isSelected_family_1[1]
                                        ? null
                                        : () {
                                            setState(() {
                                              for (int i = 0;
                                                  i <
                                                      isSelected_family_3
                                                          .length;
                                                  i++) {
                                                if (i == 0) {
                                                  isSelected_family_3[0] = true;
                                                } else {
                                                  isSelected_family_3[i] =
                                                      false;
                                                }
                                              }
                                            });
                                          },
                                    style: ElevatedButton.styleFrom(
                                        primary: isSelected_family_3[0]
                                            ? Colors.blueGrey
                                            : Colors.blue),
                                    child: Text(
                                      'Yes',
                                      style: TextStyle(
                                          fontSize: smallText * 0.9,
                                          fontWeight: isSelected_family_3[0]
                                              ? FontWeight.bold
                                              : FontWeight.normal),
                                    )),
                                ElevatedButton(
                                    onPressed: isSelected_family_1[1]
                                        ? null
                                        : () {
                                            setState(() {
                                              for (int i = 0;
                                                  i <
                                                      isSelected_family_3
                                                          .length;
                                                  i++) {
                                                if (i == 1) {
                                                  isSelected_family_3[1] = true;
                                                } else {
                                                  isSelected_family_3[i] =
                                                      false;
                                                }
                                              }
                                            });
                                          },
                                    style: ElevatedButton.styleFrom(
                                        primary: isSelected_family_3[1]
                                            ? Colors.blueGrey
                                            : Colors.blue),
                                    child: Text(
                                      'No',
                                      style: TextStyle(
                                          fontSize: smallText * 0.9,
                                          fontWeight: isSelected_family_3[1]
                                              ? FontWeight.bold
                                              : FontWeight.normal),
                                    )),
                                ElevatedButton(
                                    onPressed: isSelected_family_1[1]
                                        ? null
                                        : () {
                                            setState(() {
                                              for (int i = 0;
                                                  i <
                                                      isSelected_family_3
                                                          .length;
                                                  i++) {
                                                if (i == 2) {
                                                  isSelected_family_3[2] = true;
                                                } else {
                                                  isSelected_family_3[i] =
                                                      false;
                                                }
                                              }
                                            });
                                          },
                                    style: ElevatedButton.styleFrom(
                                        primary: isSelected_family_3[2]
                                            ? Colors.blueGrey
                                            : Colors.blue),
                                    child: Text(
                                      'Unknown',
                                      style: TextStyle(
                                          fontSize: smallText * 0.9,
                                          fontWeight: isSelected_family_3[2]
                                              ? FontWeight.bold
                                              : FontWeight.normal),
                                    )),
                                VerticalDivider(
                                  color: Colors.transparent,
                                  thickness: 3.0,
                                  width: w,
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: isSelected_family_1[1]
                                ? Colors.blueGrey.withOpacity(0.5)
                                : Colors.blueGrey,
                            thickness: 1.0,
                            height: w / 2,
                            indent: w,
                            endIndent: w,
                          ),
                        ],
                      ),
                    ),
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          VerticalDivider(
                            color: Colors.blue,
                            thickness: 3.0,
                            width: w,
                          ),
                          Flexible(
                            child: Text(
                              'What was the woman’s age at the time of her first menstrual period?',
                              style: TextStyle(fontSize: smallText),
                            ),
                          ),
                          VerticalDivider(
                            color: Colors.transparent,
                            thickness: 3.0,
                            width: w,
                          ),
                        ],
                      ),
                    ),
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          VerticalDivider(
                            color: Colors.transparent,
                            thickness: 3.0,
                            width: w,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  for (int i = 0;
                                      i < isSelected_family_4.length;
                                      i++) {
                                    if (i == 0) {
                                      isSelected_family_4[0] = true;
                                    } else {
                                      isSelected_family_4[i] = false;
                                    }
                                  }
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: isSelected_family_4[0]
                                      ? Colors.blueGrey
                                      : Colors.blue),
                              child: Text(
                                '7 to 11',
                                style: TextStyle(
                                    fontSize: smallText * 0.8,
                                    fontWeight: isSelected_family_4[0]
                                        ? FontWeight.bold
                                        : FontWeight.normal),
                              )),
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  for (int i = 0;
                                      i < isSelected_family_4.length;
                                      i++) {
                                    if (i == 1) {
                                      isSelected_family_4[1] = true;
                                    } else {
                                      isSelected_family_4[i] = false;
                                    }
                                  }
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: isSelected_family_4[1]
                                      ? Colors.blueGrey
                                      : Colors.blue),
                              child: Text(
                                '12 to 13',
                                style: TextStyle(
                                    fontSize: smallText * 0.8,
                                    fontWeight: isSelected_family_4[1]
                                        ? FontWeight.bold
                                        : FontWeight.normal),
                              )),
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  for (int i = 0;
                                      i < isSelected_family_4.length;
                                      i++) {
                                    if (i == 2) {
                                      isSelected_family_4[2] = true;
                                    } else {
                                      isSelected_family_4[i] = false;
                                    }
                                  }
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: isSelected_family_4[2]
                                      ? Colors.blueGrey
                                      : Colors.blue),
                              child: Text(
                                '14 or more',
                                style: TextStyle(
                                    fontSize: smallText * 0.8,
                                    fontWeight: isSelected_family_4[2]
                                        ? FontWeight.bold
                                        : FontWeight.normal),
                              )),
                          VerticalDivider(
                            color: Colors.transparent,
                            thickness: 3.0,
                            width: w,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.blueGrey,
                      thickness: 1.0,
                      height: w / 2,
                      indent: w,
                      endIndent: w,
                    ),
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          VerticalDivider(
                            color: Colors.blue,
                            thickness: 3.0,
                            width: w,
                          ),
                          Flexible(
                            child: Text(
                              'What was the woman’s age when she gave birth to her first child?',
                              style: TextStyle(
                                  fontSize: smallText, color: Colors.black),
                            ),
                          ),
                          VerticalDivider(
                            color: Colors.transparent,
                            thickness: 3.0,
                            width: w,
                          ),
                        ],
                      ),
                    ),
                    Container(
                        height: dropdownheight,
                        margin: EdgeInsets.all(10),
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.blue, width: 2)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            hint: Text(
                              dropDownValue_gavebirth,
                              style: TextStyle(color: Colors.blue),
                            ),
                            dropdownColor: Colors.grey,
                            isExpanded: true,
                            iconSize: capitalText,
                            style: TextStyle(color: Colors.blueGrey[900]),
                            items: gave_birth.map(
                              (val) {
                                return DropdownMenuItem<String>(
                                  value: val,
                                  child: Text(
                                    val,
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                );
                              },
                            ).toList(),
                            onChanged: (val) {
                              setState(
                                () {
                                  dropDownValue_gavebirth = val.toString();
                                },
                              );
                            },
                          ),
                        )),
                    Divider(
                      color: Colors.blueGrey,
                      thickness: 1.0,
                      height: w / 2,
                      indent: w,
                      endIndent: w,
                    ),
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          VerticalDivider(
                            color: Colors.blue,
                            thickness: 3.0,
                            width: w,
                          ),
                          Flexible(
                            child: Text(
                              'How many of the woman’s first-degree relatives (mother, sisters, daughters) have had breast cancer?',
                              style: TextStyle(fontSize: smallText),
                            ),
                          ),
                          VerticalDivider(
                            color: Colors.transparent,
                            thickness: 3.0,
                            width: w,
                          ),
                        ],
                      ),
                    ),
                    IntrinsicHeight(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              VerticalDivider(
                                color: Colors.transparent,
                                thickness: 3.0,
                                width: w,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      for (int i = 0;
                                          i < isSelected_family_5.length;
                                          i++) {
                                        if (i == 0) {
                                          isSelected_family_5[0] = true;
                                        } else {
                                          isSelected_family_5[i] = false;
                                        }
                                      }
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                      primary: isSelected_family_5[0]
                                          ? Colors.blueGrey
                                          : Colors.blue),
                                  child: Text(
                                    'None',
                                    style: TextStyle(
                                        fontSize: smallText * 0.9,
                                        fontWeight: isSelected_family_5[0]
                                            ? FontWeight.bold
                                            : FontWeight.normal),
                                  )),
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      for (int i = 0;
                                          i < isSelected_family_5.length;
                                          i++) {
                                        if (i == 1) {
                                          isSelected_family_5[1] = true;
                                        } else {
                                          isSelected_family_5[i] = false;
                                        }
                                      }
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                      primary: isSelected_family_5[1]
                                          ? Colors.blueGrey
                                          : Colors.blue),
                                  child: Text(
                                    'One',
                                    style: TextStyle(
                                        fontSize: smallText * 0.9,
                                        fontWeight: isSelected_family_5[1]
                                            ? FontWeight.bold
                                            : FontWeight.normal),
                                  )),
                              VerticalDivider(
                                color: Colors.transparent,
                                thickness: 3.0,
                                width: w,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              VerticalDivider(
                                color: Colors.transparent,
                                thickness: 3.0,
                                width: w,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      for (int i = 0;
                                          i < isSelected_family_5.length;
                                          i++) {
                                        if (i == 2) {
                                          isSelected_family_5[2] = true;
                                        } else {
                                          isSelected_family_5[i] = false;
                                        }
                                      }
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                      primary: isSelected_family_5[2]
                                          ? Colors.blueGrey
                                          : Colors.blue),
                                  child: Text(
                                    'One or more',
                                    style: TextStyle(
                                        fontSize: smallText * 0.9,
                                        fontWeight: isSelected_family_5[2]
                                            ? FontWeight.bold
                                            : FontWeight.normal),
                                  )),
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      for (int i = 0;
                                          i < isSelected_family_5.length;
                                          i++) {
                                        if (i == 3) {
                                          isSelected_family_5[3] = true;
                                        } else {
                                          isSelected_family_5[i] = false;
                                        }
                                      }
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                      primary: isSelected_family_5[3]
                                          ? Colors.blueGrey
                                          : Colors.blue),
                                  child: Text(
                                    'Unknown',
                                    style: TextStyle(
                                        fontSize: smallText * 0.9,
                                        fontWeight: isSelected_family_5[3]
                                            ? FontWeight.bold
                                            : FontWeight.normal),
                                  )),
                              VerticalDivider(
                                color: Colors.transparent,
                                thickness: 3.0,
                                width: w,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  ],
                ),
              ),
            ])));
  }
}
