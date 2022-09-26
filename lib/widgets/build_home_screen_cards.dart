import 'package:flutter/material.dart';
import 'build_image.dart';

// ignore: must_be_immutable
class HomeScreenSmallCards extends StatelessWidget {
  final String title;
  VoidCallback onPressed;
  final double width;
  final double height;
  final double fontSize;
  final String imageUrl;
  Widget? child;

  HomeScreenSmallCards({
    Key? key,
    required this.height,
    required this.onPressed,
    required this.title,
    required this.width,
    this.fontSize = 13,
    required this.imageUrl,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Stack(
        alignment: Alignment.topRight,
        children: <Widget>[
          SizedBox(
            width: width,
            height: height,
            child: Card(
              child: GridTile(
                footer: Container(
                  alignment: Alignment.center,
                  color: Theme.of(context).colorScheme.secondary,
                  child: Text(
                    title.toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                child: BuildImage(
                  imageUrl: imageUrl,
                  width: width,
                  height: height,
                ),
              ),
            ),
          ),
          child!,
        ],
      ),
    );
  }
}
