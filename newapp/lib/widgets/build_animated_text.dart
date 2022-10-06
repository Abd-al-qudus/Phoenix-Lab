import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BuildAnimatedText extends StatefulWidget {
  List<Color> colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  BuildAnimatedText({Key? key}) : super(key: key);

  @override
  State<BuildAnimatedText> createState() => _BuildAnimatedTextState();
}

class _BuildAnimatedTextState extends State<BuildAnimatedText> {
  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      animatedTexts: [
        RotateAnimatedText(
          'Welcome Sir/Ma',
          textStyle: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        FadeAnimatedText(
          'We save lives !!!',
          textStyle: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        ScaleAnimatedText(
          'We have the best personnels',
          textStyle: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        FadeAnimatedText(
          'Fill up your Records !!!',
          textStyle: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        TyperAnimatedText(
          'Book an appointment now !!!',
          textStyle: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        WavyAnimatedText(
          'Check out our Pharmacy !!!',
          textStyle: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        FlickerAnimatedText(
          'Navigation is easy !!!',
          textStyle: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        FlickerAnimatedText(
          'Check our Map',
          textStyle: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        ColorizeAnimatedText('developed by phoenix',
            textStyle: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
            colors: widget.colorizeColors)
      ],
      repeatForever: true,
      displayFullTextOnTap: true,
    );
  }
}
