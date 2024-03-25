import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageManager {
  static LocalStorageManager get instance => LocalStorageManager._internal();

  LocalStorageManager._internal();

  Future<SharedPreferences> _getSharePreference() async =>
      await SharedPreferences.getInstance();

  Future<bool> saveToCache(String key, String value) async {
    final pref = await _getSharePreference();
    return pref.setString(key, value);
  }

  Future<String?> getFromCache(String key) async {
    final pref = await _getSharePreference();
    return pref.getString(key);
  }
}
