import 'package:drift/drift.dart';

class PlantDB extends Table {
  @override
  Set<Column> get primaryKey => {id};

  IntColumn get id => integer().autoIncrement()();

  // IntColumn get collectorId => integer()();
  TextColumn get name => text()();
  TextColumn get description => text()();
  TextColumn get type => text()();
  TextColumn get price => text()();
  TextColumn get image => text()();
}
