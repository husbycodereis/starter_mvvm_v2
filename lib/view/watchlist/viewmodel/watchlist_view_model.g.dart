// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watchlist_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WatchListViewModel on _WatchListViewModelBase, Store {
  Computed<List<WatchListModel>>? _$watchlistReversedComputed;

  @override
  List<WatchListModel> get watchlistReversed => (_$watchlistReversedComputed ??=
          Computed<List<WatchListModel>>(() => super.watchlistReversed,
              name: '_WatchListViewModelBase.watchlistReversed'))
      .value;

  final _$loadingAtom = Atom(name: '_WatchListViewModelBase.loading');

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

  final _$watchlistListAtom =
      Atom(name: '_WatchListViewModelBase.watchlistList');

  @override
  List<WatchListModel> get watchlistList {
    _$watchlistListAtom.reportRead();
    return super.watchlistList;
  }

  @override
  set watchlistList(List<WatchListModel> value) {
    _$watchlistListAtom.reportWrite(value, super.watchlistList, () {
      super.watchlistList = value;
    });
  }

  final _$fetchWatchListAsyncAction =
      AsyncAction('_WatchListViewModelBase.fetchWatchList');

  @override
  Future<dynamic> fetchWatchList() {
    return _$fetchWatchListAsyncAction.run(() => super.fetchWatchList());
  }

  final _$createWatchListAsyncAction =
      AsyncAction('_WatchListViewModelBase.createWatchList');

  @override
  Future<dynamic> createWatchList() {
    return _$createWatchListAsyncAction.run(() => super.createWatchList());
  }

  final _$addMovieToWatchListAsyncAction =
      AsyncAction('_WatchListViewModelBase.addMovieToWatchList');

  @override
  Future<dynamic> addMovieToWatchList(
      MovieResultModel movie, String value, BuildContext context) {
    return _$addMovieToWatchListAsyncAction
        .run(() => super.addMovieToWatchList(movie, value, context));
  }

  final _$deleteMovieFromWatchlistAsyncAction =
      AsyncAction('_WatchListViewModelBase.deleteMovieFromWatchlist');

  @override
  Future<dynamic> deleteMovieFromWatchlist(
      WatchListModel value, MovieResultModel movie) {
    return _$deleteMovieFromWatchlistAsyncAction
        .run(() => super.deleteMovieFromWatchlist(value, movie));
  }

  final _$deleteWatchlistAsyncAction =
      AsyncAction('_WatchListViewModelBase.deleteWatchlist');

  @override
  Future<dynamic> deleteWatchlist(WatchListModel value) {
    return _$deleteWatchlistAsyncAction.run(() => super.deleteWatchlist(value));
  }

  final _$_WatchListViewModelBaseActionController =
      ActionController(name: '_WatchListViewModelBase');

  @override
  void setLoading() {
    final _$actionInfo = _$_WatchListViewModelBaseActionController.startAction(
        name: '_WatchListViewModelBase.setLoading');
    try {
      return super.setLoading();
    } finally {
      _$_WatchListViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
watchlistList: ${watchlistList},
watchlistReversed: ${watchlistReversed}
    ''';
  }
}
