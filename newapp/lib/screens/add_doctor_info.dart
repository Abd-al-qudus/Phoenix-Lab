import 'package:flutter/material.dart';
import '../models/doctors_provider.dart';
import 'package:provider/provider.dart';

import '../models/http_provider.dart';

class AddDoctorInfo extends StatefulWidget {
  static const routeName = '/add-doctor-info';
  const AddDoctorInfo({Key? key}) : super(key: key);

  @override
  State<AddDoctorInfo> createState() => _AddDoctorInfoState();
}

class _AddDoctorInfoState extends State<AddDoctorInfo> {
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();
  late TextEditingController firstName;
  late TextEditingController lastName;
  late TextEditingController department;
  late TextEditingController phoneNumber;
  late TextEditingController gender;
  late TextEditingController level;
  late TextEditingController emailAddress;

  final httpRequests = HttpRequests();
  @override
  void initState() {
    firstName = TextEditingController();
    lastName = TextEditingController();
    department = TextEditingController();
    phoneNumber = TextEditingController();
    gender = TextEditingController();
    level = TextEditingController();
    emailAddress = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    firstName.dispose();
    lastName.dispose();
    department.dispose();
    phoneNumber.dispose();
    gender.dispose();
    level.dispose();
    emailAddress.dispose();
    super.dispose();
  }

  Widget _textOverviewBuilder({
    required String labelText,
    required var controller,
    TextInputType keyboardInputType = TextInputType.name,
  }) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          labelText: labelText,
        ),
        controller: controller,
        keyboardType: keyboardInputType,
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
  Widget build(BuildContext context) {
    // final doctorsProvider = Provider.of<DoctorsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ADD DOCTOR INFO.',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Form(
                    key: formKey,
                    child: Column(
                      children: <Widget>[
                        _textOverviewBuilder(
                          labelText: 'First Name',
                          controller: firstName,
                        ),
                        _textOverviewBuilder(
                          labelText: 'Last Name',
                          controller: lastName,
                        ),
                        _textOverviewBuilder(
                          labelText: 'Department',
                          controller: department,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              labelText: 'Email Address',
                            ),
                            controller: emailAddress,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              return RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(value!)
                                  ? null
                                  : "Please enter valid Email";
                            },
                          ),
                        ),
                        _textOverviewBuilder(
                          labelText: 'Phone Number',
                          controller: phoneNumber,
                          keyboardInputType: TextInputType.number,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                'Gender',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ),
                            TextButton.icon(
                              onPressed: () {
                                gender.text = 'male';
                              },
                              icon: const Icon(Icons.male),
                              label: const Text('Male'),
                            ),
                            TextButton.icon(
                              onPressed: () {
                                gender.text = 'female';
                              },
                              icon: const Icon(Icons.male),
                              label: const Text('Female'),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                'Level',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ),
                            TextButton.icon(
                              onPressed: () {
                                level.text = 'junior';
                              },
                              icon: const Icon(Icons.low_priority),
                              label: const Text('Junior'),
                            ),
                            TextButton.icon(
                              onPressed: () {
                                level.text = 'intermediate';
                              },
                              icon: const Icon(Icons.priority_high),
                              label: const Text('Mid.'),
                            ),
                            TextButton.icon(
                              onPressed: () {
                                level.text = 'senior';
                              },
                              icon: const Icon(Icons.priority_high_rounded),
                              label: const Text('senior'),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: TextButton(
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                setState(() {
                                  isLoading = true;
                                });
                                await httpRequests
                                    .uploadDoctorsModel(
                                  firstName.text,
                                  lastName.text,
                                  department.text,
                                  phoneNumber.text,
                                  level.text,
                                  gender.text,
                                  emailAddress.text,
                                )
                                    .then(
                                  (docId) {
                                    if (docId == httpRequests.successCode) {
                                      // doctorsProvider.addDoctorsInfo(
                                      //     id: docId,
                                      //     firstName: firstName.text,
                                      //     lastName: lastName.text,
                                      //     department: department.text,
                                      //     phoneNumber: phoneNumber.text,
                                      //     emailAddress: emailAddress.text,
                                      //     level: level.text,
                                      //     gender: gender.text);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content:
                                              Text('item added sucessfully'),
                                        ),
                                      );
                                      Navigator.of(context).pop(true);
                                    } else {
                                      setState(() {
                                        isLoading = false;
                                      });
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(docId),
                                        ),
                                      );
                                    }
                                  },
                                );
                              }
                              return;
                            },
                            child: const Text('SAVE'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
