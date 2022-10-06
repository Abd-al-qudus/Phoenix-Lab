import 'package:flutter/material.dart';

import '../logics/image_links.dart';
import 'build_home_screen_cards.dart';

class ClinicHomePageBuilder extends StatelessWidget {
  const ClinicHomePageBuilder({Key? key}) : super(key: key);

  // Widget _buildIconButton(
  //   String label,
  //   IconData icon,
  //   VoidCallback onPressed,
  //   BuildContext ctx,
  // ) {
  //   return Expanded(
  //     child: Card(
  //       elevation: 10,
  //       color: Theme.of(ctx).canvasColor,
  //       child: InkWell(
  //         onTap: onPressed,
  //         child: Padding(
  //           padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
  //           child: Column(
  //             children: <Widget>[
  //               Icon(
  //                 icon,
  //                 color: Theme.of(ctx).colorScheme.primary,
  //               ),
  //               Text(
  //                 label,
  //                 style: TextStyle(
  //                   color: Theme.of(ctx).colorScheme.secondary,
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context).size;
    final screenWidth = mediaQueryData.width;
    final screenHeight = mediaQueryData.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        HomeScreenSmallCards(
          height: screenHeight * 0.35,
          onPressed: () {},
          title: 'ANTENATAL | BABYCARE',
          width: screenWidth,
          imageUrl: returnImageUrl('paediatrics'),
          child: const SizedBox(),
        ),
        // const Divider(),
        const Divider(),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            'our services',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
        const Divider(),
        SizedBox(
          height: screenHeight * 0.4,
          width: double.infinity,
          child: GridView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 2 / 1.7,
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
            ),
            itemBuilder: (BuildContext context, int index) =>
                HomeScreenSmallCards(
              height: screenHeight * 0.4,
              onPressed: () {},
              title:
                  imageLink.keys.toList(growable: false)[index].toUpperCase(),
              width: screenWidth,
              imageUrl: imageLink.values.toList(growable: false)[index],
              child: const SizedBox(),
            ),
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}
