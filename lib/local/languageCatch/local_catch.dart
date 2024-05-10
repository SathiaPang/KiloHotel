import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';

class LocalCatch {
  static LocalCatch get instance => LocalCatch._internal();
  LocalCatch._internal();

  Future<SharedPreferences> _getSharedPreferences() async =>
      await SharedPreferences.getInstance();

  Future<bool> saveLanguage(String langeCode) async {
    final pref = await _getSharedPreferences();
    return pref.setString("language", langeCode);
  }

  Future<Locale> getLangeLocale() async {
    final pref = await _getSharedPreferences();
    final code = pref.getString("language");
    return Locale(code ?? "en_US");
  }
}
