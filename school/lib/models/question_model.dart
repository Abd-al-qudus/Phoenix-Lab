import 'dart:convert';

class QuestionModel {
  late String id;
  late String question;
  late List? answers;
  late int? corOption;
  late int? chosenOption;

  QuestionModel(
      {required this.id,
      required this.question,
      required this.answers,
      required this.chosenOption,
      required this.corOption});

  QuestionModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    question = json['question'];
    answers = json['answers'];
    corOption = json['corOption'];
    chosenOption = json['chosenOption'];

    String toJson(
        {required String id,
        required String question,
        required List answers,
        required String chosenOption,
        required String corOption}) {
      return jsonEncode({
        'id': id,
        'question': question,
        'answers': answers,
        'corOption': corOption,
        'chosenOption': chosenOption,
      });
    }
  }
}
