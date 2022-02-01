import 'package:flutter/material.dart';
import 'package:movies_catalog/view/settings/view/settings_view.dart';

enum HomeScreenConstantsEnum {
  SETTINGS_VIEW,
  SEARCH_VIEW,
  FAVORITES_VIEW,
  WATCHLIST_VIEW,
}

extension HomeScreenRouteNamesExtension on HomeScreenConstantsEnum {
  Widget get rawValue {
    switch (this) {
      case HomeScreenConstantsEnum.SEARCH_VIEW:
        return Container();
      case HomeScreenConstantsEnum.FAVORITES_VIEW:
        return Container();
      case HomeScreenConstantsEnum.WATCHLIST_VIEW:
        return Container();
      case HomeScreenConstantsEnum.SETTINGS_VIEW:
        return const SettingsView();
    }
  }
}
