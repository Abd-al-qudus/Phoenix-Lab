import 'package:flutter/material.dart';

import 'package:mydictionary/screens/tabs_screen.dart';

class WelcomeScreen extends StatelessWidget {
  static const routeName = '/welcome';
  final String imageUrl = 'assets/images/phoenix1.jpg';
  int count = 0;

  Widget _fetchAndSetImage(String imageUrl) {
    final imageAsset = AssetImage(imageUrl);
    final image = Image(
      image: imageAsset,
      fit: BoxFit.cover,
    );
    return image;
  }

  int makeCount(int s) {
    Future.delayed(Duration(seconds: s), () => count++);
    return count;
  }

  Future<int> counter() async {
    return await Future.delayed(
        const Duration(
          seconds: 10,
        ),
        () => makeCount(10));
  }

  // counter();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: counter(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                            border: Border.all(
                          width: 1,
                          color: Colors.white,
                        )),
                        child: _fetchAndSetImage(imageUrl),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Phoenix WordCrawler',
                      style: TextStyle(
                          fontFamily: 'Ubuntu',
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 30,
                          wordSpacing: 1.2),
                    )
                  ],
                );
              }
              return const TabScreen();
            }));
  }
}
