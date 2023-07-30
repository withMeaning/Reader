// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:drift/drift.dart' as drift;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:read_with_meaning/shared/domain/experience.dart';
import 'package:read_with_meaning/shared/domain/types/write.dart';

part 'note.freezed.dart';
part 'note.g.dart';

@freezed
class Note with _$Note {
  const factory Note({
    required Write base,
    required String linkToExp, // the written content as Markdown
  }) = _Note;

  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);
}

@drift.DataClassName('NoteExtra')
class NoteExtras extends drift.Table {
  drift.TextColumn get id => text().references(WriteExtras, #id)();
  drift.TextColumn get linkToExp => text().references(ExperienceEntries, #id)();
  @override
  Set<drift.Column> get primaryKey => {id};
}
