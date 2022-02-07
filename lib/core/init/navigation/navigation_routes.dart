import 'package:flutter/material.dart';

import 'package:movies_catalog/core/components/exceptions/navigate_model_exception.dart';
import 'package:movies_catalog/view/authentication/splash/view/splash_view.dart';
import 'package:movies_catalog/view/movie_details/view/movie_details_view.dart';
import 'package:movies_catalog/view/search/model/movie_result.dart';
import 'package:movies_catalog/view/settings/model/settings_dynamic_model.dart';
import 'package:movies_catalog/view/settings/view/subview/settings_dynamic_view.dart';
import 'package:movies_catalog/view/watchlist/model/watchlist_model.dart';
import 'package:movies_catalog/view/watchlist/view/subview/watchlist_movies_view.dart';

import '../../../view/authentication/login/view/login_view.dart';
import '../../../view/home/view/home_view.dart';
import '../../components/widgets/cards/not_found_navigation.dart';
import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.DEFAULT:
        return normalNavigate(const SplashView());
      case NavigationConstants.LOGIN_VIEW:
        return normalNavigate(const LoginView());
      case NavigationConstants.HOME:
        return normalNavigate(const HomeView());
      case NavigationConstants.MOVIE_DETAILS_VIEV:
        if (args.arguments is MovieResultModel) {
          return normalNavigate(MovieDetailsView(movie: args.arguments! as MovieResultModel));
        }
        throw NavigateException<SettingsDynamicModel>(args.arguments);
      case NavigationConstants.WATCHLIST_MOVIES_VIEW:
        if (args.arguments is WatchListModel) {
          return normalNavigate(WatchListMoviesView(watchlist: args.arguments! as WatchListModel));
        }
        throw NavigateException<SettingsDynamicModel>(args.arguments);
      case NavigationConstants.SETTINGS_WEB_VIEW:
        if (args.arguments is SettingsDynamicModel) {
          return normalNavigate(SettingsDynamicView(model: args.arguments! as SettingsDynamicModel));
        }
        throw NavigateException<SettingsDynamicModel>(args.arguments);

      default:
        return normalNavigate(const NotFoundNavigation());
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}
