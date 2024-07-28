import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<void> saveData({required String key, required String value}) async {
    await _preferences?.setString(key, value);
  }

  static String? getData({required String key}) {
    return _preferences?.getString(key);
  }
}
