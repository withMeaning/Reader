import 'package:drift/drift.dart';
import 'package:read_with_meaning/shared/domain/experience.dart';

@DataClassName('Order')
class Orders extends Table {
  TextColumn get id => text().references(ExperienceEntries, #id)();
  IntColumn get orderIndex => integer()();
  @override
  Set<Column> get primaryKey => {id};
}
