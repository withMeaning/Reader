import 'package:drift/drift.dart';
import 'package:read_with_meaning/public/features/experience/data/database/tables.dart';

// this is turned into the Source model by drifts code generation

@DataClassName('Source')
class Sources extends Table with AutoIncrementingPrimaryKey {
  TextColumn get link => text()();
  IntColumn get resonance => integer()();
  // TextColumn get the => text()();
}
