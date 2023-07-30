import 'package:drift/drift.dart';

// * See the shared domain type definitions for table registration

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
