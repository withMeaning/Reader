// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:drift/drift.dart' as drift;
import 'package:read_with_meaning/public/features/experience/data/database/database.dart';
import 'package:read_with_meaning/shared/domain/all_types_definition.dart';
import 'package:read_with_meaning/shared/domain/experience.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'read.freezed.dart';
part 'read.g.dart';

@freezed
class Read with _$Read {
  const factory Read({
    required Experience base,
    required String mainContent, // the main content of the article, Markdown
    @Default("manual")
    String source, // the RSS feed URL, or "Twitter, YouTube, etc."
    required String link, // link to the original content
    String? summary, // summary of the content
  }) = _Read;

  factory Read.fromJson(Map<String, dynamic> json) => _$ReadFromJson(json);

  factory Read.fromReadEntry(
      ExperienceEntry experienceEntry, ReadExtra readExtra) {
    return Read(
        base: Experience(
          id: experienceEntry.id,
          author: experienceEntry.author,
          createdAt: experienceEntry.createdAt,
          content: experienceEntry.content,
          type: AllTypes.fromString(experienceEntry.type),
        ),
        mainContent: readExtra.mainContent,
        source: readExtra.source,
        link: readExtra.link,
        summary: readExtra.summary);
  }
}

@drift.DataClassName('ReadExtra')
class ReadExtras extends drift.Table {
  drift.TextColumn get id => text().references(ExperienceEntries, #id)();
  drift.TextColumn get mainContent => text()();
  drift.TextColumn get source => text()();
  drift.TextColumn get link => text()();
  drift.TextColumn get summary => text().nullable()();
  @override
  Set<drift.Column> get primaryKey => {id};
}
