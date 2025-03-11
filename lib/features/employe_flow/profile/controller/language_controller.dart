import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planiq/core/services/local_service.dart';

class LanguageController extends GetxController {
  var selectedLanguage = "English".obs;

  @override
  void onInit() async {
    await LocalService.init(); // Initialize shared preferences
    String? savedLanguage = LocalService.getLocale(); // Get the saved language
    if (savedLanguage != null) {
      selectedLanguage.value = savedLanguage; // Set the selected language
      updateLocale(savedLanguage); // Update the locale
    }
    super.onInit();
  }

  // Function to update the app's locale
  void updateLocale(String language) {
    Locale locale;
    switch (language) {
      case "French":
        locale = const Locale('fr'); // Set locale for French
        break;
      case "Dutch":
        locale = const Locale('nl'); // Set locale for Dutch
        break;
      default:
        locale = const Locale('en'); // Default to English
        break;
    }

    // Update the app's locale
    Get.updateLocale(locale);

    // Update selected language
    selectedLanguage.value = language;

    // Save the selected language in shared preferences for persistence
    LocalService.saveLocale(language);
  }
}
