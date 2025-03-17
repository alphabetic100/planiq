import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileService {
  static const String _nameKey = 'name';
  static const String _personIDKey = 'personID';
  static const String _profileImageKey = 'profileImage';

  // Singleton instance for SharedPreferences
  static late SharedPreferences _preferences;

  // Private variables to hold profile data
  static String? _name;
  static String? _personID;
  static String? _profileImage;

  // Initialize SharedPreferences (call this during app startup)
  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
    // Load profile data from SharedPreferences into private variables
    _name = _preferences.getString(_nameKey);
    _personID = _preferences.getString(_personIDKey);
    _profileImage = _preferences.getString(_profileImageKey);
    log("Profile Service Initialized");
  }

  // Save profile data to local storage
  static Future<void> saveProfile({
    required String name,
    required String personID,
    required String profileImage,
  }) async {
    try {
      await _preferences.setString(_nameKey, name);
      await _preferences.setString(_personIDKey, personID);
      await _preferences.setString(_profileImageKey, profileImage);

      _name = name;
      _personID = personID;
      _profileImage = profileImage;
    } catch (e) {
      log('Error saving profile data: $e');
    }
  }

  // Get saved profile name
  static String? get name => _name;

  // Get saved person ID
  static String? get personID => _personID;

  // Get saved profile image
  static String? get profileImage => _profileImage;

  // Clear profile data (optional, for logout or clearing data)
  static Future<void> clearProfile() async {
    try {
      // Clear profile data from SharedPreferences
      await _preferences.remove(_nameKey);
      await _preferences.remove(_personIDKey);
      await _preferences.remove(_profileImageKey);

      // Reset private variables
      _name = null;
      _personID = null;
      _profileImage = null;
    } catch (e) {
      log('Error clearing profile data: $e');
    }
  }
}
