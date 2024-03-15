import 'package:shared_preferences/shared_preferences.dart';

class BaseSharedPreferencesRepo {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> setInt(String key, int value) async {
    SharedPreferences prefs = await _prefs;
    prefs.setInt(key, value).then((bool success) {
      return success;
    });
  }

  Future<void> setDouble(String key, double value) async {
    SharedPreferences prefs = await _prefs;
    prefs.setDouble(key, value).then((bool success) {
      return success;
    });
  }

  Future<void> setBool(String key, bool value) async {
    SharedPreferences prefs = await _prefs;
    prefs.setBool(key, value).then((bool success) {
      return success;
    });
  }

  Future<void> setString(String key, String value) async {
    SharedPreferences prefs = await _prefs;
    prefs.setString(key, value).then((bool success) {
      return success;
    });
  }

  Future<int> getInt(String key) async {
    SharedPreferences prefs = await _prefs;
    int value = (prefs.getInt(key) ?? 0);
    return value;
  }

  Future<double> getDouble(String key) async {
    SharedPreferences prefs = await _prefs;
    double value = (prefs.getDouble(key) ?? 0);
    return value;
  }

  Future<bool> getBool(String key) async {
    SharedPreferences prefs = await _prefs;
    bool value = (prefs.getBool(key) ?? false);
    return value;
  }

  Future<String> getString(String key) async {
    SharedPreferences prefs = await _prefs;
    String value = (prefs.getString(key) ?? "");
    return value;
  }
}
