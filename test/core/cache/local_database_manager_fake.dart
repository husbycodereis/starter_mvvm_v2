import 'package:mockito/mockito.dart';
import 'package:movies_catalog/core/init/cache/local_database_manager.dart';
import 'package:sembast/sembast.dart' as sembast;
import 'package:sembast/sembast.dart';

class LocalDatabaseManagerFake<T extends LocalDatabaseModel?> extends Fake implements LocalDatabaseManager {
  final sembast.Database db;

  @override
  late sembast.StoreRef<int, Map<String, dynamic>> store;
  @override
  String? storeName;

  LocalDatabaseManagerFake({
    required this.db,
    required this.storeName,
  }) {
    store = sembast.intMapStoreFactory.store(storeName);
  }
  @override
  Future<int> insert(LocalDatabaseModel? obj) async {
    // assert(obj!.localId != null);
    return store.add(db, obj!.toJson()!);
  }

  @override
  Future<List<int>> insertAll(List<LocalDatabaseModel?> objs) async {
    return store.addAll(db, objs.map((e) => e!.toJson()!).toList());
  }

  @override
  Future<int> update(LocalDatabaseModel? obj) async {
    final finder = Finder(filter: Filter.byKey(obj!.localId));
    return store.update(db, obj.toJson()!, finder: finder);
    // Filter.equals('id', obj!.id)
  }

  @override
  Future<int> delete(LocalDatabaseModel? obj) async {
    final finder = sembast.Finder(filter: Filter.byKey(obj!.localId));
    return store.delete(db, finder: finder);
  }

  @override
  Future<int> deleteAll() async {
    return store.delete(db);
  }

  @override
  Future<List<LocalDatabaseModel<dynamic>?>> getCachedData(LocalDatabaseModel<dynamic>? obj) async {
    final recordSnapshots = await store.find(db);

    return recordSnapshots.map((snapshot) {
      final requests = obj!.fromJson(snapshot.value) as LocalDatabaseModel<dynamic>?;
      requests!.localId = snapshot.key;
      return requests;
    }).toList();
  }

  // Future<List<T>> getCachedFavorites(T obj) async {
  //   final recordSnapshots = await store.find(await LocalDatabase.instance.database);

  //   return recordSnapshots.map((snapshot) {
  //     final requests = obj!.fromJson(snapshot.value) as T;
  //     requests!.localId = snapshot.key;
  //     return requests ;
  //   }).toList();
  // }
}
