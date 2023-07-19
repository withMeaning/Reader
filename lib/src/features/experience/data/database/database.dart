import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'connection/connection.dart' as impl;
import 'tables.dart';
// Manually generated by `drift_dev schema steps` - this file makes writing
// migrations easier. See this for details:
// https://drift.simonbinder.eu/docs/advanced-features/migrations/#step-by-step
// import 'schema_versions.dart';

part 'database.g.dart';

@DriftDatabase(tables: [ReadEntries, MeaningTypes]) // include: {'sql.drift'}
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(impl.connect());

  AppDatabase.forTesting(DatabaseConnection super.connection);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(beforeOpen: (details) async {
      // Make sure that foreign keys are enabled
      await customStatement('PRAGMA foreign_keys = ON');
      if (details.wasCreated) {
        // Create a bunch of default values so the app doesn't look too empty
        // on the first start.
        await batch((b) {
          b.insert(
            meaningTypes,
            MeaningTypesCompanion.insert(name: 'experience'),
          );
        });
      }
    });
  }

  static final StateProvider<AppDatabase> provider = StateProvider((ref) {
    // !! this is the main line, where the DB is exposed as a StateProvider from RiverPod
    final database = AppDatabase();
    ref.onDispose(database.close);

    return database;
  });

  Stream<List<dynamic>> watchTypes() {
    return (select(meaningTypes).watch());
  }
}
