import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planiq/core/services/local_service.dart';

class LanguageController extends GetxController {
  var selectedLanguage = "English".obs;

  @override
  void onInit() async {
    await LocalService.init();
    String? savedLanguage = LocalService.getLocale();
    if (savedLanguage != null) {
      selectedLanguage.value = savedLanguage;
      updateLocale(savedLanguage);
    }
    super.onInit();
  }

  // Function to update the app's locale
  void updateLocale(String language) {
    Locale locale;
    switch (language) {
      case "French":
        locale = const Locale('fr');
        break;
      case "Dutch":
        locale = const Locale('nl');
        break;
      default:
        locale = const Locale('en');
        break;
    }

    Get.updateLocale(locale);

    selectedLanguage.value = language;

    LocalService.saveLocale(language);
  }
}
