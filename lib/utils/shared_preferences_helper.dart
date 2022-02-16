import 'package:shared_preferences/shared_preferences.dart';

const String AUTH_TOKEN_KEY_STRING = "auth_token_id_key";

class SharedPreferencesHelper {
  final SharedPreferences prefs;
  static late SharedPreferencesHelper instance;

  SharedPreferencesHelper._(this.prefs);

  static Future<void> createInstance() async {
    instance = SharedPreferencesHelper._(await SharedPreferences.getInstance());
  }

  void putBool(String key, bool value) {
    prefs.setBool(key, value);
  }

  bool? getBool(String key, {bool defaultValue = false}) {
    if (prefs.containsKey(key)) {
      return prefs.getBool(key);
    }
    return defaultValue;
  }

  void putDouble(String key, double value) {
    prefs.setDouble(key, value);
  }

  double? getDouble(String key, {double defaultValue = 0.0}) {
    if (prefs.containsKey(key)) {
      return prefs.getDouble(key);
    }
    return defaultValue;
  }

  void putString(String key, String value) {
    prefs.setString(key, value);
  }

  String? getString(String key, {String defaultValue = ""}) {
    if (prefs.containsKey(key)) {
      return prefs.getString(key);
    }
    return defaultValue;
  }

  void putInt(String key, int value) {
    prefs.setInt(key, value);
  }

  int? getInt(String key, {int defaultValue = 0}) {
    if (prefs.containsKey(key)) {
      return prefs.getInt(key);
    }
    return defaultValue;
  }

  Future<bool> logout() async {
    return prefs.clear();
  }
}