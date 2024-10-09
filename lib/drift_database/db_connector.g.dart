// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_connector.dart';

// ignore_for_file: type=lint
class $PlantDBTable extends PlantDB with TableInfo<$PlantDBTable, PlantDBData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlantDBTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<String> price = GeneratedColumn<String>(
      'price', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, description, type, price, image];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'plant_d_b';
  @override
  VerificationContext validateIntegrity(Insertable<PlantDBData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PlantDBData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlantDBData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}price'])!,
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image'])!,
    );
  }

  @override
  $PlantDBTable createAlias(String alias) {
    return $PlantDBTable(attachedDatabase, alias);
  }
}

class PlantDBData extends DataClass implements Insertable<PlantDBData> {
  final int id;
  final String name;
  final String description;
  final String type;
  final String price;
  final String image;
  const PlantDBData(
      {required this.id,
      required this.name,
      required this.description,
      required this.type,
      required this.price,
      required this.image});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['type'] = Variable<String>(type);
    map['price'] = Variable<String>(price);
    map['image'] = Variable<String>(image);
    return map;
  }

  PlantDBCompanion toCompanion(bool nullToAbsent) {
    return PlantDBCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
      type: Value(type),
      price: Value(price),
      image: Value(image),
    );
  }

  factory PlantDBData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlantDBData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      type: serializer.fromJson<String>(json['type']),
      price: serializer.fromJson<String>(json['price']),
      image: serializer.fromJson<String>(json['image']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'type': serializer.toJson<String>(type),
      'price': serializer.toJson<String>(price),
      'image': serializer.toJson<String>(image),
    };
  }

  PlantDBData copyWith(
          {int? id,
          String? name,
          String? description,
          String? type,
          String? price,
          String? image}) =>
      PlantDBData(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        type: type ?? this.type,
        price: price ?? this.price,
        image: image ?? this.image,
      );
  PlantDBData copyWithCompanion(PlantDBCompanion data) {
    return PlantDBData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      type: data.type.present ? data.type.value : this.type,
      price: data.price.present ? data.price.value : this.price,
      image: data.image.present ? data.image.value : this.image,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PlantDBData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('type: $type, ')
          ..write('price: $price, ')
          ..write('image: $image')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description, type, price, image);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlantDBData &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.type == this.type &&
          other.price == this.price &&
          other.image == this.image);
}

class PlantDBCompanion extends UpdateCompanion<PlantDBData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> description;
  final Value<String> type;
  final Value<String> price;
  final Value<String> image;
  const PlantDBCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.type = const Value.absent(),
    this.price = const Value.absent(),
    this.image = const Value.absent(),
  });
  PlantDBCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String description,
    required String type,
    required String price,
    required String image,
  })  : name = Value(name),
        description = Value(description),
        type = Value(type),
        price = Value(price),
        image = Value(image);
  static Insertable<PlantDBData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? type,
    Expression<String>? price,
    Expression<String>? image,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (type != null) 'type': type,
      if (price != null) 'price': price,
      if (image != null) 'image': image,
    });
  }

  PlantDBCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? description,
      Value<String>? type,
      Value<String>? price,
      Value<String>? image}) {
    return PlantDBCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      type: type ?? this.type,
      price: price ?? this.price,
      image: image ?? this.image,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (price.present) {
      map['price'] = Variable<String>(price.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlantDBCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('type: $type, ')
          ..write('price: $price, ')
          ..write('image: $image')
          ..write(')'))
        .toString();
  }
}

abstract class _$PlantDatabase extends GeneratedDatabase {
  _$PlantDatabase(QueryExecutor e) : super(e);
  $PlantDatabaseManager get managers => $PlantDatabaseManager(this);
  late final $PlantDBTable plantDB = $PlantDBTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [plantDB];
}

typedef $$PlantDBTableCreateCompanionBuilder = PlantDBCompanion Function({
  Value<int> id,
  required String name,
  required String description,
  required String type,
  required String price,
  required String image,
});
typedef $$PlantDBTableUpdateCompanionBuilder = PlantDBCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> description,
  Value<String> type,
  Value<String> price,
  Value<String> image,
});

class $$PlantDBTableFilterComposer
    extends FilterComposer<_$PlantDatabase, $PlantDBTable> {
  $$PlantDBTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get type => $state.composableBuilder(
      column: $state.table.type,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get price => $state.composableBuilder(
      column: $state.table.price,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get image => $state.composableBuilder(
      column: $state.table.image,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$PlantDBTableOrderingComposer
    extends OrderingComposer<_$PlantDatabase, $PlantDBTable> {
  $$PlantDBTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get type => $state.composableBuilder(
      column: $state.table.type,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get price => $state.composableBuilder(
      column: $state.table.price,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get image => $state.composableBuilder(
      column: $state.table.image,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$PlantDBTableTableManager extends RootTableManager<
    _$PlantDatabase,
    $PlantDBTable,
    PlantDBData,
    $$PlantDBTableFilterComposer,
    $$PlantDBTableOrderingComposer,
    $$PlantDBTableCreateCompanionBuilder,
    $$PlantDBTableUpdateCompanionBuilder,
    (PlantDBData, BaseReferences<_$PlantDatabase, $PlantDBTable, PlantDBData>),
    PlantDBData,
    PrefetchHooks Function()> {
  $$PlantDBTableTableManager(_$PlantDatabase db, $PlantDBTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$PlantDBTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$PlantDBTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<String> price = const Value.absent(),
            Value<String> image = const Value.absent(),
          }) =>
              PlantDBCompanion(
            id: id,
            name: name,
            description: description,
            type: type,
            price: price,
            image: image,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String description,
            required String type,
            required String price,
            required String image,
          }) =>
              PlantDBCompanion.insert(
            id: id,
            name: name,
            description: description,
            type: type,
            price: price,
            image: image,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$PlantDBTableProcessedTableManager = ProcessedTableManager<
    _$PlantDatabase,
    $PlantDBTable,
    PlantDBData,
    $$PlantDBTableFilterComposer,
    $$PlantDBTableOrderingComposer,
    $$PlantDBTableCreateCompanionBuilder,
    $$PlantDBTableUpdateCompanionBuilder,
    (PlantDBData, BaseReferences<_$PlantDatabase, $PlantDBTable, PlantDBData>),
    PlantDBData,
    PrefetchHooks Function()>;

class $PlantDatabaseManager {
  final _$PlantDatabase _db;
  $PlantDatabaseManager(this._db);
  $$PlantDBTableTableManager get plantDB =>
      $$PlantDBTableTableManager(_db, _db.plantDB);
}
