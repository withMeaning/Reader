// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experience.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Experience _$$_ExperienceFromJson(Map<String, dynamic> json) =>
    _$_Experience(
      id: json['id'] as String,
      author: json['author'] as String? ?? "me",
      createdAt: DateTime.parse(json['createdAt'] as String),
      content: json['content'] as String,
      type: $enumDecode(_$AllTypesEnumMap, json['type']),
    );

Map<String, dynamic> _$$_ExperienceToJson(_$_Experience instance) =>
    <String, dynamic>{
      'id': instance.id,
      'author': instance.author,
      'createdAt': instance.createdAt.toIso8601String(),
      'content': instance.content,
      'type': _$AllTypesEnumMap[instance.type]!,
    };

const _$AllTypesEnumMap = {
  AllTypes.experience: 'experience',
  AllTypes.see: 'see',
  AllTypes.read: 'read',
  AllTypes.watch: 'watch',
  AllTypes.write: 'write',
  AllTypes.note: 'note',
  AllTypes.doit: 'doit',
  AllTypes.resolve: 'resolve',
  AllTypes.answer: 'answer',
  AllTypes.private: 'private',
  AllTypes.command: 'command',
  AllTypes.setting: 'setting',
  AllTypes.resonance: 'resonance',
  AllTypes.extract: 'extract',
};
