import 'package:flutter/material.dart';

enum HomeScreenConstantsEnum {SEARCH_VIEW, FAVORITES_VIEW, WATCHLIST_VIEW }

extension HomeScreenRouteNamesExtension on HomeScreenConstantsEnum {
  Widget get rawValue {
    switch (this) {
      case HomeScreenConstantsEnum.SEARCH_VIEW:
        return  Container();
      case HomeScreenConstantsEnum.FAVORITES_VIEW:
        return  Container();
      case HomeScreenConstantsEnum.WATCHLIST_VIEW:
        return  Container();
    }
  }
}
