import 'package:flutter/material.dart';
import 'build_image.dart';

// ignore: must_be_immutable
class BuildLargeContainer extends StatelessWidget {
  final String title;
  final double height;
  final double width;
  VoidCallback onPressed;
  final double fontSize;
  final String imageUrl;

  BuildLargeContainer({
    Key? key,
    required this.height,
    required this.width,
    required this.onPressed,
    required this.title,
    this.fontSize = 14,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Card(
        elevation: 10,
        child: Container(
          margin: const EdgeInsets.all(2),
          height: height,
          width: width,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              GridTile(
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
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
