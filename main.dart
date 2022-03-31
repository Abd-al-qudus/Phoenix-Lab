import 'package:flutter/material.dart';
import 'myuserinterface.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context).copyWith(
        primaryColor: Colors.red,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.yellow,
        ),
      ),
      title: 'My App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Measures Converter',
            style: TextStyle(
              fontSize: 25,
              letterSpacing: 1.1,
            ),
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: MyUserInterface(),
    );
  }
}
