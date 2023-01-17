import 'dart:convert';

class QuizModel {
  late String id;
  late String title;
  late String course;
  late String timeAllowed;
  late DateTime dateTime;
  late bool isGraded;

  QuizModel({
    required this.id,
    required this.title,
    required this.course,
    required this.timeAllowed,
    required this.dateTime,
    this.isGraded = false,
  });

  QuizModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    course = json['course'];
    dateTime = json['dateTime'];
    timeAllowed = json['timeAllowed'];
    isGraded = json['isGraded'];
  }

  String toJson({
    required String id,
    required String title,
    required String course,
    required DateTime dateTime,
    required String timeAllowed,
    required bool isGraded,
  }) {
    return jsonEncode({
      'id': id,
      'title': title,
      'course': course,
      'dateTime': dateTime,
      'timeAllowed': timeAllowed,
      'isGraded': isGraded,
    });
  }
}
