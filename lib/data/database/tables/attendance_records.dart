import 'package:attandance_tracking/data/database/tables/timetable_versions.dart';
import 'package:drift/drift.dart';
import 'timetable_slots.dart';
class AttendanceRecords extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get slotId =>
      integer().references(TimetableSlots, #id)();

  DateTimeColumn get date => dateTime()();
  TextColumn get status => text()(); 
  // PRESENT, ABSENT, CANCELLED, HOLIDAY, PENDING

  IntColumn get timetableVersionId =>
      integer().references(TimetableVersions, #id)();

  DateTimeColumn get createdAt => dateTime()();
}