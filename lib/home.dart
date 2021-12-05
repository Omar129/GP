import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_app/risk_calculator.dart';

const mockupHeight = 683;
const mockupWidth = 411;

// ignore: camel_case_types
class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);
  static const routeName = '/homePage';
  @override
  _homePageState createState() => _homePageState();
}

// ignore: camel_case_types
class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    double height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    double width = MediaQuery.of(context).size.width;
    const heightScaleFactor = 1.0;
    print(heightScaleFactor);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: height * 0.2,
              color: Theme.of(context).primaryColor,
            ),
            Container(
              height: height * 0.6,
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(20 * heightScaleFactor,
                  10 * heightScaleFactor, 20 * heightScaleFactor, 0),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RiskCalculator.routeName);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black26),
                          borderRadius:
                              BorderRadius.circular(15 * heightScaleFactor)),
                      height: 100 * heightScaleFactor,
                      padding: const EdgeInsets.all(5 * heightScaleFactor),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/riskcalculator.PNG",
                            width: 65 * heightScaleFactor,
                          ),
                          const SizedBox(
                            width: 20 * heightScaleFactor,
                          ),
                          Column(
                            children: const [
                              SizedBox(
                                  width: 270 * heightScaleFactor,
                                  child: Text(
                                    "Risk Calculator",
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  )),
                              SizedBox(
                                  width: 270 * heightScaleFactor,
                                  child: Text(
                                    "tool to estimate women’s risk to develop invasive breast cancer over the next 5 years and lifetime risk.",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black),
                                    maxLines: 3,
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20 * heightScaleFactor,
                  ),
                  InkWell(
                    onTap: () {
//                      Navigator.pushNamed(context,'/risk');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black26),
                          borderRadius:
                              BorderRadius.circular(15 * heightScaleFactor)),
                      height: 100 * heightScaleFactor,
                      padding: const EdgeInsets.all(5 * heightScaleFactor),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/selfexamination.png",
                            width: 65 * heightScaleFactor,
                          ),
                          const SizedBox(
                            width: 20 * heightScaleFactor,
                          ),
                          Column(
                            children: const [
                              SizedBox(
                                  width: 270 * heightScaleFactor,
                                  child: Text(
                                    "Self-Examination",
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  )),
                              SizedBox(
                                  width: 270 * heightScaleFactor,
                                  child: Text(
                                    "Being familiar with how your breasts look and feel can help you notice symptoms such as lumps, pain, or ….",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black),
                                    maxLines: 3,
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20 * heightScaleFactor,
                  ),
                  InkWell(
                    onTap: () {
//                      Navigator.pushNamed(context,'/risk');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black26),
                          borderRadius:
                              BorderRadius.circular(15 * heightScaleFactor)),
                      height: 100 * heightScaleFactor,
                      padding: const EdgeInsets.all(5 * heightScaleFactor),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/main_top.png",
                            width: 65 * heightScaleFactor,
                          ),
                          const SizedBox(
                            width: 20 * heightScaleFactor,
                          ),
                          Column(
                            children: const [
                              SizedBox(
                                  width: 270 * heightScaleFactor,
                                  child: Text(
                                    "Second Opinion",
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  )),
                              SizedBox(
                                  width: 270 * heightScaleFactor,
                                  child: Text(
                                    "AI based tool to estimate women’s risk (low, medium, high).",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black),
                                    maxLines: 3,
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: height * 0.2,
              color: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
