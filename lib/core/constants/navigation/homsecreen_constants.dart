import 'package:flutter/material.dart';
import 'package:movies_catalog/view/settings/view/settings_view.dart';

enum HomeScreenConstantsEnum {
  HOME_VIEW,
  SETTINGS_VIEW,
}

extension HomeScreenRouteNamesExtension on HomeScreenConstantsEnum {
  Widget get rawValue {
    switch (this) {
      case HomeScreenConstantsEnum.HOME_VIEW:
        return const SettingsView();
      case HomeScreenConstantsEnum.SETTINGS_VIEW:
        return const SettingsView();
    }
  }
}
