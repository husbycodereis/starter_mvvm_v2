// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  final _$loadingAtom = Atom(name: '_HomeViewModelBase.loading');

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

  final _$topMoviesListAtom = Atom(name: '_HomeViewModelBase.topMoviesList');

  @override
  List<MovieResultModel> get topMoviesList {
    _$topMoviesListAtom.reportRead();
    return super.topMoviesList;
  }

  @override
  set topMoviesList(List<MovieResultModel> value) {
    _$topMoviesListAtom.reportWrite(value, super.topMoviesList, () {
      super.topMoviesList = value;
    });
  }

  final _$fetchTopMoviesAsyncAction =
      AsyncAction('_HomeViewModelBase.fetchTopMovies');

  @override
  Future<dynamic> fetchTopMovies() {
    return _$fetchTopMoviesAsyncAction.run(() => super.fetchTopMovies());
  }

  final _$_HomeViewModelBaseActionController =
      ActionController(name: '_HomeViewModelBase');

  @override
  void setLoading() {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.setLoading');
    try {
      return super.setLoading();
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
topMoviesList: ${topMoviesList}
    ''';
  }
}
