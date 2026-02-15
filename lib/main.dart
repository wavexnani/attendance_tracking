import 'package:flutter/material.dart';
import 'data/database/app_database.dart';
import 'data/database/transaction_manager.dart';
import 'application/engines/attendance_engine.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final db = AppDatabase();
  final tx = TransactionManager(db);
  final engine = AttendanceEngine(db, tx);

  await engine.debugTest();

  runApp(const MaterialApp(
    home: Scaffold(
      body: Center(child: Text("Attendance Engine Test Running")),
    ),
  ));
}