import 'package:shared_preferences/shared_preferences.dart';

class UserStorageApp {
  static const String Email_key = 'email';
  static const String Password_Key = 'password';

  // Function LogIn
  Future<bool> login(String email, String password) async {
    final pref = await SharedPreferences.getInstance();
    final storeEmail = pref.getString(Email_key);
    final storePassword = pref.getString(Password_Key);

    return storeEmail == email && storePassword == password;
  }

  // Function Register
  Future<void> register(String email, String password) async {
    final pref = await SharedPreferences.getInstance();

    await pref.setString(Email_key, email);
    await pref.setString(Password_Key, password);
  }

  // Is LogIn
  Future<bool> isLogIn() async {
    final pref = await SharedPreferences.getInstance();
    return pref.containsKey(Email_key) && pref.containsKey(Password_Key);
  }
}
