import 'package:shared_preferences/shared_preferences.dart';

class AppThemePreferences {
  static const themeStatus = "THEMESTATUS";

  void setDarkTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(themeStatus, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool(themeStatus) ?? false;
  }
}
