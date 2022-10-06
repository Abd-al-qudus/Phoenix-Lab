import 'package:flutter/material.dart';

import '../models/http_provider.dart';
import '../screens/record_screen.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = 'profile-screen';
  const ProfileScreen({Key? key}) : super(key: key);

  Widget _buildProfileLayout(String key, String value) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                key,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            )
          ],
        ),
        const Divider()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final wordMapId = ModalRoute.of(context)!.settings.arguments as List;
    final httpRequest = HttpRequests();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'USER',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: wordMapId.isEmpty || wordMapId[0] == null
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Center(child: Text('No Record found!!!')),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushNamed(
                        RecordScreen.routeName,
                      );
                    },
                    child: const Text('ADD A RECORD'),
                  ),
                )
              ],
            )
          : FutureBuilder(
              future: httpRequest.getRecord(wordMapId[0].toString()),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                // if (snapshot.connectionState == ConnectionState.done) {
                //   //  wordMapId.isEmpty
                //   if (!snapshot.hasData) {
                //     Column(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: <Widget>[
                //         const Center(child: Text('No Record found!!!')),
                //         Center(
                //           child: TextButton(
                //             onPressed: () {
                //               Navigator.of(context).pop();
                //               Navigator.of(context).pushNamed(
                //                 RecordScreen.routeName,
                //               );
                //             },
                //             child: const Text('ADD A RECORD'),
                //           ),
                //         )

                //     );
                //   }
                // }
                final Map<dynamic, dynamic> recordMap = snapshot.data as Map;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              borderRadius: BorderRadius.circular(100)),
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(2),
                          margin: const EdgeInsets.all(20),
                          width: 100,
                          height: 100,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              CircleAvatar(
                                radius: 100,
                              ),
                              IconButton(
                                onPressed: () {
                                  // print(wordMap.familyDrNumber);
                                  print(recordMap);
                                },
                                icon: Icon(
                                  Icons.photo,
                                  size: 40,
                                  color: Theme.of(context).canvasColor,
                                ),
                              ),
                            ],
                          )),
                    ),
                    const Center(
                      child: Text(
                        'PROFILE DATA',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'USER ID: U${wordMapId[0]}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        elevation: 20,
                        color: Theme.of(context).canvasColor,
                        child: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              _buildProfileLayout(
                                  'First Name', recordMap['firstName']),
                              _buildProfileLayout(
                                  'Middle Name', recordMap['middleName']),
                              _buildProfileLayout(
                                  'Last Name', recordMap['lastName']),
                              _buildProfileLayout(
                                  'Home Address', recordMap['homeAdd']),
                              _buildProfileLayout('Home Address Cont.',
                                  recordMap['homeAddCont']),
                              _buildProfileLayout('City', recordMap['city']),
                              _buildProfileLayout('State', recordMap['state']),
                              _buildProfileLayout(
                                  'Postal Code', recordMap['postalCode']),
                              _buildProfileLayout(
                                  'Country', recordMap['country']),
                              _buildProfileLayout(
                                  'Phone Number', recordMap['phoneNumber']),
                              _buildProfileLayout('Email', recordMap['email']),
                              _buildProfileLayout('Sex', recordMap['sex']),
                              _buildProfileLayout('D.O.B', recordMap['dob']),
                              _buildProfileLayout(
                                  'Marital Status', recordMap['maritalStatus']),
                              _buildProfileLayout('N.O.K First Name',
                                  recordMap['nokFirstName']),
                              _buildProfileLayout(
                                  'N.O.K Last Name', recordMap['nokLastName']),
                              _buildProfileLayout(
                                  'N.O.K Phone Number', recordMap['nokNumber']),
                              _buildProfileLayout('N.O.K Relationship',
                                  recordMap['relationship']),
                              _buildProfileLayout(
                                  'Fam. Dr. Name', recordMap['familyDrName']),
                              _buildProfileLayout('Fam. Dr Number',
                                  recordMap['familyDrNumber']),
                              _buildProfileLayout(
                                  'Reg. Reason', recordMap['regReason']),
                              _buildProfileLayout('Health Status',
                                  recordMap['currentHealthStat']),
                              _buildProfileLayout(
                                  'Hosp. Address', recordMap['hospitalAdd']),
                              _buildProfileLayout('Hosp. Add. Cont.',
                                  recordMap['regStreetAddCont']),
                              _buildProfileLayout(
                                  'Reg. City', recordMap['regCity']),
                              _buildProfileLayout(
                                  'Reg. State', recordMap['regState']),
                              _buildProfileLayout(
                                  'Reg. Country', recordMap['regCountry']),
                              _buildProfileLayout(
                                  'Hosp. Code', recordMap['hospCode']),
                              _buildProfileLayout('Hosp. Contact',
                                  recordMap['hospPhoneNumber']),
                              _buildProfileLayout(
                                  'Chart Number', recordMap['chartNumber']),
                              _buildProfileLayout(
                                  'Reg. Clerk ID', recordMap['regClerkNumber']),
                              _buildProfileLayout(
                                  'Reg. Location', recordMap['regLocation']),
                              _buildProfileLayout(
                                  'Reg. Time', recordMap['regTime']),
                              _buildProfileLayout(
                                  'Reg. Date', recordMap['regDate']),
                              _buildProfileLayout(
                                  'Additional Notes', recordMap['addNotes']),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
    );
  }
}
