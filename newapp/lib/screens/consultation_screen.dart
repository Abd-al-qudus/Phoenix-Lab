import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:newapp/screens/chat_with_doctor_screen.dart';

import '../screens/add_doctor_info.dart';
import '../screens/edit_doctor_info.dart';
import '../models/doctors_model.dart';
import '../models/http_provider.dart';

class ConsultationScreen extends StatefulWidget {
  static const routeName = '/consultation';
  const ConsultationScreen({Key? key}) : super(key: key);

  @override
  State<ConsultationScreen> createState() => _ConsultationScreenState();
}

class _ConsultationScreenState extends State<ConsultationScreen> {
  final List<DoctorsModel> _doctors = [];
  final httpRequest = HttpRequests();
  late Future _future;

  @override
  void initState() {
    _future = httpRequest.getDoctorsModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CONSULTATION',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              Navigator.of(context)
                  .pushNamed(AddDoctorInfo.routeName)
                  .then((value) {
                if (value == true) {
                  setState(() {
                    _future = httpRequest.getDoctorsModel();
                  });
                }
              });
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final Map recordMap = snapshot.data as Map;
          for (var id in recordMap.keys) {
            final doctorsRecord = DoctorsModel(
                firstName: recordMap[id]['firstName'],
                lastName: recordMap[id]['lastName'],
                department: recordMap[id]['department'],
                phoneNumber: recordMap[id]['phoneNumber'],
                level: recordMap[id]['level'],
                gender: recordMap[id]['gender'],
                emailAddress: recordMap[id]['emailAddress'],
                id: id);
            final index = _doctors.indexWhere((element) => element.id == id);
            if (index < 0) {
              _doctors.add(doctorsRecord);
            } else {
              _doctors.removeAt(index);
              _doctors.add(doctorsRecord);
            }
          }
          return ListView.builder(
            itemBuilder: (context, index) => ListTile(
              onTap: () => Navigator.of(context)
                  .pushNamed(ChatWithDoctorScreen.routeName, arguments: {
                'firstName': _doctors[index].firstName,
                'lastName': _doctors[index].lastName,
                'emailAddress': _doctors[index].emailAddress,
              }),
              onLongPress: () => showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  actionsAlignment: MainAxisAlignment.spaceBetween,
                  title: const Center(child: Text('options')),
                  content: const Text('Edit or Delete'),
                  actions: [
                    TextButton(
                      onPressed: () async {
                        Navigator.of(context).pop();
                        await Navigator.of(context).pushNamed(
                            EditDoctorInfo.routeName,
                            arguments: [_doctors[index]]).then((value) {
                          setState(() {
                            _future = httpRequest.getDoctorsModel();
                          });
                        });
                      },
                      child: const Text('Edit'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('confirm action'),
                            content:
                                const Text('Do you want to delete this item?'),
                            actionsAlignment: MainAxisAlignment.spaceBetween,
                            actions: [
                              TextButton(
                                onPressed: () async {
                                  await httpRequest
                                      .deleteDoctorInfo(_doctors[index].id)
                                      .then((value) {
                                    Navigator.of(context).pop();
                                    _doctors.remove(_doctors[index]);
                                  });
                                  setState(() {
                                    _future = httpRequest.getDoctorsModel();
                                  });
                                },
                                child: const Text('yes'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('no'),
                              ),
                            ],
                          ),
                        );
                      },
                      child: const Text('Delete'),
                    ),
                  ],
                ),
              ),
              title: Text(
                '${_doctors[index].firstName.toUpperCase()}, ${_doctors[index].lastName}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _doctors[index].department,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    _doctors[index].level,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              leading: _doctors[index].gender == 'male'
                  ? const CircleAvatar(child: Icon(Icons.male))
                  : const CircleAvatar(child: Icon(Icons.female)),
              trailing: IconButton(
                icon: const Icon(Icons.call),
                onPressed: () async {
                  await FlutterPhoneDirectCaller.callNumber(
                      _doctors[index].phoneNumber);
                },
              ),
            ),
            itemCount: _doctors.length,
          );
        },
      ),
    );
  }
}
