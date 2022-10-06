import 'package:flutter/material.dart';

import '../models/http_provider.dart';

class EditDoctorInfo extends StatelessWidget {
  static const routeName = '/edit-doctor-info';
  const EditDoctorInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List doctorInfo = ModalRoute.of(context)!.settings.arguments as List;
    return EditDoctorInfoBody(doctorDetails: doctorInfo);
  }
}

class EditDoctorInfoBody extends StatefulWidget {
  final List doctorDetails;
  const EditDoctorInfoBody({Key? key, required this.doctorDetails})
      : super(key: key);

  @override
  State<EditDoctorInfoBody> createState() => _EditDoctorInfoBodyState();
}

class _EditDoctorInfoBodyState extends State<EditDoctorInfoBody> {
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();
  final httpRequests = HttpRequests();
  late TextEditingController firstName;
  late TextEditingController lastName;
  late TextEditingController department;
  late TextEditingController phoneNumber;
  late TextEditingController gender;
  late TextEditingController level;
  late TextEditingController emailAddress;

  @override
  void initState() {
    firstName = TextEditingController(text: widget.doctorDetails[0].firstName);
    lastName = TextEditingController(text: widget.doctorDetails[0].lastName);
    department =
        TextEditingController(text: widget.doctorDetails[0].department);
    phoneNumber =
        TextEditingController(text: widget.doctorDetails[0].phoneNumber);
    gender = TextEditingController(text: widget.doctorDetails[0].gender);
    level = TextEditingController(text: widget.doctorDetails[0].level);
    emailAddress =
        TextEditingController(text: widget.doctorDetails[0].emailAddress);
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
              return 'Field cannot be empty';
            }
            return null;
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'EDIT DOCTOR INFO.',
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
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    _textOverviewBuilder(
                      labelText: 'First Name',
                      controller: firstName,
                    ), //price
                    _textOverviewBuilder(
                      labelText: 'Last Name',
                      controller: lastName,
                    ), //status
                    _textOverviewBuilder(
                      labelText: 'Department',
                      controller: department,
                    ), //name
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
                    //name
                    _textOverviewBuilder(
                      labelText: 'Phone Number',
                      controller: phoneNumber,
                      keyboardInputType: TextInputType.number,
                    ), //dosage //description
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
                      padding: const EdgeInsets.all(10.0),
                      child: TextButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            setState(() {
                              isLoading = true;
                            });
                            await httpRequests
                                .editDoctorInfo(
                              firstName.text,
                              lastName.text,
                              department.text,
                              phoneNumber.text,
                              level.text,
                              widget.doctorDetails[0].id,
                              gender.text,
                              emailAddress.text,
                            )
                                .then((response) {
                              if (response == httpRequests.successCode) {
                                // doctorsProvider.editDoctorsInfo(
                                //     id: widget.doctorDetails[0].id,
                                //     firstName: firstName.text,
                                //     lastName: lastName.text,
                                //     department: department.text,
                                //     phoneNumber: phoneNumber.text,
                                //     emailAddress: emailAddress.text,
                                //     level: level.text,
                                //     gender: gender.text);
                                Navigator.of(context).pop(true);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('item edited sucessfully'),
                                  ),
                                );
                              } else {
                                setState(() {
                                  isLoading = false;
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(response),
                                  ),
                                );
                              }
                            });
                          }
                          return;
                        },
                        child: const Text('SAVE'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
