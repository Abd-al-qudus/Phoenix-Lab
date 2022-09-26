import 'package:flutter/material.dart';
import 'package:newapp/screens/home_screen.dart';

class ExploreScreenBuilder extends StatelessWidget {
  final double height;
  final double width;
  final String imageUrl;

  const ExploreScreenBuilder(
    this.imageUrl, {
    Key? key,
    this.height = 100,
    this.width = 100,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        SizedBox(
          width: width,
          height: height,
          child: Image(
            image: AssetImage(imageUrl),
            fit: BoxFit.fill,
          ),
        ),
        Card(
          child: ElevatedButton(
            child: const Text(
              'EXPLORE',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
              ),
            ),
            onPressed: () => Navigator.of(context).pushReplacementNamed(
              HomePage.routeName,
            ),
          ),
        ),
      ],
    );
  }
}
