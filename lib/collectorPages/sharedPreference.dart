import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static SharedPreferencesHelper? _instance;
  static SharedPreferences? _preferences;

  static Future<SharedPreferencesHelper> getInstance() async {
    _instance ??= SharedPreferencesHelper();
    _preferences ??= await SharedPreferences.getInstance();
    return _instance!;
  }

  // Save data to shared preferences
  Future<bool> setString(String key, String value) async {
    return _preferences!.setString(key, value);
  }

  // Retrieve data from shared preferences
  String? getString(String key) {
    return _preferences!.getString(key);
  }

  // Clear all data from shared preferences
  Future<bool> clear() async {
    return _preferences!.clear();
  }
}
