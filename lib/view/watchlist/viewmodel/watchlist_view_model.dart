import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:movies_catalog/core/base/model/base_view_model.dart';
import 'package:movies_catalog/core/components/widgets/bottom_sheet/modal_bottom_sheet_container.dart';
import 'package:movies_catalog/core/components/widgets/dismissible/dismissible_delete_widget.dart';
import 'package:movies_catalog/core/constants/local_database/local_database_constants.dart';
import 'package:movies_catalog/core/extensions/context_extensions.dart';
import 'package:movies_catalog/core/init/cache/local_database_manager.dart';
import 'package:movies_catalog/view/watchlist/model/watchlist_model.dart';
import 'package:movies_catalog/view/watchlist/view/subview/watchlist_modal_bottom_sheet.dart';

part 'watchlist_view_model.g.dart';

class WatchListViewModel = _WatchListViewModelBase with _$WatchListViewModel;

abstract class _WatchListViewModelBase with Store, BaseViewModel {
  LocalDatabaseManager<WatchListModel>? _localDatabaseManager;

  late TextEditingController watchlistController;
  late FocusScopeNode watchlistFocus;

  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  Future init() async {
    watchlistController = TextEditingController();
    watchlistFocus = FocusScopeNode();
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
    watchlistList = await _localDatabaseManager!.getCachedData(WatchListModel());
    setLoading();
  }

  @action
  Future createWatchList() async {
    if (watchlistController.text.length < 30) {
      if (watchlistList.where((e) => e.name! == watchlistController.text).isEmpty) {
        await _localDatabaseManager!.insert(WatchListModel(name: watchlistController.text));
        await fetchWatchList();
      } else {
        context!.showSnackBar('this watchlist exists!');
      }
    } else {
      context!.showSnackBar('watchlist name is too long!');
    }
  }

  @action
  Future addMovieToWatchList(String value) async {
    final WatchListModel updateItem = watchlistList.firstWhere((e) => e.name == value);
    await _localDatabaseManager!.update(updateItem);
    await fetchWatchList();
  }

  @action
  Future deleteWatchlist(WatchListModel value) async {
    setLoading();
    final WatchListModel deleteItem = watchlistList.firstWhere((e) => e.name == value.name);
    await _localDatabaseManager!.delete(deleteItem);
    await fetchWatchList();
    setLoading();
  }

  Future showWatchlistBottomSheet(BuildContext context) async {
    return showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
        enableDrag: false,
        isDismissible: true,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return const WatchListModalBottomSheet();
        });
  }

  void unfocusKeyboard() {
    watchlistFocus.unfocus();
  }

  void dispose() {
    watchlistController.clear();
    watchlistFocus.dispose();
  }
}
