import 'package:attandance_tracking/data/database/tables/timetable_versions.dart';
import 'package:drift/drift.dart';

class TimetableSlots extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get timetableVersionId =>
      integer().references(TimetableVersions, #id)();

  TextColumn get subjectName => text()();
  IntColumn get dayOfWeek => integer()(); // 1 = Mon ... 7 = Sun
  IntColumn get startMinutes => integer()(); // minutes from midnight
  IntColumn get endMinutes => integer()();
}