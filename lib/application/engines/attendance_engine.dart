import '../../data/database/app_database.dart';
import '../../data/database/transaction_manager.dart';
import 'package:drift/drift.dart';

class AttendanceEngine {
  final AppDatabase db;
  final TransactionManager tx;

  AttendanceEngine(this.db, this.tx);

  // =========================================================
  // MAIN ATTENDANCE MARKING METHOD
  // =========================================================
  Future<void> markAttendance({
    required int slotId,
    required DateTime date,
    required String newStatus,
  }) async {
    await tx.runInTransaction(() async {
      final existing = await (db.select(db.attendanceRecords)
            ..where((tbl) =>
                tbl.slotId.equals(slotId) &
                tbl.date.equals(date)))
          .getSingleOrNull();

      if (existing == null) {
        await db.into(db.attendanceRecords).insert(
              AttendanceRecordsCompanion.insert(
                slotId: slotId,
                date: date,
                status: newStatus,
                timetableVersionId: 1,
                createdAt: DateTime.now(),
              ),
            );

        await _updateAggregates(slotId, newStatus);
      } else {
        final oldStatus = existing.status;

        await (db.update(db.attendanceRecords)
              ..where((tbl) => tbl.id.equals(existing.id)))
            .write(
          AttendanceRecordsCompanion(
            status: Value(newStatus),
          ),
        );

        await _adjustAggregates(slotId, oldStatus, newStatus);

        await db.into(db.attendanceEvents).insert(
              AttendanceEventsCompanion.insert(
                recordId: existing.id,
                oldStatus: oldStatus,
                newStatus: newStatus,
                editedAt: DateTime.now(),
                deviceId: "local_device",
              ),
            );
      }
    });
  }

  // =========================================================
  // AGGREGATE INSERT (FIRST TIME MARK)
  // =========================================================
  Future<void> _updateAggregates(int slotId, String status) async {
    if (status != "PRESENT" && status != "ABSENT") return;

    final existingStats =
        await (db.select(db.subjectStats)..where((t) => t.slotId.equals(slotId)))
            .getSingleOrNull();

    if (existingStats == null) {
      await db.into(db.subjectStats).insert(
            SubjectStatsCompanion(
              slotId: Value(slotId),
              presentCount: Value(status == "PRESENT" ? 1 : 0),
              absentCount: Value(status == "ABSENT" ? 1 : 0),
            ),
          );
    } else {
      await (db.update(db.subjectStats)
            ..where((t) => t.slotId.equals(slotId)))
          .write(
        SubjectStatsCompanion(
          presentCount: Value(existingStats.presentCount +
              (status == "PRESENT" ? 1 : 0)),
          absentCount: Value(existingStats.absentCount +
              (status == "ABSENT" ? 1 : 0)),
        ),
      );
    }
  }

  // =========================================================
  // AGGREGATE UPDATE (STATUS CHANGE)
  // =========================================================
  Future<void> _adjustAggregates(
      int slotId, String oldStatus, String newStatus) async {
    if (oldStatus == newStatus) return;

    final stats =
        await (db.select(db.subjectStats)..where((t) => t.slotId.equals(slotId)))
            .getSingle();

    int present = stats.presentCount;
    int absent = stats.absentCount;

    if (oldStatus == "PRESENT") present--;
    if (oldStatus == "ABSENT") absent--;

    if (newStatus == "PRESENT") present++;
    if (newStatus == "ABSENT") absent++;

    await (db.update(db.subjectStats)
          ..where((t) => t.slotId.equals(slotId)))
        .write(
      SubjectStatsCompanion(
        presentCount: Value(present),
        absentCount: Value(absent),
      ),
    );
  }

  // =========================================================
  // CALCULATE ATTENDANCE %
  // =========================================================
  Future<double> calculateAttendance(int slotId) async {
    final stats =
        await (db.select(db.subjectStats)..where((t) => t.slotId.equals(slotId)))
            .getSingleOrNull();

    if (stats == null) return 0;

    final total = stats.presentCount + stats.absentCount;
    if (total == 0) return 0;

    return stats.presentCount / total;
  }

  // =========================================================
  // DEBUG TEST METHOD
  // =========================================================
  Future<void> debugTest() async {
    print("----- RUNNING TESTS -----");

    final versionId = await db.into(db.timetableVersions).insert(
          TimetableVersionsCompanion.insert(
            createdAt: DateTime.now(),
          ),
        );

    final slotId = await db.into(db.timetableSlots).insert(
          TimetableSlotsCompanion.insert(
            timetableVersionId: versionId,
            subjectName: "DSA",
            dayOfWeek: 1,
            startMinutes: 540,
            endMinutes: 600,
          ),
        );

    // Test 1: Present
    await markAttendance(
      slotId: slotId,
      date: DateTime(2024, 1, 1),
      newStatus: "PRESENT",
    );

    print("Test 1 %: ${(await calculateAttendance(slotId)) * 100}");

    // Test 2: Absent
    await markAttendance(
      slotId: slotId,
      date: DateTime(2024, 1, 2),
      newStatus: "ABSENT",
    );

    print("Test 2 %: ${(await calculateAttendance(slotId)) * 100}");

    // Test 3: Change Present -> Absent
    await markAttendance(
      slotId: slotId,
      date: DateTime(2024, 1, 1),
      newStatus: "ABSENT",
    );

    print("Test 3 %: ${(await calculateAttendance(slotId)) * 100}");

    // Test 4: Holiday (should not affect denominator)
    await markAttendance(
      slotId: slotId,
      date: DateTime(2024, 1, 3),
      newStatus: "HOLIDAY",
    );

    print("Test 4 %: ${(await calculateAttendance(slotId)) * 100}");

    print("----- TEST COMPLETE -----");
  }
}