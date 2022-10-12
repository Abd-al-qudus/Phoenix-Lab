import 'package:shared_preferences/shared_preferences.dart';

class DatabaseProvider {
  final String loginStatus = 'STATUS';
  final String userID = 'USEREMAIL';

  Future<SharedPreferences> initPrefs() async {
    return await SharedPreferences.getInstance();
  }

  Future saveUserLoginStatus(bool status) async {
    final prefs = await initPrefs();
    return prefs.setBool(loginStatus, status);
  }

  Future<bool> getUserLoginStatus(String key) async {
    final prefs = await initPrefs();
    return prefs.getBool(key)!;
  }

  Future saveUserId(String email, String id) async {
    final prefs = await initPrefs();
    return prefs.setString(email, id);
  }

  Future getUserId(String id) async {
    final prefs = await initPrefs();
    return prefs.getString(id);
  }

  Future saveRecordId(String userId, String recordId) async {
    final prefs = await initPrefs();
    return prefs.setString(userId, recordId);
  }

  Future getRecordId(String id) async {
    final prefs = await initPrefs();
    return prefs.getString(id);
  }
}
