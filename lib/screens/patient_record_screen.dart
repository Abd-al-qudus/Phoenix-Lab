import 'package:flutter/material.dart';
import '../models/http_provider.dart';
import '../models/patient_details_model.dart';
import 'package:provider/provider.dart';

class PatientRecordScreen extends StatefulWidget {
  static const routeName = 'patient-record';
  const PatientRecordScreen({Key? key}) : super(key: key);

  @override
  State<PatientRecordScreen> createState() => _PatientRecordScreenState();
}

class _PatientRecordScreenState extends State<PatientRecordScreen> {
  final _formKey = GlobalKey<FormState>();
  final Map<dynamic, dynamic> _records = {};
  final httpRequest = HttpRequests();

  late TextEditingController firstName;
  late TextEditingController middleName;
  late TextEditingController lastName;
  late TextEditingController homeAddress;
  late TextEditingController homeAddressCont;
  late TextEditingController city;
  late TextEditingController state;
  late TextEditingController postalCode;
  late TextEditingController country;
  late TextEditingController phoneNumber;
  late TextEditingController email;
  late TextEditingController sex;
  late TextEditingController dob;
  late TextEditingController maritalStatus;
  late TextEditingController nokFirstName;
  late TextEditingController nokLastName;
  late TextEditingController relationShip;
  late TextEditingController familyDrName;
  late TextEditingController familyDrNumber;
  late TextEditingController nokNumber;
  late TextEditingController regReason;
  late TextEditingController currentHealthStatus;
  late TextEditingController addNotes;

  Widget _cardBuilder(String label, var controller,
      {var textinput = TextInputType.name}) {
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
        keyboardType: textinput,
        controller: controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'field cannot be empty';
          }
          return null;
        },
      ),
    );
  }

  @override
  void initState() {
    firstName = TextEditingController();
    middleName = TextEditingController();
    lastName = TextEditingController();
    homeAddress = TextEditingController();
    homeAddressCont = TextEditingController();
    city = TextEditingController();
    state = TextEditingController();
    postalCode = TextEditingController();
    country = TextEditingController();
    phoneNumber = TextEditingController();
    email = TextEditingController();
    sex = TextEditingController();
    dob = TextEditingController();
    maritalStatus = TextEditingController();
    nokFirstName = TextEditingController();
    nokLastName = TextEditingController();
    relationShip = TextEditingController();
    familyDrName = TextEditingController();
    familyDrNumber = TextEditingController();
    nokNumber = TextEditingController();
    regReason = TextEditingController();
    currentHealthStatus = TextEditingController();
    addNotes = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    firstName.dispose();
    middleName.dispose();
    lastName.dispose();
    homeAddress.dispose();
    homeAddressCont.dispose();
    city.dispose();
    state.dispose();
    postalCode.dispose();
    country.dispose();
    phoneNumber.dispose();
    email.dispose();
    sex.dispose();
    dob.dispose();
    maritalStatus.dispose();
    nokFirstName.dispose();
    nokLastName.dispose();
    relationShip.dispose();
    familyDrName.dispose();
    familyDrNumber.dispose();
    nokNumber.dispose();
    regReason.dispose();
    currentHealthStatus.dispose();
    addNotes.dispose();
    super.dispose();
  }

  void _storeRecords() {
    _records['firstName'] = firstName.text;
    _records['middleName'] = middleName.text;
    _records['lastName'] = lastName.text;
    _records['homeAdd'] = homeAddress.text;
    _records['homeAddCont'] = homeAddressCont.text;
    _records['city'] = city.text;
    _records['state'] = state.text;
    _records['postalCode'] = postalCode.text;
    _records['country'] = country.text;
    _records['email'] = email.text;
    _records['phoneNumber'] = phoneNumber.text;
    _records['sex'] = sex.text;
    _records['dob'] = dob.text;
    _records['maritalStatus'] = maritalStatus.text;
    _records['nokNumber'] = nokNumber.text;
    _records['nokFirstName'] = nokFirstName.text;
    _records['nokLastName'] = nokLastName.text;
    _records['relationship'] = relationShip.text;
    _records['familyDrName'] = familyDrName.text;
    _records['familyDrNumber'] = familyDrNumber.text;
    _records['regReason'] = regReason.text;
    _records['currentHealthStat'] = currentHealthStatus.text;
    _records['addNotes'] = addNotes.text;
  }

  @override
  Widget build(BuildContext context) {
    final recordModel = Provider.of<PatientRecordProvider>(context);
    final dbHelper = DbProvider();
    final initialRecord = ModalRoute.of(context)!.settings.arguments as Map;
    final mediaQueryData = MediaQuery.of(context).size;
    final screenWidth = mediaQueryData.width;
    final screenHeight = mediaQueryData.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'RECORDS cont.',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: screenWidth,
        height: screenHeight,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.all(5),
                    child: Text('patient details'),
                  ),
                  _cardBuilder(
                    'First Name',
                    firstName,
                  ),
                  _cardBuilder(
                    'Middle Name',
                    middleName,
                  ),
                  _cardBuilder(
                    'Last Name',
                    lastName,
                  ),
                  _cardBuilder(
                    'Street Address',
                    homeAddress,
                  ),
                  _cardBuilder(
                    'Street Address cont.',
                    homeAddressCont,
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
                    'Postal code',
                    postalCode,
                    textinput: TextInputType.number,
                  ),
                  _cardBuilder(
                    'Country',
                    country,
                  ),
                  _cardBuilder(
                    'Phone Number',
                    phoneNumber,
                    textinput: TextInputType.number,
                  ),
                  _cardBuilder(
                    'Email',
                    email,
                    textinput: TextInputType.emailAddress,
                  ),
                  _cardBuilder(
                    'Sex',
                    sex,
                  ),
                  _cardBuilder(
                    'Date Of Birth',
                    dob,
                  ),
                  _cardBuilder(
                    'Marital Status',
                    maritalStatus,
                  ),
                  //emergency
                  const Padding(
                    padding: EdgeInsets.all(5),
                    child: Text('patient next of kin'),
                  ),
                  _cardBuilder(
                    'First Name',
                    nokFirstName,
                  ),
                  _cardBuilder(
                    'Last Name',
                    nokLastName,
                  ),
                  _cardBuilder(
                    'Phone Number',
                    nokNumber,
                    textinput: TextInputType.number,
                  ),
                  _cardBuilder(
                    'Relationship',
                    relationShip,
                  ),
                  //family doctor
                  const Padding(
                    padding: EdgeInsets.all(5),
                    child: Text('family doctor'),
                  ),
                  _cardBuilder(
                    'Family Dr. Name',
                    familyDrName,
                  ),
                  _cardBuilder(
                    'Phone Number',
                    familyDrNumber,
                    textinput: TextInputType.number,
                  ),
                  _cardBuilder(
                    'Reasons for Reg.',
                    regReason,
                  ),
                  _cardBuilder(
                    'Current Health Status',
                    currentHealthStatus,
                  ),
                  _cardBuilder(
                    'Additional Notes',
                    addNotes,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 20,
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
              icon: const Icon(Icons.arrow_forward),
              onPressed: () => Navigator.of(context).pop(),
            ),
            label: 'BACK',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    actionsAlignment: MainAxisAlignment.spaceBetween,
                    alignment: Alignment.center,
                    title: const Text('confirm action'),
                    content: const Text(
                        'i strongly agree that the details entered are correct, this action can not be reversed.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          final checker = _formKey.currentState!.validate();
                          checker
                              ? showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text('done'),
                                    content:
                                        const Text('sucessfully submitted'),
                                    actions: [
                                      TextButton(
                                        onPressed: () async {
                                          _storeRecords();
                                          _records.addAll(initialRecord);
                                          await httpRequest
                                              .addRecord(_records)
                                              .then((value) async {
                                            await dbHelper
                                                .insertIntoDb('name', value)
                                                .then((value) {
                                              Navigator.of(context).pop();
                                              Navigator.of(context).pop();
                                            });
                                          });
                                        },
                                        child: const Text('ok'),
                                      ),
                                    ],
                                  ),
                                )
                              : showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text('oops'),
                                    content: const Text(
                                        'kindly fill all fields and try again'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('ok'),
                                      ),
                                    ],
                                  ),
                                );
                        },
                        child: const Text('proceed'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('back'),
                      ),
                    ],
                  ),
                );
              },
              icon: Icon(
                Icons.done,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            label: 'DONE',
          ),
        ],
      ),
    );
  }
}
