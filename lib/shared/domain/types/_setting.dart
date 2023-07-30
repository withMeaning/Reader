// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:drift/drift.dart' as drift;
import 'package:read_with_meaning/public/routing/routes.dart';
import 'package:read_with_meaning/shared/domain/experience.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '_setting.freezed.dart';
part '_setting.g.dart';

@freezed
class Setting with _$Setting {
  const factory Setting({
    required Experience base,
    required AppRoute route,
  }) = _Setting;

  factory Setting.fromJson(Map<String, dynamic> json) =>
      _$SettingFromJson(json);
}

@drift.DataClassName('SettingExtra')
class SettingExtras extends drift.Table {
  drift.TextColumn get id => text().references(ExperienceEntries, #id)();
  drift.TextColumn get route => text()();
  @override
  Set<drift.Column> get primaryKey => {id};
}
