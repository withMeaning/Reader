// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $MeaningTypesTable extends MeaningTypes
    with TableInfo<$MeaningTypesTable, MeaningType> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MeaningTypesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _primaryIdMeta =
      const VerificationMeta('primaryId');
  @override
  late final GeneratedColumn<int> primaryId = GeneratedColumn<int>(
      'primary_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [primaryId, name];
  @override
  String get aliasedName => _alias ?? 'meaning_types';
  @override
  String get actualTableName => 'meaning_types';
  @override
  VerificationContext validateIntegrity(Insertable<MeaningType> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('primary_id')) {
      context.handle(_primaryIdMeta,
          primaryId.isAcceptableOrUnknown(data['primary_id']!, _primaryIdMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {primaryId};
  @override
  MeaningType map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MeaningType(
      primaryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}primary_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $MeaningTypesTable createAlias(String alias) {
    return $MeaningTypesTable(attachedDatabase, alias);
  }
}

class MeaningType extends DataClass implements Insertable<MeaningType> {
  final int primaryId;
  final String name;
  const MeaningType({required this.primaryId, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['primary_id'] = Variable<int>(primaryId);
    map['name'] = Variable<String>(name);
    return map;
  }

  MeaningTypesCompanion toCompanion(bool nullToAbsent) {
    return MeaningTypesCompanion(
      primaryId: Value(primaryId),
      name: Value(name),
    );
  }

  factory MeaningType.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MeaningType(
      primaryId: serializer.fromJson<int>(json['primaryId']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'primaryId': serializer.toJson<int>(primaryId),
      'name': serializer.toJson<String>(name),
    };
  }

  MeaningType copyWith({int? primaryId, String? name}) => MeaningType(
        primaryId: primaryId ?? this.primaryId,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('MeaningType(')
          ..write('primaryId: $primaryId, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(primaryId, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MeaningType &&
          other.primaryId == this.primaryId &&
          other.name == this.name);
}

class MeaningTypesCompanion extends UpdateCompanion<MeaningType> {
  final Value<int> primaryId;
  final Value<String> name;
  const MeaningTypesCompanion({
    this.primaryId = const Value.absent(),
    this.name = const Value.absent(),
  });
  MeaningTypesCompanion.insert({
    this.primaryId = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<MeaningType> custom({
    Expression<int>? primaryId,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (primaryId != null) 'primary_id': primaryId,
      if (name != null) 'name': name,
    });
  }

  MeaningTypesCompanion copyWith({Value<int>? primaryId, Value<String>? name}) {
    return MeaningTypesCompanion(
      primaryId: primaryId ?? this.primaryId,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (primaryId.present) {
      map['primary_id'] = Variable<int>(primaryId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MeaningTypesCompanion(')
          ..write('primaryId: $primaryId, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $ReadEntriesTable extends ReadEntries
    with TableInfo<$ReadEntriesTable, ReadEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReadEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _primaryIdMeta =
      const VerificationMeta('primaryId');
  @override
  late final GeneratedColumn<int> primaryId = GeneratedColumn<int>(
      'primary_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _authorMeta = const VerificationMeta('author');
  @override
  late final GeneratedColumn<String> author = GeneratedColumn<String>(
      'author', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumnWithTypeConverter<DateTime, int> createdAt =
      GeneratedColumn<int>('created_at', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<DateTime>($ReadEntriesTable.$convertercreatedAt);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _mainContentMeta =
      const VerificationMeta('mainContent');
  @override
  late final GeneratedColumn<String> mainContent = GeneratedColumn<String>(
      'main_content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
      'source', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _linkMeta = const VerificationMeta('link');
  @override
  late final GeneratedColumn<String> link = GeneratedColumn<String>(
      'link', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _summaryMeta =
      const VerificationMeta('summary');
  @override
  late final GeneratedColumn<String> summary = GeneratedColumn<String>(
      'summary', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<int> type = GeneratedColumn<int>(
      'type', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES meaning_types (primary_id)'));
  @override
  List<GeneratedColumn> get $columns => [
        primaryId,
        id,
        author,
        createdAt,
        title,
        mainContent,
        source,
        link,
        summary,
        type
      ];
  @override
  String get aliasedName => _alias ?? 'read_entries';
  @override
  String get actualTableName => 'read_entries';
  @override
  VerificationContext validateIntegrity(Insertable<ReadEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('primary_id')) {
      context.handle(_primaryIdMeta,
          primaryId.isAcceptableOrUnknown(data['primary_id']!, _primaryIdMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('author')) {
      context.handle(_authorMeta,
          author.isAcceptableOrUnknown(data['author']!, _authorMeta));
    } else if (isInserting) {
      context.missing(_authorMeta);
    }
    context.handle(_createdAtMeta, const VerificationResult.success());
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('main_content')) {
      context.handle(
          _mainContentMeta,
          mainContent.isAcceptableOrUnknown(
              data['main_content']!, _mainContentMeta));
    } else if (isInserting) {
      context.missing(_mainContentMeta);
    }
    if (data.containsKey('source')) {
      context.handle(_sourceMeta,
          source.isAcceptableOrUnknown(data['source']!, _sourceMeta));
    } else if (isInserting) {
      context.missing(_sourceMeta);
    }
    if (data.containsKey('link')) {
      context.handle(
          _linkMeta, link.isAcceptableOrUnknown(data['link']!, _linkMeta));
    } else if (isInserting) {
      context.missing(_linkMeta);
    }
    if (data.containsKey('summary')) {
      context.handle(_summaryMeta,
          summary.isAcceptableOrUnknown(data['summary']!, _summaryMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {primaryId};
  @override
  ReadEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReadEntry(
      primaryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}primary_id'])!,
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      author: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}author'])!,
      createdAt: $ReadEntriesTable.$convertercreatedAt.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}created_at'])!),
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      mainContent: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}main_content'])!,
      source: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source'])!,
      link: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}link'])!,
      summary: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}summary']),
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type']),
    );
  }

  @override
  $ReadEntriesTable createAlias(String alias) {
    return $ReadEntriesTable(attachedDatabase, alias);
  }

  static TypeConverter<DateTime, int> $convertercreatedAt =
      const DateConverter();
}

class ReadEntry extends DataClass implements Insertable<ReadEntry> {
  final int primaryId;
  final String id;
  final String author;
  final DateTime createdAt;
  final String title;
  final String mainContent;
  final String source;
  final String link;
  final String? summary;
  final int? type;
  const ReadEntry(
      {required this.primaryId,
      required this.id,
      required this.author,
      required this.createdAt,
      required this.title,
      required this.mainContent,
      required this.source,
      required this.link,
      this.summary,
      this.type});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['primary_id'] = Variable<int>(primaryId);
    map['id'] = Variable<String>(id);
    map['author'] = Variable<String>(author);
    {
      final converter = $ReadEntriesTable.$convertercreatedAt;
      map['created_at'] = Variable<int>(converter.toSql(createdAt));
    }
    map['title'] = Variable<String>(title);
    map['main_content'] = Variable<String>(mainContent);
    map['source'] = Variable<String>(source);
    map['link'] = Variable<String>(link);
    if (!nullToAbsent || summary != null) {
      map['summary'] = Variable<String>(summary);
    }
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<int>(type);
    }
    return map;
  }

  ReadEntriesCompanion toCompanion(bool nullToAbsent) {
    return ReadEntriesCompanion(
      primaryId: Value(primaryId),
      id: Value(id),
      author: Value(author),
      createdAt: Value(createdAt),
      title: Value(title),
      mainContent: Value(mainContent),
      source: Value(source),
      link: Value(link),
      summary: summary == null && nullToAbsent
          ? const Value.absent()
          : Value(summary),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
    );
  }

  factory ReadEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReadEntry(
      primaryId: serializer.fromJson<int>(json['primaryId']),
      id: serializer.fromJson<String>(json['id']),
      author: serializer.fromJson<String>(json['author']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      title: serializer.fromJson<String>(json['title']),
      mainContent: serializer.fromJson<String>(json['mainContent']),
      source: serializer.fromJson<String>(json['source']),
      link: serializer.fromJson<String>(json['link']),
      summary: serializer.fromJson<String?>(json['summary']),
      type: serializer.fromJson<int?>(json['type']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'primaryId': serializer.toJson<int>(primaryId),
      'id': serializer.toJson<String>(id),
      'author': serializer.toJson<String>(author),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'title': serializer.toJson<String>(title),
      'mainContent': serializer.toJson<String>(mainContent),
      'source': serializer.toJson<String>(source),
      'link': serializer.toJson<String>(link),
      'summary': serializer.toJson<String?>(summary),
      'type': serializer.toJson<int?>(type),
    };
  }

  ReadEntry copyWith(
          {int? primaryId,
          String? id,
          String? author,
          DateTime? createdAt,
          String? title,
          String? mainContent,
          String? source,
          String? link,
          Value<String?> summary = const Value.absent(),
          Value<int?> type = const Value.absent()}) =>
      ReadEntry(
        primaryId: primaryId ?? this.primaryId,
        id: id ?? this.id,
        author: author ?? this.author,
        createdAt: createdAt ?? this.createdAt,
        title: title ?? this.title,
        mainContent: mainContent ?? this.mainContent,
        source: source ?? this.source,
        link: link ?? this.link,
        summary: summary.present ? summary.value : this.summary,
        type: type.present ? type.value : this.type,
      );
  @override
  String toString() {
    return (StringBuffer('ReadEntry(')
          ..write('primaryId: $primaryId, ')
          ..write('id: $id, ')
          ..write('author: $author, ')
          ..write('createdAt: $createdAt, ')
          ..write('title: $title, ')
          ..write('mainContent: $mainContent, ')
          ..write('source: $source, ')
          ..write('link: $link, ')
          ..write('summary: $summary, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(primaryId, id, author, createdAt, title,
      mainContent, source, link, summary, type);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReadEntry &&
          other.primaryId == this.primaryId &&
          other.id == this.id &&
          other.author == this.author &&
          other.createdAt == this.createdAt &&
          other.title == this.title &&
          other.mainContent == this.mainContent &&
          other.source == this.source &&
          other.link == this.link &&
          other.summary == this.summary &&
          other.type == this.type);
}

class ReadEntriesCompanion extends UpdateCompanion<ReadEntry> {
  final Value<int> primaryId;
  final Value<String> id;
  final Value<String> author;
  final Value<DateTime> createdAt;
  final Value<String> title;
  final Value<String> mainContent;
  final Value<String> source;
  final Value<String> link;
  final Value<String?> summary;
  final Value<int?> type;
  const ReadEntriesCompanion({
    this.primaryId = const Value.absent(),
    this.id = const Value.absent(),
    this.author = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.title = const Value.absent(),
    this.mainContent = const Value.absent(),
    this.source = const Value.absent(),
    this.link = const Value.absent(),
    this.summary = const Value.absent(),
    this.type = const Value.absent(),
  });
  ReadEntriesCompanion.insert({
    this.primaryId = const Value.absent(),
    required String id,
    required String author,
    required DateTime createdAt,
    required String title,
    required String mainContent,
    required String source,
    required String link,
    this.summary = const Value.absent(),
    this.type = const Value.absent(),
  })  : id = Value(id),
        author = Value(author),
        createdAt = Value(createdAt),
        title = Value(title),
        mainContent = Value(mainContent),
        source = Value(source),
        link = Value(link);
  static Insertable<ReadEntry> custom({
    Expression<int>? primaryId,
    Expression<String>? id,
    Expression<String>? author,
    Expression<int>? createdAt,
    Expression<String>? title,
    Expression<String>? mainContent,
    Expression<String>? source,
    Expression<String>? link,
    Expression<String>? summary,
    Expression<int>? type,
  }) {
    return RawValuesInsertable({
      if (primaryId != null) 'primary_id': primaryId,
      if (id != null) 'id': id,
      if (author != null) 'author': author,
      if (createdAt != null) 'created_at': createdAt,
      if (title != null) 'title': title,
      if (mainContent != null) 'main_content': mainContent,
      if (source != null) 'source': source,
      if (link != null) 'link': link,
      if (summary != null) 'summary': summary,
      if (type != null) 'type': type,
    });
  }

  ReadEntriesCompanion copyWith(
      {Value<int>? primaryId,
      Value<String>? id,
      Value<String>? author,
      Value<DateTime>? createdAt,
      Value<String>? title,
      Value<String>? mainContent,
      Value<String>? source,
      Value<String>? link,
      Value<String?>? summary,
      Value<int?>? type}) {
    return ReadEntriesCompanion(
      primaryId: primaryId ?? this.primaryId,
      id: id ?? this.id,
      author: author ?? this.author,
      createdAt: createdAt ?? this.createdAt,
      title: title ?? this.title,
      mainContent: mainContent ?? this.mainContent,
      source: source ?? this.source,
      link: link ?? this.link,
      summary: summary ?? this.summary,
      type: type ?? this.type,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (primaryId.present) {
      map['primary_id'] = Variable<int>(primaryId.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (createdAt.present) {
      final converter = $ReadEntriesTable.$convertercreatedAt;
      map['created_at'] = Variable<int>(converter.toSql(createdAt.value));
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (mainContent.present) {
      map['main_content'] = Variable<String>(mainContent.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (link.present) {
      map['link'] = Variable<String>(link.value);
    }
    if (summary.present) {
      map['summary'] = Variable<String>(summary.value);
    }
    if (type.present) {
      map['type'] = Variable<int>(type.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReadEntriesCompanion(')
          ..write('primaryId: $primaryId, ')
          ..write('id: $id, ')
          ..write('author: $author, ')
          ..write('createdAt: $createdAt, ')
          ..write('title: $title, ')
          ..write('mainContent: $mainContent, ')
          ..write('source: $source, ')
          ..write('link: $link, ')
          ..write('summary: $summary, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $MeaningTypesTable meaningTypes = $MeaningTypesTable(this);
  late final $ReadEntriesTable readEntries = $ReadEntriesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [meaningTypes, readEntries];
}
