import 'package:fizzbuzz/bussiness_logic/models/theme_prefs_model.dart';
import 'package:flutter/material.dart';

class ThemeViewModel extends ChangeNotifier {
  //variable
  AppThemePreferences fizzBuzzPreferences = AppThemePreferences();
  bool _darkTheme = false;
  bool _startAnimation = false;
  bool _loading = false;
  double _scrollPosition = 0.0;

//getter
  bool get getDarkTheme => _darkTheme;
  bool get getStartAniamtion => _startAnimation;
  bool get getIsLoading => _loading;
  double get getScrollPosition => _scrollPosition;

//setter
  set setAnimation(bool value) {
    _startAnimation = value;
    notifyListeners();
  }

  set setDarkTheme(bool value) {
    _darkTheme = value;
    fizzBuzzPreferences.setDarkTheme(value);
    notifyListeners();
  }

  set setIsLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  set setScrollPosition(double value) {
    _scrollPosition = value;
    notifyListeners();
  }
}
