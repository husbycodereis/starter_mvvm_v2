import 'package:flutter/material.dart';

import 'package:movies_catalog/core/constants/enums/locale_keys_enum.dart';
import 'package:movies_catalog/core/init/cache/shared_prefs_manager.dart';

import '../../theme/dark/app_theme_dark.dart';
import '../../theme/light/app_theme_light.dart';

class ThemeNotifier extends ChangeNotifier {
  late bool isDarkMode;
  late ThemeData _currentTheme;
  ThemeNotifier() {
    isDarkMode = SharedPrefsManager.instance.getBoolValue(SharedPrefKeys.DARKMODE);
    _currentTheme = isDarkMode ? AppThemeDark.instance.theme : AppThemeLight.instance.theme;
  }
  ThemeData get currentTheme => _currentTheme;

  void changeTheme() {
    if (!isDarkMode) {
      toggleDarkMode(value: true);
    } else {
      toggleDarkMode();
    }
    debugPrint(isDarkMode.toString());
    notifyListeners();
  }

  void toggleDarkMode({bool value = false}) {
    isDarkMode = value;
    _currentTheme = value ? AppThemeDark.instance.theme : AppThemeLight.instance.theme;
    SharedPrefsManager.instance.setBoolValue(SharedPrefKeys.DARKMODE, value: value);
  }
}
