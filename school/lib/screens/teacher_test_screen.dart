import 'package:flutter/material.dart';

class TeacherTestScreen extends StatefulWidget {
  static const routeName = '/teacher-test';
  const TeacherTestScreen({Key? key}) : super(key: key);

  @override
  State<TeacherTestScreen> createState() => _TeacherTestScreenState();
}

class _TeacherTestScreenState extends State<TeacherTestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'TEST ACTIVITIES',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(),
    );
  }
}
