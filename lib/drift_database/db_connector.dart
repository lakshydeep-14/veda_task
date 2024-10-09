import 'dart:io';

import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3/sqlite3.dart';
import 'package:veda_task/drift_database/models/plant_db.dart';

part 'db_connector.g.dart';

@DriftDatabase(tables: [
  PlantDB,
])
@LazySingleton()
class PlantDatabase extends _$PlantDatabase {
  PlantDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  final executor = LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    final cachebase = (await getTemporaryDirectory()).path;
    sqlite3.tempDirectory = cachebase;
    QueryExecutor test = NativeDatabase.createInBackground(file);
    return test;
  });
  return executor;
}
