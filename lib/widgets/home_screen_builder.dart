import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/http_provider.dart';
import '../models/patient_details_model.dart';
import '../screens/clinic_home_screen.dart';
import '../screens/hospital_map.dart';
import '../screens/pharmacy_drug_overview_screen.dart';
import '../screens/record_screen.dart';
import '../widgets/build_animated_text.dart';
import '../widgets/build_home_screen_cards.dart';
import '../widgets/build_large_container.dart';

class HomeScreenBuilder extends StatelessWidget {
  const HomeScreenBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var imageUrlList = [];
    final httpRequest = HttpRequests();
    final dbHelper = DbProvider();
    final recordList = Provider.of<PatientRecordProvider>(context);
    final mediaQueryData = MediaQuery.of(context).size;
    final screenWidth = mediaQueryData.width;
    final screenHeight = mediaQueryData.height;
    return FutureBuilder(
        future: httpRequest.getUploadedImage(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SizedBox(
              width: screenWidth,
              height: screenHeight,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          final Map<dynamic, dynamic> imageMap = snapshot.data as Map;
          for (var imageLink in imageMap.values) {
            imageUrlList.add(imageLink);
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Card(
                elevation: 20,
                color: Theme.of(context).canvasColor,
                child: SizedBox(
                  height: screenHeight * 0.1,
                  width: screenWidth * 0.95,
                  child: Center(child: BuildAnimatedText()),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 5,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                ),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.book,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    Text(
                      'create Records and Files',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                elevation: 20,
                child: HomeScreenSmallCards(
                  height: screenHeight * 0.2,
                  width: screenWidth,
                  title: 'record',
                  onPressed: () async {
                    await dbHelper.queryDb('name').then(
                      (value) {
                        recordList.records = value[0].values.toList();
                        Navigator.of(context).pushNamed(RecordScreen.routeName);
                      },
                    );
                  },
                  fontSize: 18,
                  imageUrl: imageUrlList[0]['record'],
                  child: const SizedBox(
                    width: 1,
                    height: 1,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 5,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                ),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.medical_services,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    Text(
                      'Our Services',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.5,
                width: screenWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    BuildLargeContainer(
                      height: screenHeight * 0.5,
                      width: screenWidth * 0.45,
                      onPressed: () => Navigator.of(context)
                          .pushNamed(ClinicHomePage.routeName),
                      title: 'clinical',
                      fontSize: 18,
                      imageUrl: imageUrlList[0]['clinical'],
                    ),
                    Column(
                      children: <Widget>[
                        Expanded(
                          child: HomeScreenSmallCards(
                            height: screenHeight * 0.25,
                            onPressed: () => Navigator.of(context).pushNamed(
                                PharmacyDrugOverviewScreen.routeName),
                            title: 'pharmacy',
                            width: screenWidth * 0.45,
                            fontSize: 18,
                            imageUrl: imageUrlList[0]['pharmacy'],
                            child: const SizedBox(
                              width: 1,
                              height: 1,
                            ),
                          ),
                        ),
                        Expanded(
                          child: HomeScreenSmallCards(
                            height: screenHeight * 0.25,
                            onPressed: () => Navigator.of(context)
                                .pushNamed(HospitalStaticMap.routeName),
                            title: 'map',
                            width: screenWidth * 0.45,
                            fontSize: 18,
                            imageUrl: imageUrlList[0]['map'],
                            child: const SizedBox(
                              width: 1,
                              height: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }
}
