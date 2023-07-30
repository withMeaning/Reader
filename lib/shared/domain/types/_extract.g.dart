// GENERATED CODE - DO NOT MODIFY BY HAND

part of '_extract.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Extract _$$_ExtractFromJson(Map<String, dynamic> json) => _$_Extract(
      base: Experience.fromJson(json['base'] as Map<String, dynamic>),
      uiuidFromExtractedExp: json['uiuidFromExtractedExp'] as String,
      beginCharPosition: json['beginCharPosition'] as int,
      endCharPosition: json['endCharPosition'] as int,
    );

Map<String, dynamic> _$$_ExtractToJson(_$_Extract instance) =>
    <String, dynamic>{
      'base': instance.base,
      'uiuidFromExtractedExp': instance.uiuidFromExtractedExp,
      'beginCharPosition': instance.beginCharPosition,
      'endCharPosition': instance.endCharPosition,
    };
