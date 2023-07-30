// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'write.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Write _$WriteFromJson(Map<String, dynamic> json) {
  return _Write.fromJson(json);
}

/// @nodoc
mixin _$Write {
  Experience get base => throw _privateConstructorUsedError;
  String get mainContent => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WriteCopyWith<Write> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WriteCopyWith<$Res> {
  factory $WriteCopyWith(Write value, $Res Function(Write) then) =
      _$WriteCopyWithImpl<$Res, Write>;
  @useResult
  $Res call({Experience base, String mainContent});

  $ExperienceCopyWith<$Res> get base;
}

/// @nodoc
class _$WriteCopyWithImpl<$Res, $Val extends Write>
    implements $WriteCopyWith<$Res> {
  _$WriteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? base = null,
    Object? mainContent = null,
  }) {
    return _then(_value.copyWith(
      base: null == base
          ? _value.base
          : base // ignore: cast_nullable_to_non_nullable
              as Experience,
      mainContent: null == mainContent
          ? _value.mainContent
          : mainContent // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$_WriteCopyWith<$Res> implements $WriteCopyWith<$Res> {
  factory _$$_WriteCopyWith(_$_Write value, $Res Function(_$_Write) then) =
      __$$_WriteCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Experience base, String mainContent});

  @override
  $ExperienceCopyWith<$Res> get base;
}

/// @nodoc
class __$$_WriteCopyWithImpl<$Res> extends _$WriteCopyWithImpl<$Res, _$_Write>
    implements _$$_WriteCopyWith<$Res> {
  __$$_WriteCopyWithImpl(_$_Write _value, $Res Function(_$_Write) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? base = null,
    Object? mainContent = null,
  }) {
    return _then(_$_Write(
      base: null == base
          ? _value.base
          : base // ignore: cast_nullable_to_non_nullable
              as Experience,
      mainContent: null == mainContent
          ? _value.mainContent
          : mainContent // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Write implements _Write {
  const _$_Write({required this.base, required this.mainContent});

  factory _$_Write.fromJson(Map<String, dynamic> json) =>
      _$$_WriteFromJson(json);

  @override
  final Experience base;
  @override
  final String mainContent;

  @override
  String toString() {
    return 'Write(base: $base, mainContent: $mainContent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Write &&
            (identical(other.base, base) || other.base == base) &&
            (identical(other.mainContent, mainContent) ||
                other.mainContent == mainContent));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, base, mainContent);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WriteCopyWith<_$_Write> get copyWith =>
      __$$_WriteCopyWithImpl<_$_Write>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WriteToJson(
      this,
    );
  }
}

abstract class _Write implements Write {
  const factory _Write(
      {required final Experience base,
      required final String mainContent}) = _$_Write;

  factory _Write.fromJson(Map<String, dynamic> json) = _$_Write.fromJson;

  @override
  Experience get base;
  @override
  String get mainContent;
  @override
  @JsonKey(ignore: true)
  _$$_WriteCopyWith<_$_Write> get copyWith =>
      throw _privateConstructorUsedError;
}
