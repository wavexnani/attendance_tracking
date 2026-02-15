import 'dart:async';
import '../../data/database/app_database.dart';
import 'timetable_engine.dart';

class ClockObserver {
  final TimetableEngine timetableEngine;

  Timer? _timer;
  int? _lastActiveSlotId;

  ClockObserver(this.timetableEngine);

  void start() {
    _timer = Timer.periodic(const Duration(seconds: 30), (_) async {
      final now = DateTime.now();
      final activeSlot = await timetableEngine.getActiveSlot(now);

      if (activeSlot != null) {
        if (_lastActiveSlotId != activeSlot.id) {
          _lastActiveSlotId = activeSlot.id;
          print("🟢 Active Class: ${activeSlot.subjectName}");
        }
      } else {
        if (_lastActiveSlotId != null) {
          _lastActiveSlotId = null;
          print("🔵 No Active Class");
        }
      }
    });
  }

  void stop() {
    _timer?.cancel();
  }
}