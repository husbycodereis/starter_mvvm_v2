import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:movies_catalog/core/base/model/base_view_model.dart';
import 'package:movies_catalog/core/components/models/user/user.dart';
import 'package:movies_catalog/core/constants/enums/locale_keys_enum.dart';
import 'package:movies_catalog/core/constants/navigation/navigation_constants.dart';
import 'package:movies_catalog/core/init/di/locator.dart';

import '../../../core/init/theme/view_model/theme_view_model.dart';
import '../model/settings_dynamic_model.dart';

part 'settings_view_model.g.dart';
part 'subviewmodel/about_view_model.dart';

class SettingsViewModel = _SettingsViewModelBase with _$SettingsViewModel;

abstract class _SettingsViewModelBase with Store, BaseViewModel {
  final userModel = UserModel.fake();
  late BuildContext buildContext;
  @override
  void setContext(BuildContext context) => buildContext = context;
  @override
  void init() {}

  void changeAppTheme(String theme) {
    locator<ThemeViewModel>().setThemeMode(theme);
  }

  Future<void> logoutApp() async {
    await sharedPrefManager.setStringValue(SharedPrefKeys.TOKEN, '');
    await navigation.navigateToPageClear(path: NavigationConstants.LOGIN_VIEW);
  }
}
