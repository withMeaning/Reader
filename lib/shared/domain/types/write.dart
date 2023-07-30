// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:drift/drift.dart' as drift;
import 'package:read_with_meaning/shared/domain/experience.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'write.freezed.dart';
part 'write.g.dart';

@freezed
class Write with _$Write {
  const factory Write({
    required Experience base,
    required String mainContent, // the written content as Markdown
  }) = _Write;

  factory Write.fromJson(Map<String, dynamic> json) => _$WriteFromJson(json);
}

@drift.DataClassName('WriteExtra')
class WriteExtras extends drift.Table {
  drift.TextColumn get id => text().references(ExperienceEntries, #id)();
  drift.TextColumn get mainContent => text()();
  @override
  Set<drift.Column> get primaryKey => {id};
}
