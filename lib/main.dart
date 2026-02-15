import 'package:flutter/material.dart';
import 'data/database/app_database.dart';
import 'application/engines/timetable_engine.dart';
import 'application/engines/clock_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final db = AppDatabase();
  final timetableEngine = TimetableEngine(db);

  // Insert test timetable (whole day active)
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
          endMinutes: 1440,
        ),
      );

  final observer = ClockObserver(timetableEngine);
  observer.start();

  runApp(const MaterialApp(
    home: Scaffold(
      body: Center(child: Text("Clock Observer Running")),
    ),
  ));
}