import 'package:flutter/material.dart';
import '../widgets/helpers.dart';

class WidgetCard extends StatelessWidget {
  final VoidCallback onTapped;
  final String text;
  final double size;
  final double height;
  const WidgetCard(
      {super.key,
      required this.onTapped,
      required this.text,
      required this.size,
      required this.height});

  @override
  Widget build(BuildContext context) {
    final col = CustomColors();
    return InkWell(
      splashColor: col.color1,
      onTap: onTapped,
      child: SizedBox(
        height: height,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              size,
            ),
          ),
          color: col.color2,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: size,
                color: col.color1,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
