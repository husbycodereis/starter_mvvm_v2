import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:movies_catalog/core/constants/enums/locale_keys_enum.dart';
import 'package:movies_catalog/core/init/cache/shared_prefs_manager.dart';

part 'theme_view_model.g.dart';

enum AppThemes { system, light, dark }

class ThemeViewModel = _ThemeViewModel with _$ThemeViewModel;

abstract class _ThemeViewModel with Store {
  _ThemeViewModel() {
    init();
  }
  // store variables:-----------------------------------------------------------

  @observable
  ThemeMode themeMode = ThemeMode.system;

  @observable
  String theme = AppThemes.system.name;

  // actions:-------------------------------------------------------------------
  @action
  ThemeMode setThemeMode(String theme) {
    this.theme = theme;
    switch (theme) {
      case 'system':
        themeMode = ThemeMode.system;
        SharedPrefsManager.instance.setStringValue(SharedPrefKeys.THEME, theme);
        return themeMode;
      case 'light':
        themeMode = ThemeMode.light;
        SharedPrefsManager.instance.setStringValue(SharedPrefKeys.THEME, theme);
        return themeMode;
      case 'dark':
        themeMode = ThemeMode.dark;
        SharedPrefsManager.instance.setStringValue(SharedPrefKeys.THEME, theme);

        return themeMode;
      default:
        return themeMode;
    }
  }

  // general methods:-----------------------------------------------------------
  @action
  Future init() async {
    final String theme = SharedPrefsManager.instance.getStringValue(SharedPrefKeys.THEME);
    setThemeMode(theme);
  }
}
