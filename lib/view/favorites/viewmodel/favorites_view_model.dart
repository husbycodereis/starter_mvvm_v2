import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:movies_catalog/core/base/model/base_view_model.dart';
import 'package:movies_catalog/view/search/model/movie_result.dart';
part 'favorites_view_model.g.dart';

class FavoritesViewModel = _FavoritesViewModelBase with _$FavoritesViewModel;

abstract class _FavoritesViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {}

  @observable
  bool loading = false;

  @observable
  List<MovieResultModel> favoriteMovies = ObservableList.of([]);

  @action
  void setFavorite(MovieResultModel movie) {
    movie.isFavorite = !movie.isFavorite!;
    favoriteMovies.add(movie);
    print(favoriteMovies.length);
  }

  @action
  void setLoading() {
    loading = !loading;
  }
}
