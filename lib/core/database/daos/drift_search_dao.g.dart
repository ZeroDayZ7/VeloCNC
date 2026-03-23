// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_search_dao.dart';

// ignore_for_file: type=lint
mixin _$DriftSearchDaoMixin on DatabaseAccessor<AppDatabase> {
  $SearchResultsTable get searchResults => attachedDatabase.searchResults;
  DriftSearchDaoManager get managers => DriftSearchDaoManager(this);
}

class DriftSearchDaoManager {
  final _$DriftSearchDaoMixin _db;
  DriftSearchDaoManager(this._db);
  $$SearchResultsTableTableManager get searchResults =>
      $$SearchResultsTableTableManager(_db.attachedDatabase, _db.searchResults);
}
