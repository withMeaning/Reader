// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:drift/drift.dart' as drift;
import 'package:read_with_meaning/public/routing/routes.dart';
import 'package:read_with_meaning/shared/domain/experience.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '_command.freezed.dart';
part '_command.g.dart';

@freezed
class Command with _$Command {
  const factory Command({
    required Experience base,
    required AppRoute route,
  }) = _Command;

  factory Command.fromJson(Map<String, dynamic> json) =>
      _$CommandFromJson(json);
}

@drift.DataClassName('CommandExtra')
class CommandExtras extends drift.Table {
  drift.TextColumn get id => text().references(ExperienceEntries, #id)();
  drift.TextColumn get route => text()();
  @override
  Set<drift.Column> get primaryKey => {id};
}
