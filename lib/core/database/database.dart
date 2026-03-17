import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'database.g.dart';

// Tabela do historii posuwu
class FeedCalculations extends Table {
  IntColumn get id => integer().autoIncrement()();

  // Dane wejściowe
  RealColumn get spindleSpeed => real()(); // n
  RealColumn get feedPerTooth => real()(); // fz
  IntColumn get teeth => integer()(); // z

  // Opcjonalne dane dla kompensacji łuku/Vc
  RealColumn get toolDiameter => real().nullable()();
  RealColumn get featureDiameter => real().nullable()();

  // Wynik główny
  RealColumn get resultVf => real()();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

class SearchResults extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get query => text()();
  TextColumn get resultJson => text()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

@DriftDatabase(tables: [SearchResults, FeedCalculations])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2; // Zmieniono na 2

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'cnc_toolbox_db');
  }

  // --- METODY DLA POSUWU (FEED RATE) ---

  // Zapisz obliczenie
  Future<int> saveFeedCalculation({
    required double n,
    required double fz,
    required int z,
    required double vf,
    double? d,
    double? dWork,
  }) {
    return into(feedCalculations).insert(
      FeedCalculationsCompanion.insert(
        spindleSpeed: n,
        feedPerTooth: fz,
        teeth: z,
        resultVf: vf,
        toolDiameter: Value(d),
        featureDiameter: Value(dWork),
      ),
    );
  }

  // Pobieranie z paginacją (10 rekordów na stronę)
  Future<List<FeedCalculation>> getFeedHistory({
    int limit = 10,
    int offset = 0,
  }) {
    return (select(feedCalculations)
          ..orderBy([(t) => OrderingTerm.desc(t.createdAt)])
          ..limit(limit, offset: offset))
        .get();
  }

  // Usunięcie pojedynczego rekordu z historii
  Future<int> deleteFeedEntry(int id) {
    return (delete(feedCalculations)..where((t) => t.id.equals(id))).go();
  }

  // --- STARE METODY ---
  Future<int> saveSearchResult(String query, String json) {
    return into(
      searchResults,
    ).insert(SearchResultsCompanion.insert(query: query, resultJson: json));
  }
}

@Riverpod(keepAlive: true)
AppDatabase database(Ref ref) {
  final db = AppDatabase();
  ref.onDispose(() => db.close());
  return db;
}
