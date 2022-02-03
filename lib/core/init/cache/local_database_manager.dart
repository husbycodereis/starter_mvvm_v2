import 'package:movies_catalog/core/init/cache/local_database.dart';
import 'package:movies_catalog/view/search/model/movie_result.dart';
import 'package:movies_catalog/view/watchlist/model/watchlist_model.dart';
import 'package:sembast/sembast.dart';

abstract class LocalDatabaseModel {
  int? localId;

  Map<String, dynamic>? toJson();
}

class LocalDatabaseManager<T extends LocalDatabaseModel?> {
  late StoreRef<int, Map<String, dynamic>> store;
  String? storeName;

  LocalDatabaseManager({
    required this.storeName,
  }) {
    store = intMapStoreFactory.store(storeName);
  }

  Future<int> insert(T obj) async {
    // assert(obj!.localId != null);
    return store.add(await LocalDatabase.instance.database, obj!.toJson()!);
  }

  Future<List<int>> insertAll(List<T> objs) async {
    return store.addAll(await LocalDatabase.instance.database, objs.map((e) => e!.toJson()!).toList());
  }

  Future<int> update(T obj) async {
    final finder = Finder(filter: Filter.byKey(obj!.localId));
    return store.update(await LocalDatabase.instance.database, obj.toJson()!, finder: finder);
    // Filter.equals('id', obj!.id)
  }

  Future<int> delete(T obj) async {
    final finder = Finder(filter: Filter.byKey(obj!.localId));
    return store.delete(await LocalDatabase.instance.database, finder: finder);
  }

  Future<int> deleteAll() async {
    return store.delete(await LocalDatabase.instance.database);
  }

  Future<List<MovieResultModel>> getCachedFavorites() async {
    final recordSnapshots = await store.find(await LocalDatabase.instance.database);

    return recordSnapshots.map((snapshot) {
      final requests = MovieResultModel.fromJson(snapshot.value);
      requests.localId = snapshot.key;
      return requests;
    }).toList();
  }

  Future<List<WatchListModel>> getCachedWatchLists() async {
    final recordSnapshots = await store.find(await LocalDatabase.instance.database);

    return recordSnapshots.map((snapshot) {
      final requests = WatchListModel.fromJson(snapshot.value);
      requests.localId = snapshot.key;
      return requests;
    }).toList();
  }
}
