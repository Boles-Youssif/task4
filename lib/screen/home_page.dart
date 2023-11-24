import 'dart:math';

import 'package:flutter/material.dart';
import 'package:task4/screen/result.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isMale = true;
  double height = 0;
  int age = 20;
  int weight =70;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'BMI Calculator',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isMale = true;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(8),
                      height: 200,
                      decoration: BoxDecoration(
                        color: isMale ? Colors.red : Color(0xff1F1F1F),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.male,
                            color: Colors.white,
                            size: 50,
                          ),
                          Text(
                            'MALE',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isMale = false;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(8),
                      height: 200,
                      decoration: BoxDecoration(
                          color: isMale ? Color(0xff1F1F1F) : Colors.red,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.female,
                            color: Colors.white,
                            size: 50,
                          ),
                          Text(
                            'FEMALE',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(8),
              height: 210,
              decoration: BoxDecoration(
                color: Color(0xff1F1F1F),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '${height.round()}',
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      ),
                      Text(
                        ' CM',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                  Slider(
                      activeColor: Colors.red,
                      max: 250,
                      value: height,
                      onChanged: (value) {
                        setState(() {
                          height = value;
                        });
                      })
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(8),
                    height: 180,
                    decoration: BoxDecoration(
                        color: Color(0xff1F1F1F),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                        Text(
                          weight.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  weight -= 1;
                                });
                              },
                              icon: Icon(Icons.remove_circle),
                              color: Colors.red,
                              iconSize: 40,
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  weight += 1;
                                });
                              },
                              icon: Icon(Icons.add_circle),
                              color: Colors.red,
                              iconSize: 40,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(8),
                    height: 180,
                    decoration: BoxDecoration(
                        color: Color(0xff1F1F1F),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                        Text(
                          age.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  age -= 1;
                                });
                              },
                              icon: Icon(Icons.remove_circle),
                              color: Colors.red,
                              iconSize: 40,
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  age += 1;
                                });
                              },
                              icon: Icon(Icons.add_circle),
                              color: Colors.red,
                              iconSize: 40,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 50,
              width: double.infinity,
              color: Colors.red,
              child: Center(
                  child: TextButton(
                child: Text(
                  'CALCULATE',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  double result = weight / pow(height/ 100, 2);
                  
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => Result(age: age,
                      isMale: isMale,
                      bmi_result: result.round(),
                      height: height.round(),
                      weight: weight,
                      ),
                  ));
                },
              ),),
            ),
          ],
        ),
      ),
    );
  }
}
