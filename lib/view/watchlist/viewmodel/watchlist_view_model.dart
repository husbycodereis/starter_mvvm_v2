import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:movies_catalog/core/base/model/base_view_model.dart';
import 'package:movies_catalog/core/constants/local_database/local_database_constants.dart';
import 'package:movies_catalog/core/init/cache/local_database_manager.dart';
import 'package:movies_catalog/view/watchlist/model/watchlist_model.dart';
part 'watchlist_view_model.g.dart';

class WatchListViewModel = _WatchListViewModelBase with _$WatchListViewModel;

abstract class _WatchListViewModelBase with Store, BaseViewModel {
  LocalDatabaseManager? _localDatabaseManager;

  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  Future init() async {
    setLocalDatabaseManager();
    await fetchWatchList();
  }

  @observable
  bool loading = false;

  @observable
  List<WatchListModel> watchlistList = ObservableList.of([]);

  @action
  void setLoading() {
    loading = !loading;
  }

  void setLocalDatabaseManager() {
    _localDatabaseManager ??= LocalDatabaseManager(storeName: LocalDatabaseConstants.watchlist.name);
  }

  @action
  Future fetchWatchList() async {
    setLoading();
    watchlistList = await _localDatabaseManager!.getCachedWatchLists();
    setLoading();
  }

  @action
  Future createWatchList() async {
    await _localDatabaseManager!.insert(WatchListModel(name: 'helloo'));
    await fetchWatchList();
  }

  @action
  Future addMovieToWatchList(String value) async {
    final WatchListModel updateItem = watchlistList.firstWhere((e) => e.name == value);
    await _localDatabaseManager!.update(updateItem);
    await fetchWatchList();
  }

  @action
  Future deleteWatchlist(String value) async {
    final WatchListModel deleteItem = watchlistList.firstWhere((e) => e.name == value);
    await _localDatabaseManager!.delete(deleteItem);
    await fetchWatchList();
  }
}
