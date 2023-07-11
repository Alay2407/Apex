import 'package:shared_preferences/shared_preferences.dart';

class PrefManager {
  static final String IS_LOGIN = 'isLogin';
  static final String IS_VISITED = 'isVisited';
  static final String LOGIN_NAME = "lname";
  static final String LOGIN_EMAIL = "Lmail";

  static late SharedPreferences _preferences;

  static Future<SharedPreferences?> init() async {
    _preferences = await SharedPreferences.getInstance();
    return _preferences;
  }

  static void updateLoginStatus(bool status) async {
    await _preferences.setBool(IS_LOGIN, status);
  }

  static bool getLoginStatus() {
    return _preferences.getBool(IS_LOGIN) ?? false;
  }

  static void updateOnboardingStatus(bool status) async {
    await _preferences.setBool(IS_VISITED, status);
  }

  static bool getVisitedStatus() {
    return _preferences.getBool(IS_VISITED) ?? false;
  }

  static Future<void> clearData() async {
    await _preferences.clear();
  }

  static Future<void> logout() async {
    await _preferences.remove(IS_LOGIN);
  }

  static void setLoginName(String value) async {
    await _preferences.setString(LOGIN_NAME, value);
  }

  static String getLoginName() {
    return _preferences.getString(LOGIN_NAME) ?? 'Defalut User';
  }

  static void setLoginEmail(String value) async {
    await _preferences.setString(LOGIN_EMAIL, value);
  }

  static String getLoginEmail() {
    return _preferences.getString(LOGIN_EMAIL) ?? 'Defalut Email id';
  }
}
