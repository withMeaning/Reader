import 'package:drift/drift.dart' as drift;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:read_with_meaning/public/features/experience/data/database/tables.dart';
import 'package:read_with_meaning/shared/domain/all_types_definition.dart';

part 'experience.freezed.dart';
part 'experience.g.dart';

@freezed
class Experience with _$Experience {
  const factory Experience({
    required String id,
    @Default("me") String author,
    required DateTime createdAt,
    required String content,
    required AllTypes type,
  }) = _Experience;

  factory Experience.fromJson(Map<String, dynamic> json) =>
      _$ExperienceFromJson(json);
}

@drift.DataClassName('ExperienceEntry')
class ExperienceEntries extends drift.Table {
  drift.TextColumn get id => text()();
  drift.TextColumn get author => text()();
  drift.IntColumn get createdAt => integer().map(const DateConverter())();
  drift.TextColumn get content => text()();
  drift.TextColumn get type => text().references(MeaningTypes, #name)();
  @override
  Set<drift.Column> get primaryKey => {id};
}
