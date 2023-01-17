import 'dart:convert';

class StudentInfoModel {
  late String firstName;
  late String lastName;
  late String middleName;
  late String sex;
  late int age;
  late String contact;
  late String level;
  late String department;
  late String homeAddress;
  late String id;
  late String guardianFirstName;
  late String guardianLastName;
  late String guardianContact;

  StudentInfoModel({
    required this.firstName,
    required this.lastName,
    required this.middleName,
    required this.age,
    required this.id,
    required this.contact,
    required this.level,
    required this.sex,
    required this.department,
    required this.guardianFirstName,
    required this.guardianLastName,
    required this.guardianContact,
    required this.homeAddress,
  });

  StudentInfoModel.fromJson(Map<String, String> json) {
    firstName = json['firstName']!;
    lastName = json['lastName']!;
    middleName = json['middleName']!;
    age = int.parse(json['age']!);
    id = json['id']!;
    contact = json['contact']!;
    level = json['level']!;
    sex = json['sex']!;
    department = json['department']!;
    guardianFirstName = json['guardianFirstName']!;
    guardianLastName = json['guardianLastName']!;
    guardianContact = json['guardianContact']!;
    homeAddress = json['homeAddress']!;
  }

  String toJson(
      {required String firstName,
      required String lastName,
      required String middleName,
      required String sex,
      required int age,
      required String contact,
      required String level,
      required String department,
      required String id,
      required String guardianFirstName,
      required String guardianLastName,
      required String guardianContact,
      required String homeAddress}) {
    return jsonEncode({
      'firstName': firstName,
      'lastName': lastName,
      'middleName': middleName,
      'sex': sex,
      'age': age.toString(),
      'contact': contact,
      'department': department,
      'level': level,
      'id': id,
      'guardianFirstName': guardianFirstName,
      'guardianLastName': guardianLastName,
      'guardianContact': guardianContact,
      'homeAddress': homeAddress,
    });
  }
}
