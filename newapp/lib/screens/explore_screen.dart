import 'package:flutter/material.dart';
import '../logics/image_links.dart';
import '../widgets/explore_screen_builder.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context).size;
    final screenWidth = mediaQueryData.width;
    final screenHeight = mediaQueryData.height;
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     'My Hospital',
      //   ),
      // ),
      body: ExploreScreenBuilder(
        returnImageUrl('explore'),
        height: screenHeight,
        width: screenWidth,
      ),
    );
  }
}
