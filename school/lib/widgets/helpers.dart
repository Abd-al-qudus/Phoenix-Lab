import 'package:flutter/material.dart';

class CustomTexts {
  //screens App bar text
  final String homeScreen = 'HOME SCREEN';
  final String studentRoom = 'STUDENT ROOM';
  final String stdRecord = 'STUDENT RECORD';
  final String quiz = 'QUIZ / ACCESSMENTS';
  final String uploadRst = 'UPLOAD RESULT';
  final String sn = "SN";
  //student details
  final String stdInfo = "STUDENT INFO";
  final String stdName = "NAME";
  final String stdId = "ID";
  final String department = "DEPT";
  final String level = "LEVEL";
  final String age = "AGE";
  final String contact = "PHONE";
  final String homeAddress = "HOME ADD.";
  final String sex = "SEX";
  // guardian details
  final String guardianFirstName = "GUARDIAN FIRST";
  final String guardianLastName = "GUARDIAN LAST";
  final String guardianContact = "GUARDIAN PHONE";
}

class CustomSizes {
  final double medium = 20;
  final double small = 15;
}

class CustomColors {
  final Color color1 = Colors.white;
  final MaterialColor color2 = Colors.purple;
  final Color color3 = Colors.black;
}

Widget _spc(double space) {
  return SizedBox(
    width: double.infinity,
    height: space,
  );
}

class Spacers {
  final Widget minSpacer = _spc(5);
  final Widget medSpacer = _spc(10);
  final Widget larSpacer = _spc(20);
}
