import 'package:flutter/material.dart';

class HospitalStaticMap extends StatelessWidget {
  static const routeName = 'hospital-map';
  const HospitalStaticMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        foregroundColor: Theme.of(context).colorScheme.primary,
        title: const Text(
          'STATIC MAP',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Put a static map here'),
      ),
    );
  }
}
