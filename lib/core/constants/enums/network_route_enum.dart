import 'package:movies_catalog/core/constants/app/app_constants.dart';

enum NetWorkRoutes { LOGIN,SEARCH }

extension NetworkRoutesString on NetWorkRoutes {
  String get rawValue {
    switch (this) {
      case NetWorkRoutes.LOGIN:
        return '/login';
      default:
        throw Exception('Route not found');
    }
  }

  String movieSearch(String movieQuery) {
    final String encodedQuery = Uri.encodeFull(movieQuery);
    return '/search/multi?api_key=${ApplicationConstants.movieApi}.&query=$encodedQuery&language=en-US&page=1&include_adult=false';
  }
}
