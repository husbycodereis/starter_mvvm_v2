import 'package:flutter/material.dart';
import 'package:movies_catalog/view/authentication/splash/view/splash_view.dart';
import '../../../view/authentication/login/view/login_view.dart';
import '../../../view/home/home_view.dart';
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

      default:
        return normalNavigate(const NotFoundNavigation());
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}
