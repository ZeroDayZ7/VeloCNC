import 'package:drift/drift.dart';

class FeedCalculations extends Table {
  IntColumn get id => integer().autoIncrement()();
  RealColumn get spindleSpeed => real()();
  RealColumn get feedPerTooth => real()();
  IntColumn get teeth => integer()();
  RealColumn get toolDiameter => real().nullable()();
  RealColumn get featureDiameter => real().nullable()();
  RealColumn get resultVf => real()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
