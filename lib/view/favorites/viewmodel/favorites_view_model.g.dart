// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FavoritesViewModel on _FavoritesViewModelBase, Store {
  final _$loadingAtom = Atom(name: '_FavoritesViewModelBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$favoriteMoviesAtom =
      Atom(name: '_FavoritesViewModelBase.favoriteMovies');

  @override
  List<MovieResultModel> get favoriteMovies {
    _$favoriteMoviesAtom.reportRead();
    return super.favoriteMovies;
  }

  @override
  set favoriteMovies(List<MovieResultModel> value) {
    _$favoriteMoviesAtom.reportWrite(value, super.favoriteMovies, () {
      super.favoriteMovies = value;
    });
  }

  final _$fetchFavoriteMoviesAsyncAction =
      AsyncAction('_FavoritesViewModelBase.fetchFavoriteMovies');

  @override
  Future<dynamic> fetchFavoriteMovies() {
    return _$fetchFavoriteMoviesAsyncAction
        .run(() => super.fetchFavoriteMovies());
  }

  final _$_FavoritesViewModelBaseActionController =
      ActionController(name: '_FavoritesViewModelBase');

  @override
  void setFavorite(MovieResultModel movie) {
    final _$actionInfo = _$_FavoritesViewModelBaseActionController.startAction(
        name: '_FavoritesViewModelBase.setFavorite');
    try {
      return super.setFavorite(movie);
    } finally {
      _$_FavoritesViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteFavorite(MovieResultModel movie) {
    final _$actionInfo = _$_FavoritesViewModelBaseActionController.startAction(
        name: '_FavoritesViewModelBase.deleteFavorite');
    try {
      return super.deleteFavorite(movie);
    } finally {
      _$_FavoritesViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading() {
    final _$actionInfo = _$_FavoritesViewModelBaseActionController.startAction(
        name: '_FavoritesViewModelBase.setLoading');
    try {
      return super.setLoading();
    } finally {
      _$_FavoritesViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
favoriteMovies: ${favoriteMovies}
    ''';
  }
}
