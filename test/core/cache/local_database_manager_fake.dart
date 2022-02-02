import 'package:mockito/mockito.dart';
import 'package:movies_catalog/core/init/cache/local_database.dart';
import 'package:movies_catalog/core/init/cache/local_database_manager.dart';
import 'package:sembast/sembast.dart' as sembast;

class LocalDatabaseManagerFake<T extends LocalDatabaseModel?> extends Fake implements LocalDatabaseManager {
  final sembast.Database db;

  late sembast.StoreRef<int, Map<String, dynamic>> store;
  String? storeName;

  LocalDatabaseManagerFake({
    required this.db,
    required this.storeName,
  }) {
    store = sembast.intMapStoreFactory.store(storeName);
  }
  @override
  Future<int> insert(obj) async {
    assert(obj!.id != null);
    return store.add(db, obj!.toJson()!);
  }
}
