// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/cash_helper.dart';
// import 'package:flutter_application_1/theme/lang_constans.dart';

// class LocaleManager with ChangeNotifier {
//   Locale _locale = const Locale('en');
//   Locale get locale => _locale;

//   LocaleManager() {
//     final savedLang = CashHelper.getData(key: 'langCode') ?? 'en';
//     _locale = Locale(savedLang);
//     AppStrings.load(savedLang);
//   }

//   void toggleLanguage() async {
//     final newLang = _locale.languageCode == 'en' ? 'ar' : 'en';
//     await AppStrings.load(newLang); // load JSON first
//     _locale = Locale(newLang); // then update locale
//     await CashHelper.saveData(key: 'langCode', value: newLang);
//     notifyListeners(); // now rebuild UI safely
//   }
// }
