import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:movies_catalog/core/base/model/base_view_model.dart';
import 'package:movies_catalog/core/constants/local_database/local_database_constants.dart';
import 'package:movies_catalog/core/constants/navigation/navigation_constants.dart';
import 'package:movies_catalog/core/init/cache/local_database_manager.dart';
import 'package:movies_catalog/view/search/model/movie_result.dart';
part 'favorites_view_model.g.dart';

class FavoritesViewModel = _FavoritesViewModelBase with _$FavoritesViewModel;

abstract class _FavoritesViewModelBase with Store, BaseViewModel {
  LocalDatabaseManager? _localDatabaseManager;

  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  Future init() async {
    setLocaleDatabaseManager();
    await fetchFavoriteMovies();
  }

  @observable
  bool loading = false;

  @observable
  List<MovieResultModel> favoriteMovies = ObservableList.of([]);

  void setLocaleDatabaseManager() {
    _localDatabaseManager ??= LocalDatabaseManager(storeName: LocalDatabaseConstants.favorites.name);
  }

  @action
  void setFavorite(MovieResultModel movie) {
    setLocaleDatabaseManager();
    if (movie.isFavorite!) {
      movie.isFavorite = false;

      favoriteMovies.remove(movie);
      _localDatabaseManager!.delete(movie);
    } else {
      movie.isFavorite = true;
      movie.localId = favoriteMovies.length + 1;
      favoriteMovies.add(movie);
      _localDatabaseManager!.insert(movie);
    }
  }

  bool checkFavorite(MovieResultModel movie) {
    return favoriteMovies.firstWhere(
      (e) => e.movieId == movie.movieId,
      orElse: () {
        return MovieResultModel();
      },
    ).isFavorite!;
  }

  @action
  void deleteFavorite(MovieResultModel movie) {
    _localDatabaseManager!.delete(movie);
  }

  @action
  void setLoading() {
    loading = !loading;
  }

  @action
  Future fetchFavoriteMovies() async {
    setLoading();
    favoriteMovies = await _localDatabaseManager!.getCachedRequests();
    setLoading();
  }

   void navigateToDetails(MovieResultModel movie) {
    navigation.navigateToPage(path: NavigationConstants.MOVIE_DETAILS_VIEV, data: movie);
  }
}
