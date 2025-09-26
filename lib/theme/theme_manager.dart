import 'package:flutter/material.dart';
import 'package:flutter_application_1/cash_helper.dart';


class ThemeManager with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;

  ThemeManager() {
    // Load saved theme when ThemeManager is created
    bool? isDark = CashHelper.getData(key: 'isDark');
    if (isDark != null) {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    }
  }

  void toggleTheme() {
    _themeMode =
        _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;

    // Save theme mode in cache
    CashHelper.saveData(
      key: 'isDark',
      value: _themeMode == ThemeMode.dark,
    );

    notifyListeners();
  }
}

