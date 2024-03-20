import 'package:shared_preferences/shared_preferences.dart';

class UserStorageApp {
  static const String TOKEN = 'token';
  // Function LogIn
  Future<bool> loginstorage(String token) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString(TOKEN, token);

    return false;
  }

  Future<String?> getLocalToken(String key) async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(key);
  }
}
