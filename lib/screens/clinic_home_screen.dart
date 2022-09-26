import 'package:flutter/material.dart';
import '../screens/consultation_screen.dart';
import '../widgets/clinic_home_screen_builder.dart';

class ClinicHomePage extends StatelessWidget {
  static const routeName = 'clinic-home-page';
  const ClinicHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MY CLINIC',
          style: TextStyle(
            fontSize: 25,
            letterSpacing: 1,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.small(
        onPressed: () =>
            Navigator.of(context).pushNamed(ConsultationScreen.routeName),
        child: const Icon(Icons.chat),
      ),
      body: const SingleChildScrollView(child: ClinicHomePageBuilder()),
    );
  }
}
