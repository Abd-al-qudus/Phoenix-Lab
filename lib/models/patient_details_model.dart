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
  List<String> _record = [];

  List<String> get record {
    return [..._record];
  }

  set records(newRecord) {
    _record = newRecord;
  }

  void addRecordId(Map recordId) {
    _record.add(recordId['name']);
    notifyListeners();
  }
}

class DbProvider {
  Future<sql.Database> _openDatabase() async {
    final dbPath = await sql.getDatabasesPath();
    final finalDbPath = path.join(dbPath, 'record.db');
    return await sql.openDatabase(finalDbPath, version: 1,
        onCreate: (sql.Database db, int version) async {
      await db.execute(
          'CREATE TABLE TEST (id INTEGER PRIMARY KEY, name TEXT, value TEXT');
    });
  }

  Future<void> insertIntoDb(String name, String value) async {
    final db = await _openDatabase();
    await db.insert(name, {'recordkey': value});
    await db.close();
  }

  Future<List> queryDb(String name) async {
    final db = await _openDatabase();
    return await db.query(name).then(
      (value) async {
        await db.close();
        return value;
      },
    );
  }

  Future<void> deleteRecord(String name) async {
    final dbPath = await sql.getDatabasesPath();
    final finalPath = path.join(dbPath, 'record.db');
    await sql.deleteDatabase(finalPath);
  }
}
