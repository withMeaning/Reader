// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '_extract.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Extract _$ExtractFromJson(Map<String, dynamic> json) {
  return _Extract.fromJson(json);
}

/// @nodoc
mixin _$Extract {
  Experience get base =>
      throw _privateConstructorUsedError; // content = linkToExtractExp, to where the extract is pointing
  String get uiuidFromExtractedExp =>
      throw _privateConstructorUsedError; // from where the Extract is made
  int get beginCharPosition =>
      throw _privateConstructorUsedError; // where the extract starts, in the original content
  int get endCharPosition => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExtractCopyWith<Extract> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExtractCopyWith<$Res> {
  factory $ExtractCopyWith(Extract value, $Res Function(Extract) then) =
      _$ExtractCopyWithImpl<$Res, Extract>;
  @useResult
  $Res call(
      {Experience base,
      String uiuidFromExtractedExp,
      int beginCharPosition,
      int endCharPosition});

  $ExperienceCopyWith<$Res> get base;
}

/// @nodoc
class _$ExtractCopyWithImpl<$Res, $Val extends Extract>
    implements $ExtractCopyWith<$Res> {
  _$ExtractCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? base = null,
    Object? uiuidFromExtractedExp = null,
    Object? beginCharPosition = null,
    Object? endCharPosition = null,
  }) {
    return _then(_value.copyWith(
      base: null == base
          ? _value.base
          : base // ignore: cast_nullable_to_non_nullable
              as Experience,
      uiuidFromExtractedExp: null == uiuidFromExtractedExp
          ? _value.uiuidFromExtractedExp
          : uiuidFromExtractedExp // ignore: cast_nullable_to_non_nullable
              as String,
      beginCharPosition: null == beginCharPosition
          ? _value.beginCharPosition
          : beginCharPosition // ignore: cast_nullable_to_non_nullable
              as int,
      endCharPosition: null == endCharPosition
          ? _value.endCharPosition
          : endCharPosition // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$$_ExtractCopyWith<$Res> implements $ExtractCopyWith<$Res> {
  factory _$$_ExtractCopyWith(
          _$_Extract value, $Res Function(_$_Extract) then) =
      __$$_ExtractCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Experience base,
      String uiuidFromExtractedExp,
      int beginCharPosition,
      int endCharPosition});

  @override
  $ExperienceCopyWith<$Res> get base;
}

/// @nodoc
class __$$_ExtractCopyWithImpl<$Res>
    extends _$ExtractCopyWithImpl<$Res, _$_Extract>
    implements _$$_ExtractCopyWith<$Res> {
  __$$_ExtractCopyWithImpl(_$_Extract _value, $Res Function(_$_Extract) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? base = null,
    Object? uiuidFromExtractedExp = null,
    Object? beginCharPosition = null,
    Object? endCharPosition = null,
  }) {
    return _then(_$_Extract(
      base: null == base
          ? _value.base
          : base // ignore: cast_nullable_to_non_nullable
              as Experience,
      uiuidFromExtractedExp: null == uiuidFromExtractedExp
          ? _value.uiuidFromExtractedExp
          : uiuidFromExtractedExp // ignore: cast_nullable_to_non_nullable
              as String,
      beginCharPosition: null == beginCharPosition
          ? _value.beginCharPosition
          : beginCharPosition // ignore: cast_nullable_to_non_nullable
              as int,
      endCharPosition: null == endCharPosition
          ? _value.endCharPosition
          : endCharPosition // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Extract implements _Extract {
  const _$_Extract(
      {required this.base,
      required this.uiuidFromExtractedExp,
      required this.beginCharPosition,
      required this.endCharPosition});

  factory _$_Extract.fromJson(Map<String, dynamic> json) =>
      _$$_ExtractFromJson(json);

  @override
  final Experience base;
// content = linkToExtractExp, to where the extract is pointing
  @override
  final String uiuidFromExtractedExp;
// from where the Extract is made
  @override
  final int beginCharPosition;
// where the extract starts, in the original content
  @override
  final int endCharPosition;

  @override
  String toString() {
    return 'Extract(base: $base, uiuidFromExtractedExp: $uiuidFromExtractedExp, beginCharPosition: $beginCharPosition, endCharPosition: $endCharPosition)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Extract &&
            (identical(other.base, base) || other.base == base) &&
            (identical(other.uiuidFromExtractedExp, uiuidFromExtractedExp) ||
                other.uiuidFromExtractedExp == uiuidFromExtractedExp) &&
            (identical(other.beginCharPosition, beginCharPosition) ||
                other.beginCharPosition == beginCharPosition) &&
            (identical(other.endCharPosition, endCharPosition) ||
                other.endCharPosition == endCharPosition));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, base, uiuidFromExtractedExp,
      beginCharPosition, endCharPosition);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ExtractCopyWith<_$_Extract> get copyWith =>
      __$$_ExtractCopyWithImpl<_$_Extract>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ExtractToJson(
      this,
    );
  }
}

abstract class _Extract implements Extract {
  const factory _Extract(
      {required final Experience base,
      required final String uiuidFromExtractedExp,
      required final int beginCharPosition,
      required final int endCharPosition}) = _$_Extract;

  factory _Extract.fromJson(Map<String, dynamic> json) = _$_Extract.fromJson;

  @override
  Experience get base;
  @override // content = linkToExtractExp, to where the extract is pointing
  String get uiuidFromExtractedExp;
  @override // from where the Extract is made
  int get beginCharPosition;
  @override // where the extract starts, in the original content
  int get endCharPosition;
  @override
  @JsonKey(ignore: true)
  _$$_ExtractCopyWith<_$_Extract> get copyWith =>
      throw _privateConstructorUsedError;
}
