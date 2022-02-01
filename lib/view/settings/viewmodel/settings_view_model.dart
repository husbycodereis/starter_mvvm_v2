import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:movies_catalog/core/base/model/base_view_model.dart';
import 'package:movies_catalog/core/components/models/user/user.dart';
import 'package:movies_catalog/core/constants/navigation/navigation_constants.dart';
import 'package:movies_catalog/core/init/provider/notifiers/theme_notifier.dart';
import 'package:provider/provider.dart';


import '../model/settings_dynamic_model.dart';

part 'settings_view_model.g.dart';
part 'subviewmodel/about_view_model.dart';

class SettingsViewModel = _SettingsViewModelBase with _$SettingsViewModel;

abstract class _SettingsViewModelBase with Store, BaseViewModel {
  final userModel = UserModel.fake();

 

  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {}

  void changeAppTheme() {
    context!.read<ThemeNotifier>().changeTheme();
  }


  Future<void> logoutApp() async {
    await navigation.navigateToPageClear(path: NavigationConstants.LOGIN_VIEW);
  }

  Future<void> navigateToOnboard() async {
    await navigation.navigateToPage(path: NavigationConstants.ON_BOARD);
  }
}
