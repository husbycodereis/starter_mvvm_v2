

enum NetWorkRoutes { LOGIN, SEARCH, TOP_MOVIES, MOVIE_DETAILS, CREDITS}

extension NetworkRoutesString on NetWorkRoutes {
  String get value {
    switch (this) {
      case NetWorkRoutes.LOGIN:
        return '/login';
      case NetWorkRoutes.SEARCH:
        return '/search/multi/';
      case NetWorkRoutes.TOP_MOVIES:
        return '/discover/movie/';
      case NetWorkRoutes.MOVIE_DETAILS:
        return '/movie/';
      case NetWorkRoutes.CREDITS:
        return '/credits';

      default:
        throw Exception('Route not found');
    }
  }
}
