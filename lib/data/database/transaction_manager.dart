import 'package:attandance_tracking/data/database/app_database.dart';

class TransactionManager {
  final AppDatabase db;

  TransactionManager(this.db);

  Future<T> runInTransaction<T>(
      Future<T> Function() action) async {
    return await db.transaction(() async {
      return await action();
    });
  }
}