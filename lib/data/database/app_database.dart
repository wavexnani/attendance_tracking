import 'tables/timetable_versions.dart';
import 'tables/timetable_slots.dart';
import 'tables/attendance_records.dart';
import 'tables/attendance_events.dart';
import 'tables/subject_stats.dart';
import 'tables/semester_stats.dart';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    TimetableVersions,
    TimetableSlots,
    AttendanceRecords,
    AttendanceEvents,
    SubjectStats,
    SemesterStats,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'attendance.sqlite'));
    return NativeDatabase(file);
  });
}