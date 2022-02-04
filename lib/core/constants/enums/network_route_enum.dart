import 'package:movies_catalog/core/constants/app/app_constants.dart';

enum NetWorkRoutes { LOGIN, SEARCH, TOP_MOVIES }

extension NetworkRoutesString on NetWorkRoutes {
  String get value {
    switch (this) {
      case NetWorkRoutes.LOGIN:
        return '/login';
      case NetWorkRoutes.SEARCH:
        return '/search/multi/';
      case NetWorkRoutes.TOP_MOVIES:
        return '/discover/movie/';

      default:
        throw Exception('Route not found');
    }
  }

}
