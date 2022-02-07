import 'package:flutter/material.dart';
import 'package:movies_catalog/view/favorites/view/favorites_view.dart';
import 'package:movies_catalog/view/home/view/subview/top_movies_view.dart';
import 'package:movies_catalog/view/search/view/search_view.dart';
import 'package:movies_catalog/view/settings/view/settings_view.dart';
import 'package:movies_catalog/view/watchlist/view/watchlist_view.dart';

enum HomeScreenConstantsEnum {
  HOME_VIEW,
  SEARCH_VIEW,
  FAVORITES_VIEW,
  WATCHLIST_VIEW,
  SETTINGS_VIEW,
}

extension HomeScreenRouteNamesExtension on HomeScreenConstantsEnum {
  Widget get rawValue {
    switch (this) {
      case HomeScreenConstantsEnum.HOME_VIEW:
        return const TopMoviesView();
      case HomeScreenConstantsEnum.SEARCH_VIEW:
        return const SearchView();
      case HomeScreenConstantsEnum.FAVORITES_VIEW:
        return const FavoritesView();
      case HomeScreenConstantsEnum.WATCHLIST_VIEW:
        return const WatchListView();
      case HomeScreenConstantsEnum.SETTINGS_VIEW:
        return const SettingsView();
    }
  }
}
