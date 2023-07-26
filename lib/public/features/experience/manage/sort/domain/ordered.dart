import 'package:drift/drift.dart';
import 'package:read_with_meaning/public/features/experience/data/database/tables.dart';

@DataClassName('Order')
class Order extends Table {
  TextColumn get id => text().references(ReadEntries, #idd)();
  IntColumn get order => integer()();
  @override
  Set<Column> get primaryKey => {id};
}
