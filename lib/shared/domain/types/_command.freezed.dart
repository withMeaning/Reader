// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '_command.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Command _$CommandFromJson(Map<String, dynamic> json) {
  return _Command.fromJson(json);
}

/// @nodoc
mixin _$Command {
  Experience get base => throw _privateConstructorUsedError;
  AppRoute get route => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommandCopyWith<Command> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommandCopyWith<$Res> {
  factory $CommandCopyWith(Command value, $Res Function(Command) then) =
      _$CommandCopyWithImpl<$Res, Command>;
  @useResult
  $Res call({Experience base, AppRoute route});

  $ExperienceCopyWith<$Res> get base;
}

/// @nodoc
class _$CommandCopyWithImpl<$Res, $Val extends Command>
    implements $CommandCopyWith<$Res> {
  _$CommandCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? base = null,
    Object? route = null,
  }) {
    return _then(_value.copyWith(
      base: null == base
          ? _value.base
          : base // ignore: cast_nullable_to_non_nullable
              as Experience,
      route: null == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as AppRoute,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ExperienceCopyWith<$Res> get base {
    return $ExperienceCopyWith<$Res>(_value.base, (value) {
      return _then(_value.copyWith(base: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CommandCopyWith<$Res> implements $CommandCopyWith<$Res> {
  factory _$$_CommandCopyWith(
          _$_Command value, $Res Function(_$_Command) then) =
      __$$_CommandCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Experience base, AppRoute route});

  @override
  $ExperienceCopyWith<$Res> get base;
}

/// @nodoc
class __$$_CommandCopyWithImpl<$Res>
    extends _$CommandCopyWithImpl<$Res, _$_Command>
    implements _$$_CommandCopyWith<$Res> {
  __$$_CommandCopyWithImpl(_$_Command _value, $Res Function(_$_Command) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? base = null,
    Object? route = null,
  }) {
    return _then(_$_Command(
      base: null == base
          ? _value.base
          : base // ignore: cast_nullable_to_non_nullable
              as Experience,
      route: null == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as AppRoute,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Command implements _Command {
  const _$_Command({required this.base, required this.route});

  factory _$_Command.fromJson(Map<String, dynamic> json) =>
      _$$_CommandFromJson(json);

  @override
  final Experience base;
  @override
  final AppRoute route;

  @override
  String toString() {
    return 'Command(base: $base, route: $route)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Command &&
            (identical(other.base, base) || other.base == base) &&
            (identical(other.route, route) || other.route == route));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, base, route);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CommandCopyWith<_$_Command> get copyWith =>
      __$$_CommandCopyWithImpl<_$_Command>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CommandToJson(
      this,
    );
  }
}

abstract class _Command implements Command {
  const factory _Command(
      {required final Experience base,
      required final AppRoute route}) = _$_Command;

  factory _Command.fromJson(Map<String, dynamic> json) = _$_Command.fromJson;

  @override
  Experience get base;
  @override
  AppRoute get route;
  @override
  @JsonKey(ignore: true)
  _$$_CommandCopyWith<_$_Command> get copyWith =>
      throw _privateConstructorUsedError;
}