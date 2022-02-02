// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_view_Model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchViewModel on _SearchViewModelBase, Store {
  final _$loadingAtom = Atom(name: '_SearchViewModelBase.loading');

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

  final _$searchResultListAtom =
      Atom(name: '_SearchViewModelBase.searchResultList');

  @override
  List<MovieResultModel>? get searchResultList {
    _$searchResultListAtom.reportRead();
    return super.searchResultList;
  }

  @override
  set searchResultList(List<MovieResultModel>? value) {
    _$searchResultListAtom.reportWrite(value, super.searchResultList, () {
      super.searchResultList = value;
    });
  }

  final _$searchWithQueryAsyncAction =
      AsyncAction('_SearchViewModelBase.searchWithQuery');

  @override
  Future<dynamic> searchWithQuery() {
    return _$searchWithQueryAsyncAction.run(() => super.searchWithQuery());
  }

  final _$_SearchViewModelBaseActionController =
      ActionController(name: '_SearchViewModelBase');

  @override
  void setLoading() {
    final _$actionInfo = _$_SearchViewModelBaseActionController.startAction(
        name: '_SearchViewModelBase.setLoading');
    try {
      return super.setLoading();
    } finally {
      _$_SearchViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
searchResultList: ${searchResultList}
    ''';
  }
}
