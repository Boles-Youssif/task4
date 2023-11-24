import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int bmi_result;
  final bool isMale;
  final age;
  final int height;
  final int weight;
  Result({
    required this.bmi_result,
    required this.isMale,
    required this.age,
    required this.height,
    required this.weight,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'BMI Result',
          style: TextStyle(color: Colors.white),
        ),
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),
      body: Container(
          width: double.infinity,
          margin: EdgeInsets.all(32),
          decoration: BoxDecoration(
              color: Color(0xff1F1F1F),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Gender:${isMale ? 'Male' : 'Female'}',
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
              Text(
                'Age:$age',
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
              Text(
                'Height:$height',
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
              Text(
                'Weight:$weight',
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
              Text(
                'Result BiM:$bmi_result',
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
              Text(
                'Perfect Weight:${perfect_weight()}',
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ],
          )),
    );
  }

  String perfect_weight() {
    if (bmi_result <= 19)
      return 'Under Weight';
    else if (bmi_result > 25)
      return 'fit';
    else
      return 'Normal';
  }
}
