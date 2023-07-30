// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'read.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Read _$$_ReadFromJson(Map<String, dynamic> json) => _$_Read(
      base: Experience.fromJson(json['base'] as Map<String, dynamic>),
      mainContent: json['mainContent'] as String,
      source: json['source'] as String? ?? "manual",
      link: json['link'] as String,
      summary: json['summary'] as String?,
    );

Map<String, dynamic> _$$_ReadToJson(_$_Read instance) => <String, dynamic>{
      'base': instance.base,
      'mainContent': instance.mainContent,
      'source': instance.source,
      'link': instance.link,
      'summary': instance.summary,
    };
