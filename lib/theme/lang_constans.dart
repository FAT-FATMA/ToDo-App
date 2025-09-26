// import 'dart:convert';
// import 'package:flutter/services.dart';

// class AppStrings {
//   static Map<String, String> values = {};

//   static Future<void> load(String langCode) async {
//     final jsonString = await rootBundle.loadString('assets/lang/$langCode.json');
//     final Map<String, dynamic> jsonMap = json.decode(jsonString);
//     values = jsonMap.map((key, value) => MapEntry(key, value.toString()));
//   }

//   static String get(String key) => values[key] ?? key;
// }