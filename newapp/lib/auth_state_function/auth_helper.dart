import 'package:shared_preferences/shared_preferences.dart';

class AuthHelper {
  static String userLoggedInKey = 'LOGGEDINKEY';
  static String userEmailKey = 'USERMAILKEY';
  static String userNameKey = 'USERNAMEKEY';

  static Future<bool?> getUserLoggedInStatus(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }
}
