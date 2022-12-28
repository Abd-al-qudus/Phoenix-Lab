import 'package:flutter/material.dart';
import '../screens/student_room.dart';
import '../screens/teacher_std_room.dart';
import '../screens/test_screen.dart';
import '../screens/home_screen.dart';
import '../widgets/helpers.dart';

void main() {
  runApp(const SchoolApp());
}

class SchoolApp extends StatelessWidget {
  const SchoolApp({super.key});

  @override
  Widget build(BuildContext context) {
    final col = CustomColors();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'School App',
      theme: ThemeData(
        primaryColor: col.color2,
        primarySwatch: col.color2,
        canvasColor: col.color1,
        fontFamily: "Cormorant_SC",
      ),
      //initialRoute: ,
      home: const HomeScreen(),
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        TestScreen.routeName: (context) => const TestScreen(),
        StudentRoom.routeName: (context) => const StudentRoom(),
        TeacherStdRoom.routeName: (context) => const TeacherStdRoom(),
      },
    );
  }
}
