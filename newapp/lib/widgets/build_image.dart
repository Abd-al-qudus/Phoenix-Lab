import 'package:flutter/material.dart';

class BuildImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  // ignore: use_key_in_widget_constructors
  const BuildImage(
      {required this.imageUrl, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            imageUrl,
          ),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
