import 'package:flutter/material.dart';

import '../models/http_provider.dart';

class AddDoctorInfo extends StatefulWidget {
  static const routeName = '/add-doctor-info';
  const AddDoctorInfo({Key? key}) : super(key: key);

  @override
  State<AddDoctorInfo> createState() => _AddDoctorInfoState();
}

class _AddDoctorInfoState extends State<AddDoctorInfo> {
  final httpRequests = HttpRequests();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController department = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController level = TextEditingController();
  TextEditingController emailAddress = TextEditingController();

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
          return value;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Column(
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
              _textOverviewBuilder(
                labelText: 'Email Address',
                controller: emailAddress,
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
                    if (firstName.text.isNotEmpty &&
                        lastName.text.isNotEmpty &&
                        gender.text.isNotEmpty &&
                        level.text.isNotEmpty &&
                        phoneNumber.text.isNotEmpty &&
                        department.text.isNotEmpty &&
                        emailAddress.text.isNotEmpty &&
                        emailAddress.text.contains('@') == true) {
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
                            (value) => Navigator.of(context).pop(),
                          );
                    }
                    return;
                  },
                  child: const Text('SAVE'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
