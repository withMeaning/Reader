// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'read.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Read _$ReadFromJson(Map<String, dynamic> json) {
  return _Read.fromJson(json);
}

/// @nodoc
mixin _$Read {
  Experience get base => throw _privateConstructorUsedError;
  String get mainContent =>
      throw _privateConstructorUsedError; // the main content of the article, Markdown
  String get source =>
      throw _privateConstructorUsedError; // the RSS feed URL, or "Twitter, YouTube, etc."
  String get link =>
      throw _privateConstructorUsedError; // link to the original content
  String? get summary => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReadCopyWith<Read> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReadCopyWith<$Res> {
  factory $ReadCopyWith(Read value, $Res Function(Read) then) =
      _$ReadCopyWithImpl<$Res, Read>;
  @useResult
  $Res call(
      {Experience base,
      String mainContent,
      String source,
      String link,
      String? summary});

  $ExperienceCopyWith<$Res> get base;
}

/// @nodoc
class _$ReadCopyWithImpl<$Res, $Val extends Read>
    implements $ReadCopyWith<$Res> {
  _$ReadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? base = null,
    Object? mainContent = null,
    Object? source = null,
    Object? link = null,
    Object? summary = freezed,
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
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$_ReadCopyWith<$Res> implements $ReadCopyWith<$Res> {
  factory _$$_ReadCopyWith(_$_Read value, $Res Function(_$_Read) then) =
      __$$_ReadCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Experience base,
      String mainContent,
      String source,
      String link,
      String? summary});

  @override
  $ExperienceCopyWith<$Res> get base;
}

/// @nodoc
class __$$_ReadCopyWithImpl<$Res> extends _$ReadCopyWithImpl<$Res, _$_Read>
    implements _$$_ReadCopyWith<$Res> {
  __$$_ReadCopyWithImpl(_$_Read _value, $Res Function(_$_Read) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? base = null,
    Object? mainContent = null,
    Object? source = null,
    Object? link = null,
    Object? summary = freezed,
  }) {
    return _then(_$_Read(
      base: null == base
          ? _value.base
          : base // ignore: cast_nullable_to_non_nullable
              as Experience,
      mainContent: null == mainContent
          ? _value.mainContent
          : mainContent // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Read implements _Read {
  const _$_Read(
      {required this.base,
      required this.mainContent,
      this.source = "manual",
      required this.link,
      this.summary});

  factory _$_Read.fromJson(Map<String, dynamic> json) => _$$_ReadFromJson(json);

  @override
  final Experience base;
  @override
  final String mainContent;
// the main content of the article, Markdown
  @override
  @JsonKey()
  final String source;
// the RSS feed URL, or "Twitter, YouTube, etc."
  @override
  final String link;
// link to the original content
  @override
  final String? summary;

  @override
  String toString() {
    return 'Read(base: $base, mainContent: $mainContent, source: $source, link: $link, summary: $summary)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Read &&
            (identical(other.base, base) || other.base == base) &&
            (identical(other.mainContent, mainContent) ||
                other.mainContent == mainContent) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.summary, summary) || other.summary == summary));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, base, mainContent, source, link, summary);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReadCopyWith<_$_Read> get copyWith =>
      __$$_ReadCopyWithImpl<_$_Read>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReadToJson(
      this,
    );
  }
}

abstract class _Read implements Read {
  const factory _Read(
      {required final Experience base,
      required final String mainContent,
      final String source,
      required final String link,
      final String? summary}) = _$_Read;

  factory _Read.fromJson(Map<String, dynamic> json) = _$_Read.fromJson;

  @override
  Experience get base;
  @override
  String get mainContent;
  @override // the main content of the article, Markdown
  String get source;
  @override // the RSS feed URL, or "Twitter, YouTube, etc."
  String get link;
  @override // link to the original content
  String? get summary;
  @override
  @JsonKey(ignore: true)
  _$$_ReadCopyWith<_$_Read> get copyWith => throw _privateConstructorUsedError;
}
