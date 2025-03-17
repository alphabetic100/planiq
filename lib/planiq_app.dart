
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:planiq/core/bindings/controller_binder.dart';
import 'package:planiq/core/localization/app_localizations.dart';
import 'package:planiq/core/services/local_service.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';
import 'package:planiq/routes/app_routes.dart';
import 'core/utils/theme/theme.dart';

/// Utility class for platform-specific checks.
class PlatformUtils {
  static bool get isIOS =>
      foundation.defaultTargetPlatform == TargetPlatform.iOS;
  static bool get isAndroid =>
      foundation.defaultTargetPlatform == TargetPlatform.android;
}

class PlaniqApp extends StatelessWidget {
  const PlaniqApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var savedLocale =
        LocalService.getLocale() ?? Get.deviceLocale?.languageCode ?? 'en';
    return Sizer(
      builder: (context, orientation, deviceType) {
        switch (savedLocale) {
          case "French":
            savedLocale = 'fr';
            break;
          case "Dutch":
            savedLocale = 'nl';
            break;
          default:
            savedLocale = 'en';
            break;
        }

        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoute.init,
          translations: AppTranslations(),
          getPages: AppRoute.routes,
          initialBinding: ControllerBinder(),
          themeMode: ThemeMode.light,
          theme: _getLightTheme(),
          defaultTransition:
              PlatformUtils.isIOS ? Transition.cupertino : Transition.fade,
          locale: Locale(savedLocale),
          fallbackLocale: const Locale('en'),
          builder: (context, child) => PlatformUtils.isIOS
              ? CupertinoTheme(data: const CupertinoThemeData(), child: child!)
              : child!,
        );
      },
    );
  }

  ThemeData _getLightTheme() {
    return PlatformUtils.isIOS
        ? AppTheme.lightTheme.copyWith(platform: TargetPlatform.iOS)
        : AppTheme.lightTheme;
  }
}
