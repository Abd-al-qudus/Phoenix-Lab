import 'package:flutter/material.dart';
import 'package:mydictionary/screens/random_word_screen.dart';

import 'package:mydictionary/screens/searched_word_detail_screen.dart';
import 'package:mydictionary/screens/tabs_screen.dart';
import 'package:mydictionary/screens/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 25, 3, 124),
        canvasColor: const Color.fromARGB(255, 25, 3, 124),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
        fontFamily: 'Ubuntu',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(),
        WelcomeScreen.routeName: (context) => WelcomeScreen(),
        RandomWordScreen.routeName: (context) => const RandomWordScreen(),
        SearchedWordsScreen.routeName: (context) => SearchedWordsScreen(),
        TabScreen.routeName: (context) => const TabScreen(),
      },
    );
  }
}
