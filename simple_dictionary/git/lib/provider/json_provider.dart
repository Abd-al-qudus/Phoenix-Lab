import 'package:flutter/services.dart';

Future<String> loadDictData() async {
  return await rootBundle
      .loadString('assets/json/simple_english_dictionary.json');
}
