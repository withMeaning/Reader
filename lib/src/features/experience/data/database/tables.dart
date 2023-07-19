import 'package:drift/drift.dart';

@DataClassName('ReadEntry')
class ReadEntries extends Table with AutoIncrementingPrimaryKey {
  TextColumn get id => text()();
  TextColumn get author => text()();
  IntColumn get createdAt => integer().map(const DateConverter())();
  TextColumn get title => text()();
  TextColumn get mainContent => text()();
  TextColumn get source => text()();
  TextColumn get link => text()();
  TextColumn get summary => text().nullable()();
  IntColumn get type =>
      integer().nullable().references(MeaningTypes, #primaryId)();
}

@DataClassName('MeaningType')
class MeaningTypes extends Table with AutoIncrementingPrimaryKey {
  TextColumn get name => text()();
}

mixin AutoIncrementingPrimaryKey on Table {
  IntColumn get primaryId => integer().autoIncrement()();
}

class DateConverter extends TypeConverter<DateTime, int> {
  const DateConverter();

  // converts UTC timestamp as int to local time as DateTime
  @override
  DateTime fromSql(int fromDb) =>
      DateTime.fromMillisecondsSinceEpoch(fromDb * 1000, isUtc: true).toLocal();

  // converts local DateTime back to UTC time
  @override
  int toSql(DateTime value) => value.toUtc().millisecondsSinceEpoch ~/ 1000;
}
