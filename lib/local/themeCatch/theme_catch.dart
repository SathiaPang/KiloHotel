import 'package:shared_preferences/shared_preferences.dart';

class ThemeCatch {
  static ThemeCatch get instance => ThemeCatch._internal();
  ThemeCatch._internal();

  Future<SharedPreferences> _getSharedPreferences() async =>
      await SharedPreferences.getInstance();

  Future<bool> saveUserTheme(bool chosenTheme) async {
    final pref = await _getSharedPreferences();
    return pref.setBool('theme', chosenTheme);
  }

  Future<bool> getUserTheme() async {
    final pref = await _getSharedPreferences();
    return pref.getBool('theme') ?? false;
  }
}
