import 'package:flutter_test/flutter_test.dart';
import 'package:movies_catalog/core/init/cache/local_database_manager.dart';
import 'package:movies_catalog/view/search/model/movie_result.dart';
import 'package:sembast/sembast.dart';

import 'local_database_fake.dart';
import 'local_database_manager_fake.dart';

void main() {
  late LocalDatabaseFake localDatabaseFake;
  late Database db;
  late LocalDatabaseManager localDatabaseManagerFake;
  setUp(() async {
    localDatabaseFake = LocalDatabaseFake();
    db = await localDatabaseFake.database;
    localDatabaseManagerFake = LocalDatabaseManagerFake(db: db, storeName: 'favorites');
  });
  test('open database', () async {
    final store = StoreRef<int, String>.main();
    // Open the database
    final db = await localDatabaseFake.database;

    // Add a record
    final key = await store.add(db, 'test');
    // Still present
    expect(await store.record(key).get(db), 'test');
  });

  test('close database', () async {
    final store = StoreRef<int, String>.main();
    // Open the database
    var db = await localDatabaseFake.database;

    // Add a record
    final key = await store.add(db, 'test');

    //delete database
    await localDatabaseFake.clear();
    // Get the newly reopened database
    db = await localDatabaseFake.database;

    // Not present anymore
    expect(await store.record(key).get(db), isNull);
  });

  test('Insert item', () async {
    final key = await localDatabaseManagerFake.insert(MovieResultModel(id: 1, title: 'hello'));
    final res = await localDatabaseManagerFake.store.record(key).get(db);
    expect(res!['title'], 'hello');
  });
}
