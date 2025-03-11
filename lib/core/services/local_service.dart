import 'package:shared_preferences/shared_preferences.dart';

class LocalService {
  static const String _localKey = "Language"; // The key for storing the language

  static late SharedPreferences _preferences;

  // Initialize shared preferences
  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // Get the saved locale/language
  static String? getLocale() {
    return _preferences.getString(_localKey); // Return the saved language or null
  }

  // Save the selected locale/language
  static Future<void> saveLocale(String language) async {
    await _preferences.setString(_localKey, language); // Save the language to shared preferences
  }
}
