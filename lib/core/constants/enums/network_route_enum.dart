enum NetWorkRoutes { LOGIN }

extension NetworkRoutesString on NetWorkRoutes {
  String get rawValue {
    switch (this) {
      case NetWorkRoutes.LOGIN:
        return '/login';
      default:
        throw Exception('Route not found');
    }
  }
}
