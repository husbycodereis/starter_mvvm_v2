

enum NetWorkRoutes { LOGIN}

extension NetworkRoutesString on NetWorkRoutes {
  String get value {
    switch (this) {
      case NetWorkRoutes.LOGIN:
        return '/login';
      default:
        throw Exception('Route not found');
    }
  }
}
