import 'package:attandance_tracking/data/database/tables/attendance_records.dart';
import 'package:drift/drift.dart';

class AttendanceEvents extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get recordId =>
      integer().references(AttendanceRecords, #id)();

  TextColumn get oldStatus => text()();
  TextColumn get newStatus => text()();
  DateTimeColumn get editedAt => dateTime()();
  TextColumn get deviceId => text()();
}