import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static Future<bool> setString(
      {required String key, required String value}) async {
    final pref = await SharedPreferences.getInstance();
    return pref.setString(key, value);
  }

  static Future<bool> setInt({required String key, required int value}) async {
    final pref = await SharedPreferences.getInstance();
    return pref.setInt(key, value);
  }

  static Future<bool> setDouble(
      {required String key, required double value}) async {
    final pref = await SharedPreferences.getInstance();
    return pref.setDouble(key, value);
  }

  static Future<bool> setBool(
      {required String key, required bool value}) async {
    final pref = await SharedPreferences.getInstance();
    return pref.setBool(key, value);
  }

  static Future<String?> getString({required String key}) async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(key);
  }

  static Future<int?> getInt({required String key}) async {
    final pref = await SharedPreferences.getInstance();
    return pref.getInt(key);
  }

  static Future<double?> getDouble({required String key}) async {
    final pref = await SharedPreferences.getInstance();
    return pref.getDouble(key);
  }

  static Future<bool?> getBool({required String key}) async {
    final pref = await SharedPreferences.getInstance();
    return pref.getBool(key);
  }

  static Future<dynamic> removeKey({required String key}) async {
    final pref = await SharedPreferences.getInstance();
    return pref.remove(key);
  }
}
