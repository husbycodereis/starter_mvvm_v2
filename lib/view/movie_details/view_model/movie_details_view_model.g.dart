// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MovieDetailsViewModel on _MovieDetailsViewModelBase, Store {
  final _$movieCastListAtom =
      Atom(name: '_MovieDetailsViewModelBase.movieCastList');

  @override
  List<MovieCast> get movieCastList {
    _$movieCastListAtom.reportRead();
    return super.movieCastList;
  }

  @override
  set movieCastList(List<MovieCast> value) {
    _$movieCastListAtom.reportWrite(value, super.movieCastList, () {
      super.movieCastList = value;
    });
  }

  final _$loadingAtom = Atom(name: '_MovieDetailsViewModelBase.loading');

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

  final _$isScrollAtom = Atom(name: '_MovieDetailsViewModelBase.isScroll');

  @override
  bool get isScroll {
    _$isScrollAtom.reportRead();
    return super.isScroll;
  }

  @override
  set isScroll(bool value) {
    _$isScrollAtom.reportWrite(value, super.isScroll, () {
      super.isScroll = value;
    });
  }

  final _$fetchMovieCastListAsyncAction =
      AsyncAction('_MovieDetailsViewModelBase.fetchMovieCastList');

  @override
  Future<dynamic> fetchMovieCastList(MovieResultModel movie) {
    return _$fetchMovieCastListAsyncAction
        .run(() => super.fetchMovieCastList(movie));
  }

  final _$_MovieDetailsViewModelBaseActionController =
      ActionController(name: '_MovieDetailsViewModelBase');

  @override
  void setLoading() {
    final _$actionInfo = _$_MovieDetailsViewModelBaseActionController
        .startAction(name: '_MovieDetailsViewModelBase.setLoading');
    try {
      return super.setLoading();
    } finally {
      _$_MovieDetailsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
movieCastList: ${movieCastList},
loading: ${loading},
isScroll: ${isScroll}
    ''';
  }
}
