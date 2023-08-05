// GENERATED CODE - DO NOT MODIFY BY HAND

part of '_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Command _$$_CommandFromJson(Map<String, dynamic> json) => _$_Command(
      base: Experience.fromJson(json['base'] as Map<String, dynamic>),
      route: $enumDecode(_$AppRouteEnumMap, json['route']),
    );

Map<String, dynamic> _$$_CommandToJson(_$_Command instance) =>
    <String, dynamic>{
      'base': instance.base,
      'route': _$AppRouteEnumMap[instance.route]!,
    };

const _$AppRouteEnumMap = {
  AppRoute.home: 'home',
  AppRoute.login: 'login',
  AppRoute.register: 'register',
  AppRoute.now: 'now',
  AppRoute.exp: 'exp',
  AppRoute.stream: 'stream',
  AppRoute.lakes: 'lakes',
  AppRoute.four04: 'four04',
  AppRoute.debugDB: 'debugDB',
  AppRoute.settings: 'settings',
  AppRoute.commands: 'commands',
  AppRoute.search: 'search',
  AppRoute.done: 'done',
};
