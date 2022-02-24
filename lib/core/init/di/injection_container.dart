import 'package:get_it/get_it.dart';
import 'package:movies_catalog/view/favorites/viewmodel/favorites_view_model.dart';
import 'package:movies_catalog/view/search/viewmodel/search_view_Model.dart';
import 'package:movies_catalog/view/watchlist/viewmodel/watchlist_view_model.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  //!Local Database

  serviceLocator.registerLazySingleton(() => SearchViewModel());
  serviceLocator.registerLazySingleton(() => FavoritesViewModel());
  serviceLocator.registerLazySingleton(() => WatchListViewModel());
}
