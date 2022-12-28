import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  static const routeName = "/test";
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Text'),
    );
  }
}
