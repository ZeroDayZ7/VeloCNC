import 'package:cnc_toolbox/core/constants/constants.dart';
import 'package:cnc_toolbox/core/database/database.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'database_provider.g.dart';

@Riverpod(keepAlive: true)
AppDatabase database(Ref ref) {
  final db = AppDatabase(driftDatabase(name: AppConfig.dbName));
  ref.onDispose(() => db.close());
  return db;
}
