import 'package:drift/drift.dart';

class SemesterStats extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get totalPresent =>
      integer().withDefault(const Constant(0))();
  IntColumn get totalAbsent =>
      integer().withDefault(const Constant(0))();
}