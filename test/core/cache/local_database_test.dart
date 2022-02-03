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
  final List<MovieResultModel?> movieResultList = [
    MovieResultModel(movieId: 1, title: 'first'),
    MovieResultModel(movieId: 2, title: 'second')
  ];
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
    final key = await localDatabaseManagerFake.insert(MovieResultModel(movieId: 1, title: 'hello'));
    final res = await localDatabaseManagerFake.store.record(key).get(db);
    expect(res!['title'], 'hello');
  });

  test('Insert all', () async {
    final List<int> key = await localDatabaseManagerFake.insertAll(movieResultList);
    final res = await Future.wait(key.map((e) => localDatabaseManagerFake.store.record(e).get(db)).toList());
    expect(res.length, 2);
  });

  test('Update method', () async {
    //create an object in db
    final insertKey = await localDatabaseManagerFake.insert(MovieResultModel(movieId: 1, title: 'hello', localId: 1));
    //call the object
    final object = await localDatabaseManagerFake.store.record(insertKey).get(db);
    //change the object
    // ignore: cast_nullable_to_non_nullable
    final MovieResultModel movieResult = MovieResultModel.fromJson(object as Map<String, dynamic>);
    movieResult.title = 'changed';
    //update the object
    final updateKey = await localDatabaseManagerFake.update(MovieResultModel(movieId: 1, title: 'changed', localId: 1));
    final res = await localDatabaseManagerFake.store.record(updateKey).get(db);
    //expect the object value is now 'changed'
    expect(res!['title'], 'changed');
    //delete db
    await localDatabaseFake.clear();
  });

  test('Delete method', () async {
    //create an object in db
    final insertKey = await localDatabaseManagerFake.insert(MovieResultModel(movieId: 1, title: 'hello'));
    final insertResult = await localDatabaseManagerFake.store.record(insertKey).get(db);
    //expect the object value is initial
    expect(insertResult!['title'], 'hello');
    //delete the object
    final deleteKey = await localDatabaseManagerFake.delete(MovieResultModel(movieId: 1, title: 'hello'));
    final deleteResult = await localDatabaseManagerFake.store.record(deleteKey).get(db);
    //expect the object value is null
    expect(deleteResult, isNull);
    //delete db
    await localDatabaseFake.clear();
  });

  test('Delete All method', () async {
    //create objects

    final insertKey = await localDatabaseManagerFake.insertAll(movieResultList);
    final insertResult =
        await Future.wait(insertKey.map((e) => localDatabaseManagerFake.store.record(e).get(db)).toList());
    //expect the object value is there
    expect(insertResult[1]!['title'], 'second');
    //delete objects
    final deleteKey = await localDatabaseManagerFake.deleteAll();
    final deleteResult = await localDatabaseManagerFake.store.record(deleteKey).get(db);
    //expect the object value is now 'changed'
    expect(deleteResult, isNull);
    //delete db
    await localDatabaseFake.clear();
  });

  test('Get Cached Requests method', () async {
    //create and Add Requests
    final insertKey = await localDatabaseManagerFake.insertAll(movieResultList);
    final insertResult =
        await Future.wait(insertKey.map((e) => localDatabaseManagerFake.store.record(e).get(db)).toList());
    //expect the Result list length is equal to added requests list
    expect(insertResult.length, 2);
    //get the Cached Requests
    final cachedRequestsList = await localDatabaseManagerFake.getCachedFavorites();
    //expect the Result list length is equal to added requests list again
    expect(cachedRequestsList.length, 2);
  });
}
