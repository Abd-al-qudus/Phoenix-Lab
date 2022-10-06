import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import '../widgets/build_large_container.dart';

class PharmacyDrugDetailsBuilder extends StatelessWidget {
  final Map<dynamic, dynamic> details;
  const PharmacyDrugDetailsBuilder({
    Key? key,
    required this.details,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context).size;
    final screenWidth = mediaQueryData.width;
    final screenHeight = mediaQueryData.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Stack(alignment: Alignment.centerRight, children: [
          BuildLargeContainer(
            height: screenHeight * 0.4,
            width: screenWidth,
            onPressed: () {},
            title: details['name'].toString(),
            imageUrl: details['imageUrl'].toString(),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: CircleAvatar(
              radius: 40,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: FittedBox(
                  child: Text(
                    'N${details['price'].toString()}',
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          )
        ]),
        SizedBox(
          width: screenWidth,
          height: screenHeight * 0.3,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(5),
                alignment: Alignment.topCenter,
                width: screenWidth * 0.5,
                child: ExpandablePanel(
                  header: const Text(
                    'DESCRIPTION',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  collapsed: const Center(),
                  expanded: Center(
                    child: Text(
                      details['description'].toString(),
                      softWrap: true,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                alignment: Alignment.topCenter,
                width: screenWidth * 0.5,
                child: ExpandablePanel(
                  header: const Text(
                    'DOSAGE',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  collapsed: const Center(),
                  expanded: Center(
                    child: Text(
                      details['dosage'].toString(),
                      softWrap: true,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
