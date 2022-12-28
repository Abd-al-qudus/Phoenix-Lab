import 'package:flutter/material.dart';
import '../widgets/helpers.dart';

class StudentRoom extends StatelessWidget {
  static const routeName = '/student-room';
  const StudentRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final text = CustomTexts();
    final size = CustomSizes();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          text.studentRoom,
          style: TextStyle(
            fontSize: size.medium,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Center(
        child: Text("NO CHAT NOW!!!"),
      ),
    );
  }
}
