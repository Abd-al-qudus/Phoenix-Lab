import 'package:bmi/widget/bmi_screen_body.dart';
import 'package:flutter/material.dart';

class BmiScreen extends StatelessWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        title: const Text(
          'BMI Calculator',
          style: TextStyle(
            fontFamily: 'Ubuntu',
            fontSize: 25,
          ),
        ),
      ),
      body: const BmiScreenBody(),
    );
  }
}
