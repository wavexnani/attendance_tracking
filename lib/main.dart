import 'package:flutter/material.dart';
import 'data/database/app_database.dart';
import 'application/engines/timetable_engine.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final db = AppDatabase();
  final timetableEngine = TimetableEngine(db);

  // Insert test data
  final versionId = await db.into(db.timetableVersions).insert(
        TimetableVersionsCompanion.insert(
          createdAt: DateTime.now(),
        ),
      );

  await db.into(db.timetableSlots).insert(
        TimetableSlotsCompanion.insert(
          timetableVersionId: versionId,
          subjectName: "OS",
          dayOfWeek: DateTime.now().weekday,
          startMinutes: 0,
          endMinutes: 1440, // whole day
        ),
      );

  final activeSlot =
      await timetableEngine.getActiveSlot(DateTime.now());

  print("Active Slot: ${activeSlot?.subjectName}");

  runApp(const MaterialApp(
    home: Scaffold(
      body: Center(child: Text("Timetable Test Running")),
    ),
  ));
}