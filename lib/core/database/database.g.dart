// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $SearchResultsTable extends SearchResults
    with TableInfo<$SearchResultsTable, SearchResult> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SearchResultsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _queryMeta = const VerificationMeta('query');
  @override
  late final GeneratedColumn<String> query = GeneratedColumn<String>(
    'query',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _resultJsonMeta = const VerificationMeta(
    'resultJson',
  );
  @override
  late final GeneratedColumn<String> resultJson = GeneratedColumn<String>(
    'result_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [id, query, resultJson, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'search_results';
  @override
  VerificationContext validateIntegrity(
    Insertable<SearchResult> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('query')) {
      context.handle(
        _queryMeta,
        query.isAcceptableOrUnknown(data['query']!, _queryMeta),
      );
    } else if (isInserting) {
      context.missing(_queryMeta);
    }
    if (data.containsKey('result_json')) {
      context.handle(
        _resultJsonMeta,
        resultJson.isAcceptableOrUnknown(data['result_json']!, _resultJsonMeta),
      );
    } else if (isInserting) {
      context.missing(_resultJsonMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SearchResult map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SearchResult(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      query: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}query'],
      )!,
      resultJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}result_json'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $SearchResultsTable createAlias(String alias) {
    return $SearchResultsTable(attachedDatabase, alias);
  }
}

class SearchResult extends DataClass implements Insertable<SearchResult> {
  final int id;
  final String query;
  final String resultJson;
  final DateTime createdAt;
  const SearchResult({
    required this.id,
    required this.query,
    required this.resultJson,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['query'] = Variable<String>(query);
    map['result_json'] = Variable<String>(resultJson);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  SearchResultsCompanion toCompanion(bool nullToAbsent) {
    return SearchResultsCompanion(
      id: Value(id),
      query: Value(query),
      resultJson: Value(resultJson),
      createdAt: Value(createdAt),
    );
  }

  factory SearchResult.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SearchResult(
      id: serializer.fromJson<int>(json['id']),
      query: serializer.fromJson<String>(json['query']),
      resultJson: serializer.fromJson<String>(json['resultJson']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'query': serializer.toJson<String>(query),
      'resultJson': serializer.toJson<String>(resultJson),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  SearchResult copyWith({
    int? id,
    String? query,
    String? resultJson,
    DateTime? createdAt,
  }) => SearchResult(
    id: id ?? this.id,
    query: query ?? this.query,
    resultJson: resultJson ?? this.resultJson,
    createdAt: createdAt ?? this.createdAt,
  );
  SearchResult copyWithCompanion(SearchResultsCompanion data) {
    return SearchResult(
      id: data.id.present ? data.id.value : this.id,
      query: data.query.present ? data.query.value : this.query,
      resultJson: data.resultJson.present
          ? data.resultJson.value
          : this.resultJson,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SearchResult(')
          ..write('id: $id, ')
          ..write('query: $query, ')
          ..write('resultJson: $resultJson, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, query, resultJson, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SearchResult &&
          other.id == this.id &&
          other.query == this.query &&
          other.resultJson == this.resultJson &&
          other.createdAt == this.createdAt);
}

class SearchResultsCompanion extends UpdateCompanion<SearchResult> {
  final Value<int> id;
  final Value<String> query;
  final Value<String> resultJson;
  final Value<DateTime> createdAt;
  const SearchResultsCompanion({
    this.id = const Value.absent(),
    this.query = const Value.absent(),
    this.resultJson = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  SearchResultsCompanion.insert({
    this.id = const Value.absent(),
    required String query,
    required String resultJson,
    this.createdAt = const Value.absent(),
  }) : query = Value(query),
       resultJson = Value(resultJson);
  static Insertable<SearchResult> custom({
    Expression<int>? id,
    Expression<String>? query,
    Expression<String>? resultJson,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (query != null) 'query': query,
      if (resultJson != null) 'result_json': resultJson,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  SearchResultsCompanion copyWith({
    Value<int>? id,
    Value<String>? query,
    Value<String>? resultJson,
    Value<DateTime>? createdAt,
  }) {
    return SearchResultsCompanion(
      id: id ?? this.id,
      query: query ?? this.query,
      resultJson: resultJson ?? this.resultJson,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (query.present) {
      map['query'] = Variable<String>(query.value);
    }
    if (resultJson.present) {
      map['result_json'] = Variable<String>(resultJson.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SearchResultsCompanion(')
          ..write('id: $id, ')
          ..write('query: $query, ')
          ..write('resultJson: $resultJson, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SearchResultsTable searchResults = $SearchResultsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [searchResults];
}

typedef $$SearchResultsTableCreateCompanionBuilder =
    SearchResultsCompanion Function({
      Value<int> id,
      required String query,
      required String resultJson,
      Value<DateTime> createdAt,
    });
typedef $$SearchResultsTableUpdateCompanionBuilder =
    SearchResultsCompanion Function({
      Value<int> id,
      Value<String> query,
      Value<String> resultJson,
      Value<DateTime> createdAt,
    });

class $$SearchResultsTableFilterComposer
    extends Composer<_$AppDatabase, $SearchResultsTable> {
  $$SearchResultsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get query => $composableBuilder(
    column: $table.query,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get resultJson => $composableBuilder(
    column: $table.resultJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SearchResultsTableOrderingComposer
    extends Composer<_$AppDatabase, $SearchResultsTable> {
  $$SearchResultsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get query => $composableBuilder(
    column: $table.query,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get resultJson => $composableBuilder(
    column: $table.resultJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SearchResultsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SearchResultsTable> {
  $$SearchResultsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get query =>
      $composableBuilder(column: $table.query, builder: (column) => column);

  GeneratedColumn<String> get resultJson => $composableBuilder(
    column: $table.resultJson,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$SearchResultsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SearchResultsTable,
          SearchResult,
          $$SearchResultsTableFilterComposer,
          $$SearchResultsTableOrderingComposer,
          $$SearchResultsTableAnnotationComposer,
          $$SearchResultsTableCreateCompanionBuilder,
          $$SearchResultsTableUpdateCompanionBuilder,
          (
            SearchResult,
            BaseReferences<_$AppDatabase, $SearchResultsTable, SearchResult>,
          ),
          SearchResult,
          PrefetchHooks Function()
        > {
  $$SearchResultsTableTableManager(_$AppDatabase db, $SearchResultsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SearchResultsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SearchResultsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SearchResultsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> query = const Value.absent(),
                Value<String> resultJson = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => SearchResultsCompanion(
                id: id,
                query: query,
                resultJson: resultJson,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String query,
                required String resultJson,
                Value<DateTime> createdAt = const Value.absent(),
              }) => SearchResultsCompanion.insert(
                id: id,
                query: query,
                resultJson: resultJson,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SearchResultsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SearchResultsTable,
      SearchResult,
      $$SearchResultsTableFilterComposer,
      $$SearchResultsTableOrderingComposer,
      $$SearchResultsTableAnnotationComposer,
      $$SearchResultsTableCreateCompanionBuilder,
      $$SearchResultsTableUpdateCompanionBuilder,
      (
        SearchResult,
        BaseReferences<_$AppDatabase, $SearchResultsTable, SearchResult>,
      ),
      SearchResult,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SearchResultsTableTableManager get searchResults =>
      $$SearchResultsTableTableManager(_db, _db.searchResults);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(database)
final databaseProvider = DatabaseProvider._();

final class DatabaseProvider
    extends $FunctionalProvider<AppDatabase, AppDatabase, AppDatabase>
    with $Provider<AppDatabase> {
  DatabaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'databaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$databaseHash();

  @$internal
  @override
  $ProviderElement<AppDatabase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppDatabase create(Ref ref) {
    return database(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppDatabase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppDatabase>(value),
    );
  }
}

String _$databaseHash() => r'fe9e31a41cdfd29367d156df6a56b19b72fe5540';
