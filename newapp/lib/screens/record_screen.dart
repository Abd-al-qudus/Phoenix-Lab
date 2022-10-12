import 'package:flutter/material.dart';
import '../models/database_provider.dart';

import '../screens/patient_record_screen.dart';

class RecordScreen extends StatefulWidget {
  static const routeName = 'record-screen';
  const RecordScreen({Key? key}) : super(key: key);

  @override
  State<RecordScreen> createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen> {
  final _formKey = GlobalKey<FormState>();
  Map<String, dynamic> records = {};

  late TextEditingController hospitalAdd;
  late TextEditingController streetAdd;
  late TextEditingController streetAddCont;
  late TextEditingController city;
  late TextEditingController state;
  late TextEditingController postalCode;
  late TextEditingController country;
  late TextEditingController hospPhoneNumber;
  late TextEditingController hospAreaCode;
  late TextEditingController chartNumber;
  late TextEditingController regClerkNumber;
  late TextEditingController registLocation;
  late TextEditingController regDate;
  late TextEditingController regTime;

  Widget _cardBuilder(String label, var controller,
      {var textType = TextInputType.name}) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        controller: controller,
        keyboardType: textType,
        validator: (value) {
          if (value == null) {
            return 'field cannot be empty';
          }
          if (value.isEmpty) {
            return 'field cannot be empty';
          }
          return null;
        },
      ),
    );
  }

  @override
  void initState() {
    hospitalAdd = TextEditingController();
    streetAdd = TextEditingController();
    streetAddCont = TextEditingController();
    city = TextEditingController();
    state = TextEditingController();
    postalCode = TextEditingController();
    country = TextEditingController();
    hospPhoneNumber = TextEditingController();
    hospAreaCode = TextEditingController();
    chartNumber = TextEditingController();
    regClerkNumber = TextEditingController();
    registLocation = TextEditingController();
    regDate = TextEditingController();
    regTime = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    hospitalAdd.dispose();
    streetAdd.dispose();
    streetAddCont.dispose();
    city.dispose();
    state.dispose();
    country.dispose();
    hospPhoneNumber.dispose();
    hospAreaCode.dispose();
    chartNumber.dispose();
    regClerkNumber.dispose();
    registLocation.dispose();
    regDate.dispose();
    regTime.dispose();
    super.dispose();
  }

  void updateRecords() {
    records['hospitalAdd'] = hospitalAdd.text;
    records['regStreetAdd'] = streetAdd.text;
    records['regStreetAddCont'] = streetAddCont.text;
    records['regCity'] = city.text;
    records['regState'] = state.text;
    records['regCountry'] = country.text;
    records['hospPhoneNumber'] = hospPhoneNumber.text;
    records['hospCode'] = hospAreaCode.text;
    records['chartNumber'] = chartNumber.text;
    records['regClerkNumber'] = regClerkNumber.text;
    records['regLocation'] = registLocation.text;
    records['regDate'] = regDate.text;
    records['regTime'] = regTime.text;
  }

  @override
  Widget build(BuildContext context) {
    final String? recordId =
        ModalRoute.of(context)!.settings.arguments as String?;
    final mediaQueryData = MediaQuery.of(context).size;
    final screenWidth = mediaQueryData.width;
    final screenHeight = mediaQueryData.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'RECORDS',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      // ignore: unrelated_type_equality_checks
      body: recordId == null
          ? SizedBox(
              width: screenWidth,
              height: screenHeight,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            _cardBuilder(
                              'Hospital Address',
                              hospitalAdd,
                            ),
                            _cardBuilder(
                              'Street Address',
                              streetAdd,
                            ),
                            _cardBuilder(
                              'Street Address cont.',
                              streetAddCont,
                            ),
                            _cardBuilder(
                              'City',
                              city,
                            ),
                            _cardBuilder(
                              'State',
                              state,
                            ),
                            _cardBuilder(
                              'Postal Code',
                              postalCode,
                              textType: TextInputType.number,
                            ),
                            _cardBuilder(
                              'Country',
                              country,
                            ),
                            _cardBuilder(
                              'Hosp. Area Code',
                              hospAreaCode,
                              textType: TextInputType.number,
                            ),
                            _cardBuilder(
                              'Hosp. Phone Number',
                              hospPhoneNumber,
                              textType: TextInputType.number,
                            ),
                            _cardBuilder(
                              'Chart Number',
                              chartNumber,
                              textType: TextInputType.number,
                            ),
                            _cardBuilder(
                              'Regr. Clerk Number',
                              regClerkNumber,
                              textType: TextInputType.number,
                            ),
                            _cardBuilder(
                              'Reg. Location',
                              registLocation,
                            ),
                            _cardBuilder(
                              'Full Date DD/MM/YY',
                              regDate,
                            ),
                            _cardBuilder(
                              'Reg. Time XX/XX AM/PM',
                              regTime,
                            ),
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_forward),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          updateRecords();
                          Navigator.of(context).pushNamed(
                            PatientRecordScreen.routeName,
                            arguments: records,
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            )
          : const Center(
              child: Text('You\'ve updated your records!!!'),
            ),
    );
  }
}
