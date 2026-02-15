import '../../data/database/app_database.dart';
import 'package:drift/drift.dart';

class TimetableEngine {
  final AppDatabase db;

  TimetableEngine(this.db);

  // =========================================================
  // GET ACTIVE SLOT FOR CURRENT TIME
  // =========================================================
  Future<TimetableSlot?> getActiveSlot(DateTime now) async {
    // 1. Get active timetable version
    final activeVersions = await (db.select(db.timetableVersions)
      ..where((t) => t.isActive.equals(true))
      ..orderBy([(t) => OrderingTerm.desc(t.id)]))
    .get();

    if (activeVersions.isEmpty) return null;

    final activeVersion = activeVersions.first;

    // 2. Convert current time to minutes
    final minutesNow = now.hour * 60 + now.minute;

    // 3. Convert Dart weekday (Mon=1..Sun=7)
    final today = now.weekday;

    // 4. Query matching slot
    final matchingSlots = await (db.select(db.timetableSlots)
      ..where((slot) =>
          slot.timetableVersionId.equals(activeVersion.id) &
          slot.dayOfWeek.equals(today) &
          slot.startMinutes.isSmallerOrEqualValue(minutesNow) &
          slot.endMinutes.isBiggerThanValue(minutesNow)))
    .get();

if (matchingSlots.isEmpty) return null;

// If multiple, return first (conflict engine will handle later)
return matchingSlots.first;
  }
}