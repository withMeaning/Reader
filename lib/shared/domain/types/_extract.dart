// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:drift/drift.dart' as drift;
import 'package:read_with_meaning/shared/domain/experience.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '_extract.freezed.dart';
part '_extract.g.dart';

@freezed
class Extract with _$Extract {
  const factory Extract({
    required Experience
        base, // content = linkToExtractExp, to where the extract is pointing
    required String uiuidFromExtractedExp, // from where the Extract is made
    required int
        beginCharPosition, // where the extract starts, in the original content
    required int
        endCharPosition, // where the extract ends, in the original content
  }) = _Extract;

  factory Extract.fromJson(Map<String, dynamic> json) =>
      _$ExtractFromJson(json);
}

@drift.DataClassName('ExtractExtra')
class ExtractExtras extends drift.Table {
  drift.TextColumn get id => text().references(ExperienceEntries, #id)();
  drift.TextColumn get uiuidFromExtractedExp =>
      text().references(ExperienceEntries, #id)();
  drift.IntColumn get beginCharPosition => integer()();
  drift.IntColumn get endCharPosition => integer()();
  @override
  Set<drift.Column> get primaryKey => {id};
}
