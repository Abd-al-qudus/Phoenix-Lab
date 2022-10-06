import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class PatientModel {
  final String hospitalAdd;
  final String regStreetAdd;
  final String regStreetAddCont;
  final String regCity;
  final String regState;
  final String regCountry;
  final String hospCode;
  final String hospPhoneNumber;
  final String chartNumber;
  final String regClerkNumber;
  final String regLocation;
  final String regDate;
  final String regTime;
  final String firstName;
  final String middleName;
  final String lastName;
  final String homeAdd;
  final String homeAddCont;
  final String city;
  final String state;
  final String postalCode;
  final String country;
  final String phoneNumber;
  final String email;
  final String sex;
  final String dob;
  final String maritalStatus;
  final String nokFirstName;
  final String nokLastName;
  final String nokNumber;
  final String relationship;
  final String familyDrName;
  final String familyDrNumber;
  final String regReason;
  final String currentHealthStat;
  final String addNotes;

  PatientModel({
    required this.regStreetAdd,
    required this.hospitalAdd,
    required this.regStreetAddCont,
    required this.regCity,
    required this.regState,
    required this.regCountry,
    required this.hospPhoneNumber,
    required this.hospCode,
    required this.chartNumber,
    required this.regClerkNumber,
    required this.regLocation,
    required this.regDate,
    required this.regTime,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.homeAdd,
    required this.homeAddCont,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
    required this.phoneNumber,
    required this.email,
    required this.sex,
    required this.dob,
    required this.maritalStatus,
    required this.nokFirstName,
    required this.nokLastName,
    required this.nokNumber,
    required this.relationship,
    required this.familyDrName,
    required this.familyDrNumber,
    required this.regReason,
    required this.currentHealthStat,
    required this.addNotes,
  });
}

class PatientRecordProvider with ChangeNotifier {
  final List<Map> _record = [];

  List<Map> get record {
    return [..._record];
  }

  void addRecordId(Map newRecord) {
    _record.add(newRecord);
    notifyListeners();
  }
}
