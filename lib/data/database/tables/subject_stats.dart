import 'package:attandance_tracking/data/database/tables/timetable_slots.dart';
import 'package:drift/drift.dart';
class SubjectStats extends Table {
  IntColumn get slotId =>
      integer().references(TimetableSlots, #id)();

  IntColumn get presentCount =>
      integer().withDefault(const Constant(0))();

  IntColumn get absentCount =>
      integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {slotId};
}