import 'package:flutter/material.dart';
import '../models/patient_details_model.dart';
import '../screens/profile_screen.dart';
import '../widgets/home_screen_builder.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  static const routeName = 'home-page';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final recordModel = Provider.of<PatientRecordProvider>(context);
    final dbHelper = DbProvider();
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          'MY HOSPITAL',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              await dbHelper.queryDb('name').then((value) {
                recordModel.records = value[0].values.toList();
                Navigator.of(context).pushNamed(
                  ProfileScreen.routeName,
                );
              });
            },
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: HomeScreenBuilder(),
      ),
    );
  }
}
