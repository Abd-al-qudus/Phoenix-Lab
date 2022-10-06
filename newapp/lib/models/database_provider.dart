import 'package:shared_preferences/shared_preferences.dart';

class DatabaseProvider {
  final String loginStatus = 'STATUS';

  Future saveUserLoginStatus(bool status) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(loginStatus, status);
  }

  Future<bool> getUserLoginStatus(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key)!;
  }
}
