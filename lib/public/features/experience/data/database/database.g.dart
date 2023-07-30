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
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
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

class $ExperienceEntriesTable extends ExperienceEntries
    with TableInfo<$ExperienceEntriesTable, ExperienceEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExperienceEntriesTable(this.attachedDatabase, [this._alias]);
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
          .withConverter<DateTime>($ExperienceEntriesTable.$convertercreatedAt);
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES meaning_types (name)'));
  @override
  List<GeneratedColumn> get $columns => [id, author, createdAt, content, type];
  @override
  String get aliasedName => _alias ?? 'experience_entries';
  @override
  String get actualTableName => 'experience_entries';
  @override
  VerificationContext validateIntegrity(Insertable<ExperienceEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
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
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExperienceEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExperienceEntry(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      author: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}author'])!,
      createdAt: $ExperienceEntriesTable.$convertercreatedAt.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.int, data['${effectivePrefix}created_at'])!),
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
    );
  }

  @override
  $ExperienceEntriesTable createAlias(String alias) {
    return $ExperienceEntriesTable(attachedDatabase, alias);
  }

  static TypeConverter<DateTime, int> $convertercreatedAt =
      const DateConverter();
}

class ExperienceEntry extends DataClass implements Insertable<ExperienceEntry> {
  final String id;
  final String author;
  final DateTime createdAt;
  final String content;
  final String type;
  const ExperienceEntry(
      {required this.id,
      required this.author,
      required this.createdAt,
      required this.content,
      required this.type});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['author'] = Variable<String>(author);
    {
      final converter = $ExperienceEntriesTable.$convertercreatedAt;
      map['created_at'] = Variable<int>(converter.toSql(createdAt));
    }
    map['content'] = Variable<String>(content);
    map['type'] = Variable<String>(type);
    return map;
  }

  ExperienceEntriesCompanion toCompanion(bool nullToAbsent) {
    return ExperienceEntriesCompanion(
      id: Value(id),
      author: Value(author),
      createdAt: Value(createdAt),
      content: Value(content),
      type: Value(type),
    );
  }

  factory ExperienceEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExperienceEntry(
      id: serializer.fromJson<String>(json['id']),
      author: serializer.fromJson<String>(json['author']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      content: serializer.fromJson<String>(json['content']),
      type: serializer.fromJson<String>(json['type']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'author': serializer.toJson<String>(author),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'content': serializer.toJson<String>(content),
      'type': serializer.toJson<String>(type),
    };
  }

  ExperienceEntry copyWith(
          {String? id,
          String? author,
          DateTime? createdAt,
          String? content,
          String? type}) =>
      ExperienceEntry(
        id: id ?? this.id,
        author: author ?? this.author,
        createdAt: createdAt ?? this.createdAt,
        content: content ?? this.content,
        type: type ?? this.type,
      );
  @override
  String toString() {
    return (StringBuffer('ExperienceEntry(')
          ..write('id: $id, ')
          ..write('author: $author, ')
          ..write('createdAt: $createdAt, ')
          ..write('content: $content, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, author, createdAt, content, type);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExperienceEntry &&
          other.id == this.id &&
          other.author == this.author &&
          other.createdAt == this.createdAt &&
          other.content == this.content &&
          other.type == this.type);
}

class ExperienceEntriesCompanion extends UpdateCompanion<ExperienceEntry> {
  final Value<String> id;
  final Value<String> author;
  final Value<DateTime> createdAt;
  final Value<String> content;
  final Value<String> type;
  final Value<int> rowid;
  const ExperienceEntriesCompanion({
    this.id = const Value.absent(),
    this.author = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.content = const Value.absent(),
    this.type = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ExperienceEntriesCompanion.insert({
    required String id,
    required String author,
    required DateTime createdAt,
    required String content,
    required String type,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        author = Value(author),
        createdAt = Value(createdAt),
        content = Value(content),
        type = Value(type);
  static Insertable<ExperienceEntry> custom({
    Expression<String>? id,
    Expression<String>? author,
    Expression<int>? createdAt,
    Expression<String>? content,
    Expression<String>? type,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (author != null) 'author': author,
      if (createdAt != null) 'created_at': createdAt,
      if (content != null) 'content': content,
      if (type != null) 'type': type,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ExperienceEntriesCompanion copyWith(
      {Value<String>? id,
      Value<String>? author,
      Value<DateTime>? createdAt,
      Value<String>? content,
      Value<String>? type,
      Value<int>? rowid}) {
    return ExperienceEntriesCompanion(
      id: id ?? this.id,
      author: author ?? this.author,
      createdAt: createdAt ?? this.createdAt,
      content: content ?? this.content,
      type: type ?? this.type,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (createdAt.present) {
      final converter = $ExperienceEntriesTable.$convertercreatedAt;
      map['created_at'] = Variable<int>(converter.toSql(createdAt.value));
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExperienceEntriesCompanion(')
          ..write('id: $id, ')
          ..write('author: $author, ')
          ..write('createdAt: $createdAt, ')
          ..write('content: $content, ')
          ..write('type: $type, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $OrdersTable extends Orders with TableInfo<$OrdersTable, Order> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrdersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES experience_entries (id)'));
  static const VerificationMeta _orderIndexMeta =
      const VerificationMeta('orderIndex');
  @override
  late final GeneratedColumn<int> orderIndex = GeneratedColumn<int>(
      'order_index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, orderIndex];
  @override
  String get aliasedName => _alias ?? 'orders';
  @override
  String get actualTableName => 'orders';
  @override
  VerificationContext validateIntegrity(Insertable<Order> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('order_index')) {
      context.handle(
          _orderIndexMeta,
          orderIndex.isAcceptableOrUnknown(
              data['order_index']!, _orderIndexMeta));
    } else if (isInserting) {
      context.missing(_orderIndexMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Order map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Order(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      orderIndex: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}order_index'])!,
    );
  }

  @override
  $OrdersTable createAlias(String alias) {
    return $OrdersTable(attachedDatabase, alias);
  }
}

class Order extends DataClass implements Insertable<Order> {
  final String id;
  final int orderIndex;
  const Order({required this.id, required this.orderIndex});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['order_index'] = Variable<int>(orderIndex);
    return map;
  }

  OrdersCompanion toCompanion(bool nullToAbsent) {
    return OrdersCompanion(
      id: Value(id),
      orderIndex: Value(orderIndex),
    );
  }

  factory Order.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Order(
      id: serializer.fromJson<String>(json['id']),
      orderIndex: serializer.fromJson<int>(json['orderIndex']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'orderIndex': serializer.toJson<int>(orderIndex),
    };
  }

  Order copyWith({String? id, int? orderIndex}) => Order(
        id: id ?? this.id,
        orderIndex: orderIndex ?? this.orderIndex,
      );
  @override
  String toString() {
    return (StringBuffer('Order(')
          ..write('id: $id, ')
          ..write('orderIndex: $orderIndex')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, orderIndex);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Order &&
          other.id == this.id &&
          other.orderIndex == this.orderIndex);
}

class OrdersCompanion extends UpdateCompanion<Order> {
  final Value<String> id;
  final Value<int> orderIndex;
  final Value<int> rowid;
  const OrdersCompanion({
    this.id = const Value.absent(),
    this.orderIndex = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  OrdersCompanion.insert({
    required String id,
    required int orderIndex,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        orderIndex = Value(orderIndex);
  static Insertable<Order> custom({
    Expression<String>? id,
    Expression<int>? orderIndex,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (orderIndex != null) 'order_index': orderIndex,
      if (rowid != null) 'rowid': rowid,
    });
  }

  OrdersCompanion copyWith(
      {Value<String>? id, Value<int>? orderIndex, Value<int>? rowid}) {
    return OrdersCompanion(
      id: id ?? this.id,
      orderIndex: orderIndex ?? this.orderIndex,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (orderIndex.present) {
      map['order_index'] = Variable<int>(orderIndex.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrdersCompanion(')
          ..write('id: $id, ')
          ..write('orderIndex: $orderIndex, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ReadExtrasTable extends ReadExtras
    with TableInfo<$ReadExtrasTable, ReadExtra> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReadExtrasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES experience_entries (id)'));
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
  @override
  List<GeneratedColumn> get $columns =>
      [id, mainContent, source, link, summary];
  @override
  String get aliasedName => _alias ?? 'read_extras';
  @override
  String get actualTableName => 'read_extras';
  @override
  VerificationContext validateIntegrity(Insertable<ReadExtra> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReadExtra map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReadExtra(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      mainContent: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}main_content'])!,
      source: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source'])!,
      link: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}link'])!,
      summary: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}summary']),
    );
  }

  @override
  $ReadExtrasTable createAlias(String alias) {
    return $ReadExtrasTable(attachedDatabase, alias);
  }
}

class ReadExtra extends DataClass implements Insertable<ReadExtra> {
  final String id;
  final String mainContent;
  final String source;
  final String link;
  final String? summary;
  const ReadExtra(
      {required this.id,
      required this.mainContent,
      required this.source,
      required this.link,
      this.summary});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['main_content'] = Variable<String>(mainContent);
    map['source'] = Variable<String>(source);
    map['link'] = Variable<String>(link);
    if (!nullToAbsent || summary != null) {
      map['summary'] = Variable<String>(summary);
    }
    return map;
  }

  ReadExtrasCompanion toCompanion(bool nullToAbsent) {
    return ReadExtrasCompanion(
      id: Value(id),
      mainContent: Value(mainContent),
      source: Value(source),
      link: Value(link),
      summary: summary == null && nullToAbsent
          ? const Value.absent()
          : Value(summary),
    );
  }

  factory ReadExtra.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReadExtra(
      id: serializer.fromJson<String>(json['id']),
      mainContent: serializer.fromJson<String>(json['mainContent']),
      source: serializer.fromJson<String>(json['source']),
      link: serializer.fromJson<String>(json['link']),
      summary: serializer.fromJson<String?>(json['summary']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'mainContent': serializer.toJson<String>(mainContent),
      'source': serializer.toJson<String>(source),
      'link': serializer.toJson<String>(link),
      'summary': serializer.toJson<String?>(summary),
    };
  }

  ReadExtra copyWith(
          {String? id,
          String? mainContent,
          String? source,
          String? link,
          Value<String?> summary = const Value.absent()}) =>
      ReadExtra(
        id: id ?? this.id,
        mainContent: mainContent ?? this.mainContent,
        source: source ?? this.source,
        link: link ?? this.link,
        summary: summary.present ? summary.value : this.summary,
      );
  @override
  String toString() {
    return (StringBuffer('ReadExtra(')
          ..write('id: $id, ')
          ..write('mainContent: $mainContent, ')
          ..write('source: $source, ')
          ..write('link: $link, ')
          ..write('summary: $summary')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, mainContent, source, link, summary);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReadExtra &&
          other.id == this.id &&
          other.mainContent == this.mainContent &&
          other.source == this.source &&
          other.link == this.link &&
          other.summary == this.summary);
}

class ReadExtrasCompanion extends UpdateCompanion<ReadExtra> {
  final Value<String> id;
  final Value<String> mainContent;
  final Value<String> source;
  final Value<String> link;
  final Value<String?> summary;
  final Value<int> rowid;
  const ReadExtrasCompanion({
    this.id = const Value.absent(),
    this.mainContent = const Value.absent(),
    this.source = const Value.absent(),
    this.link = const Value.absent(),
    this.summary = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ReadExtrasCompanion.insert({
    required String id,
    required String mainContent,
    required String source,
    required String link,
    this.summary = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        mainContent = Value(mainContent),
        source = Value(source),
        link = Value(link);
  static Insertable<ReadExtra> custom({
    Expression<String>? id,
    Expression<String>? mainContent,
    Expression<String>? source,
    Expression<String>? link,
    Expression<String>? summary,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (mainContent != null) 'main_content': mainContent,
      if (source != null) 'source': source,
      if (link != null) 'link': link,
      if (summary != null) 'summary': summary,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ReadExtrasCompanion copyWith(
      {Value<String>? id,
      Value<String>? mainContent,
      Value<String>? source,
      Value<String>? link,
      Value<String?>? summary,
      Value<int>? rowid}) {
    return ReadExtrasCompanion(
      id: id ?? this.id,
      mainContent: mainContent ?? this.mainContent,
      source: source ?? this.source,
      link: link ?? this.link,
      summary: summary ?? this.summary,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
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
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReadExtrasCompanion(')
          ..write('id: $id, ')
          ..write('mainContent: $mainContent, ')
          ..write('source: $source, ')
          ..write('link: $link, ')
          ..write('summary: $summary, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WriteExtrasTable extends WriteExtras
    with TableInfo<$WriteExtrasTable, WriteExtra> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WriteExtrasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES experience_entries (id)'));
  static const VerificationMeta _mainContentMeta =
      const VerificationMeta('mainContent');
  @override
  late final GeneratedColumn<String> mainContent = GeneratedColumn<String>(
      'main_content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, mainContent];
  @override
  String get aliasedName => _alias ?? 'write_extras';
  @override
  String get actualTableName => 'write_extras';
  @override
  VerificationContext validateIntegrity(Insertable<WriteExtra> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('main_content')) {
      context.handle(
          _mainContentMeta,
          mainContent.isAcceptableOrUnknown(
              data['main_content']!, _mainContentMeta));
    } else if (isInserting) {
      context.missing(_mainContentMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WriteExtra map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WriteExtra(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      mainContent: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}main_content'])!,
    );
  }

  @override
  $WriteExtrasTable createAlias(String alias) {
    return $WriteExtrasTable(attachedDatabase, alias);
  }
}

class WriteExtra extends DataClass implements Insertable<WriteExtra> {
  final String id;
  final String mainContent;
  const WriteExtra({required this.id, required this.mainContent});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['main_content'] = Variable<String>(mainContent);
    return map;
  }

  WriteExtrasCompanion toCompanion(bool nullToAbsent) {
    return WriteExtrasCompanion(
      id: Value(id),
      mainContent: Value(mainContent),
    );
  }

  factory WriteExtra.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WriteExtra(
      id: serializer.fromJson<String>(json['id']),
      mainContent: serializer.fromJson<String>(json['mainContent']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'mainContent': serializer.toJson<String>(mainContent),
    };
  }

  WriteExtra copyWith({String? id, String? mainContent}) => WriteExtra(
        id: id ?? this.id,
        mainContent: mainContent ?? this.mainContent,
      );
  @override
  String toString() {
    return (StringBuffer('WriteExtra(')
          ..write('id: $id, ')
          ..write('mainContent: $mainContent')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, mainContent);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WriteExtra &&
          other.id == this.id &&
          other.mainContent == this.mainContent);
}

class WriteExtrasCompanion extends UpdateCompanion<WriteExtra> {
  final Value<String> id;
  final Value<String> mainContent;
  final Value<int> rowid;
  const WriteExtrasCompanion({
    this.id = const Value.absent(),
    this.mainContent = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WriteExtrasCompanion.insert({
    required String id,
    required String mainContent,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        mainContent = Value(mainContent);
  static Insertable<WriteExtra> custom({
    Expression<String>? id,
    Expression<String>? mainContent,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (mainContent != null) 'main_content': mainContent,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WriteExtrasCompanion copyWith(
      {Value<String>? id, Value<String>? mainContent, Value<int>? rowid}) {
    return WriteExtrasCompanion(
      id: id ?? this.id,
      mainContent: mainContent ?? this.mainContent,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (mainContent.present) {
      map['main_content'] = Variable<String>(mainContent.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WriteExtrasCompanion(')
          ..write('id: $id, ')
          ..write('mainContent: $mainContent, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $NoteExtrasTable extends NoteExtras
    with TableInfo<$NoteExtrasTable, NoteExtra> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NoteExtrasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES write_extras (id)'));
  static const VerificationMeta _linkToExpMeta =
      const VerificationMeta('linkToExp');
  @override
  late final GeneratedColumn<String> linkToExp = GeneratedColumn<String>(
      'link_to_exp', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES experience_entries (id)'));
  @override
  List<GeneratedColumn> get $columns => [id, linkToExp];
  @override
  String get aliasedName => _alias ?? 'note_extras';
  @override
  String get actualTableName => 'note_extras';
  @override
  VerificationContext validateIntegrity(Insertable<NoteExtra> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('link_to_exp')) {
      context.handle(
          _linkToExpMeta,
          linkToExp.isAcceptableOrUnknown(
              data['link_to_exp']!, _linkToExpMeta));
    } else if (isInserting) {
      context.missing(_linkToExpMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NoteExtra map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NoteExtra(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      linkToExp: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}link_to_exp'])!,
    );
  }

  @override
  $NoteExtrasTable createAlias(String alias) {
    return $NoteExtrasTable(attachedDatabase, alias);
  }
}

class NoteExtra extends DataClass implements Insertable<NoteExtra> {
  final String id;
  final String linkToExp;
  const NoteExtra({required this.id, required this.linkToExp});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['link_to_exp'] = Variable<String>(linkToExp);
    return map;
  }

  NoteExtrasCompanion toCompanion(bool nullToAbsent) {
    return NoteExtrasCompanion(
      id: Value(id),
      linkToExp: Value(linkToExp),
    );
  }

  factory NoteExtra.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NoteExtra(
      id: serializer.fromJson<String>(json['id']),
      linkToExp: serializer.fromJson<String>(json['linkToExp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'linkToExp': serializer.toJson<String>(linkToExp),
    };
  }

  NoteExtra copyWith({String? id, String? linkToExp}) => NoteExtra(
        id: id ?? this.id,
        linkToExp: linkToExp ?? this.linkToExp,
      );
  @override
  String toString() {
    return (StringBuffer('NoteExtra(')
          ..write('id: $id, ')
          ..write('linkToExp: $linkToExp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, linkToExp);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NoteExtra &&
          other.id == this.id &&
          other.linkToExp == this.linkToExp);
}

class NoteExtrasCompanion extends UpdateCompanion<NoteExtra> {
  final Value<String> id;
  final Value<String> linkToExp;
  final Value<int> rowid;
  const NoteExtrasCompanion({
    this.id = const Value.absent(),
    this.linkToExp = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  NoteExtrasCompanion.insert({
    required String id,
    required String linkToExp,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        linkToExp = Value(linkToExp);
  static Insertable<NoteExtra> custom({
    Expression<String>? id,
    Expression<String>? linkToExp,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (linkToExp != null) 'link_to_exp': linkToExp,
      if (rowid != null) 'rowid': rowid,
    });
  }

  NoteExtrasCompanion copyWith(
      {Value<String>? id, Value<String>? linkToExp, Value<int>? rowid}) {
    return NoteExtrasCompanion(
      id: id ?? this.id,
      linkToExp: linkToExp ?? this.linkToExp,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (linkToExp.present) {
      map['link_to_exp'] = Variable<String>(linkToExp.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NoteExtrasCompanion(')
          ..write('id: $id, ')
          ..write('linkToExp: $linkToExp, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ExtractExtrasTable extends ExtractExtras
    with TableInfo<$ExtractExtrasTable, ExtractExtra> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExtractExtrasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES experience_entries (id)'));
  static const VerificationMeta _uiuidFromExtractedExpMeta =
      const VerificationMeta('uiuidFromExtractedExp');
  @override
  late final GeneratedColumn<String> uiuidFromExtractedExp =
      GeneratedColumn<String>('uiuid_from_extracted_exp', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'REFERENCES experience_entries (id)'));
  static const VerificationMeta _beginCharPositionMeta =
      const VerificationMeta('beginCharPosition');
  @override
  late final GeneratedColumn<int> beginCharPosition = GeneratedColumn<int>(
      'begin_char_position', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _endCharPositionMeta =
      const VerificationMeta('endCharPosition');
  @override
  late final GeneratedColumn<int> endCharPosition = GeneratedColumn<int>(
      'end_char_position', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, uiuidFromExtractedExp, beginCharPosition, endCharPosition];
  @override
  String get aliasedName => _alias ?? 'extract_extras';
  @override
  String get actualTableName => 'extract_extras';
  @override
  VerificationContext validateIntegrity(Insertable<ExtractExtra> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('uiuid_from_extracted_exp')) {
      context.handle(
          _uiuidFromExtractedExpMeta,
          uiuidFromExtractedExp.isAcceptableOrUnknown(
              data['uiuid_from_extracted_exp']!, _uiuidFromExtractedExpMeta));
    } else if (isInserting) {
      context.missing(_uiuidFromExtractedExpMeta);
    }
    if (data.containsKey('begin_char_position')) {
      context.handle(
          _beginCharPositionMeta,
          beginCharPosition.isAcceptableOrUnknown(
              data['begin_char_position']!, _beginCharPositionMeta));
    } else if (isInserting) {
      context.missing(_beginCharPositionMeta);
    }
    if (data.containsKey('end_char_position')) {
      context.handle(
          _endCharPositionMeta,
          endCharPosition.isAcceptableOrUnknown(
              data['end_char_position']!, _endCharPositionMeta));
    } else if (isInserting) {
      context.missing(_endCharPositionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExtractExtra map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExtractExtra(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      uiuidFromExtractedExp: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}uiuid_from_extracted_exp'])!,
      beginCharPosition: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}begin_char_position'])!,
      endCharPosition: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}end_char_position'])!,
    );
  }

  @override
  $ExtractExtrasTable createAlias(String alias) {
    return $ExtractExtrasTable(attachedDatabase, alias);
  }
}

class ExtractExtra extends DataClass implements Insertable<ExtractExtra> {
  final String id;
  final String uiuidFromExtractedExp;
  final int beginCharPosition;
  final int endCharPosition;
  const ExtractExtra(
      {required this.id,
      required this.uiuidFromExtractedExp,
      required this.beginCharPosition,
      required this.endCharPosition});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['uiuid_from_extracted_exp'] = Variable<String>(uiuidFromExtractedExp);
    map['begin_char_position'] = Variable<int>(beginCharPosition);
    map['end_char_position'] = Variable<int>(endCharPosition);
    return map;
  }

  ExtractExtrasCompanion toCompanion(bool nullToAbsent) {
    return ExtractExtrasCompanion(
      id: Value(id),
      uiuidFromExtractedExp: Value(uiuidFromExtractedExp),
      beginCharPosition: Value(beginCharPosition),
      endCharPosition: Value(endCharPosition),
    );
  }

  factory ExtractExtra.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExtractExtra(
      id: serializer.fromJson<String>(json['id']),
      uiuidFromExtractedExp:
          serializer.fromJson<String>(json['uiuidFromExtractedExp']),
      beginCharPosition: serializer.fromJson<int>(json['beginCharPosition']),
      endCharPosition: serializer.fromJson<int>(json['endCharPosition']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'uiuidFromExtractedExp': serializer.toJson<String>(uiuidFromExtractedExp),
      'beginCharPosition': serializer.toJson<int>(beginCharPosition),
      'endCharPosition': serializer.toJson<int>(endCharPosition),
    };
  }

  ExtractExtra copyWith(
          {String? id,
          String? uiuidFromExtractedExp,
          int? beginCharPosition,
          int? endCharPosition}) =>
      ExtractExtra(
        id: id ?? this.id,
        uiuidFromExtractedExp:
            uiuidFromExtractedExp ?? this.uiuidFromExtractedExp,
        beginCharPosition: beginCharPosition ?? this.beginCharPosition,
        endCharPosition: endCharPosition ?? this.endCharPosition,
      );
  @override
  String toString() {
    return (StringBuffer('ExtractExtra(')
          ..write('id: $id, ')
          ..write('uiuidFromExtractedExp: $uiuidFromExtractedExp, ')
          ..write('beginCharPosition: $beginCharPosition, ')
          ..write('endCharPosition: $endCharPosition')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, uiuidFromExtractedExp, beginCharPosition, endCharPosition);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExtractExtra &&
          other.id == this.id &&
          other.uiuidFromExtractedExp == this.uiuidFromExtractedExp &&
          other.beginCharPosition == this.beginCharPosition &&
          other.endCharPosition == this.endCharPosition);
}

class ExtractExtrasCompanion extends UpdateCompanion<ExtractExtra> {
  final Value<String> id;
  final Value<String> uiuidFromExtractedExp;
  final Value<int> beginCharPosition;
  final Value<int> endCharPosition;
  final Value<int> rowid;
  const ExtractExtrasCompanion({
    this.id = const Value.absent(),
    this.uiuidFromExtractedExp = const Value.absent(),
    this.beginCharPosition = const Value.absent(),
    this.endCharPosition = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ExtractExtrasCompanion.insert({
    required String id,
    required String uiuidFromExtractedExp,
    required int beginCharPosition,
    required int endCharPosition,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        uiuidFromExtractedExp = Value(uiuidFromExtractedExp),
        beginCharPosition = Value(beginCharPosition),
        endCharPosition = Value(endCharPosition);
  static Insertable<ExtractExtra> custom({
    Expression<String>? id,
    Expression<String>? uiuidFromExtractedExp,
    Expression<int>? beginCharPosition,
    Expression<int>? endCharPosition,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uiuidFromExtractedExp != null)
        'uiuid_from_extracted_exp': uiuidFromExtractedExp,
      if (beginCharPosition != null) 'begin_char_position': beginCharPosition,
      if (endCharPosition != null) 'end_char_position': endCharPosition,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ExtractExtrasCompanion copyWith(
      {Value<String>? id,
      Value<String>? uiuidFromExtractedExp,
      Value<int>? beginCharPosition,
      Value<int>? endCharPosition,
      Value<int>? rowid}) {
    return ExtractExtrasCompanion(
      id: id ?? this.id,
      uiuidFromExtractedExp:
          uiuidFromExtractedExp ?? this.uiuidFromExtractedExp,
      beginCharPosition: beginCharPosition ?? this.beginCharPosition,
      endCharPosition: endCharPosition ?? this.endCharPosition,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (uiuidFromExtractedExp.present) {
      map['uiuid_from_extracted_exp'] =
          Variable<String>(uiuidFromExtractedExp.value);
    }
    if (beginCharPosition.present) {
      map['begin_char_position'] = Variable<int>(beginCharPosition.value);
    }
    if (endCharPosition.present) {
      map['end_char_position'] = Variable<int>(endCharPosition.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExtractExtrasCompanion(')
          ..write('id: $id, ')
          ..write('uiuidFromExtractedExp: $uiuidFromExtractedExp, ')
          ..write('beginCharPosition: $beginCharPosition, ')
          ..write('endCharPosition: $endCharPosition, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SettingExtrasTable extends SettingExtras
    with TableInfo<$SettingExtrasTable, SettingExtra> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SettingExtrasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES experience_entries (id)'));
  static const VerificationMeta _routeMeta = const VerificationMeta('route');
  @override
  late final GeneratedColumn<String> route = GeneratedColumn<String>(
      'route', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, route];
  @override
  String get aliasedName => _alias ?? 'setting_extras';
  @override
  String get actualTableName => 'setting_extras';
  @override
  VerificationContext validateIntegrity(Insertable<SettingExtra> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('route')) {
      context.handle(
          _routeMeta, route.isAcceptableOrUnknown(data['route']!, _routeMeta));
    } else if (isInserting) {
      context.missing(_routeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SettingExtra map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SettingExtra(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      route: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}route'])!,
    );
  }

  @override
  $SettingExtrasTable createAlias(String alias) {
    return $SettingExtrasTable(attachedDatabase, alias);
  }
}

class SettingExtra extends DataClass implements Insertable<SettingExtra> {
  final String id;
  final String route;
  const SettingExtra({required this.id, required this.route});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['route'] = Variable<String>(route);
    return map;
  }

  SettingExtrasCompanion toCompanion(bool nullToAbsent) {
    return SettingExtrasCompanion(
      id: Value(id),
      route: Value(route),
    );
  }

  factory SettingExtra.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SettingExtra(
      id: serializer.fromJson<String>(json['id']),
      route: serializer.fromJson<String>(json['route']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'route': serializer.toJson<String>(route),
    };
  }

  SettingExtra copyWith({String? id, String? route}) => SettingExtra(
        id: id ?? this.id,
        route: route ?? this.route,
      );
  @override
  String toString() {
    return (StringBuffer('SettingExtra(')
          ..write('id: $id, ')
          ..write('route: $route')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, route);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SettingExtra &&
          other.id == this.id &&
          other.route == this.route);
}

class SettingExtrasCompanion extends UpdateCompanion<SettingExtra> {
  final Value<String> id;
  final Value<String> route;
  final Value<int> rowid;
  const SettingExtrasCompanion({
    this.id = const Value.absent(),
    this.route = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SettingExtrasCompanion.insert({
    required String id,
    required String route,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        route = Value(route);
  static Insertable<SettingExtra> custom({
    Expression<String>? id,
    Expression<String>? route,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (route != null) 'route': route,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SettingExtrasCompanion copyWith(
      {Value<String>? id, Value<String>? route, Value<int>? rowid}) {
    return SettingExtrasCompanion(
      id: id ?? this.id,
      route: route ?? this.route,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (route.present) {
      map['route'] = Variable<String>(route.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingExtrasCompanion(')
          ..write('id: $id, ')
          ..write('route: $route, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CommandExtrasTable extends CommandExtras
    with TableInfo<$CommandExtrasTable, CommandExtra> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CommandExtrasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES experience_entries (id)'));
  static const VerificationMeta _routeMeta = const VerificationMeta('route');
  @override
  late final GeneratedColumn<String> route = GeneratedColumn<String>(
      'route', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, route];
  @override
  String get aliasedName => _alias ?? 'command_extras';
  @override
  String get actualTableName => 'command_extras';
  @override
  VerificationContext validateIntegrity(Insertable<CommandExtra> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('route')) {
      context.handle(
          _routeMeta, route.isAcceptableOrUnknown(data['route']!, _routeMeta));
    } else if (isInserting) {
      context.missing(_routeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CommandExtra map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CommandExtra(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      route: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}route'])!,
    );
  }

  @override
  $CommandExtrasTable createAlias(String alias) {
    return $CommandExtrasTable(attachedDatabase, alias);
  }
}

class CommandExtra extends DataClass implements Insertable<CommandExtra> {
  final String id;
  final String route;
  const CommandExtra({required this.id, required this.route});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['route'] = Variable<String>(route);
    return map;
  }

  CommandExtrasCompanion toCompanion(bool nullToAbsent) {
    return CommandExtrasCompanion(
      id: Value(id),
      route: Value(route),
    );
  }

  factory CommandExtra.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CommandExtra(
      id: serializer.fromJson<String>(json['id']),
      route: serializer.fromJson<String>(json['route']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'route': serializer.toJson<String>(route),
    };
  }

  CommandExtra copyWith({String? id, String? route}) => CommandExtra(
        id: id ?? this.id,
        route: route ?? this.route,
      );
  @override
  String toString() {
    return (StringBuffer('CommandExtra(')
          ..write('id: $id, ')
          ..write('route: $route')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, route);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CommandExtra &&
          other.id == this.id &&
          other.route == this.route);
}

class CommandExtrasCompanion extends UpdateCompanion<CommandExtra> {
  final Value<String> id;
  final Value<String> route;
  final Value<int> rowid;
  const CommandExtrasCompanion({
    this.id = const Value.absent(),
    this.route = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CommandExtrasCompanion.insert({
    required String id,
    required String route,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        route = Value(route);
  static Insertable<CommandExtra> custom({
    Expression<String>? id,
    Expression<String>? route,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (route != null) 'route': route,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CommandExtrasCompanion copyWith(
      {Value<String>? id, Value<String>? route, Value<int>? rowid}) {
    return CommandExtrasCompanion(
      id: id ?? this.id,
      route: route ?? this.route,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (route.present) {
      map['route'] = Variable<String>(route.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CommandExtrasCompanion(')
          ..write('id: $id, ')
          ..write('route: $route, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SourcesTable extends Sources with TableInfo<$SourcesTable, Source> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SourcesTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _linkMeta = const VerificationMeta('link');
  @override
  late final GeneratedColumn<String> link = GeneratedColumn<String>(
      'link', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _resonanceMeta =
      const VerificationMeta('resonance');
  @override
  late final GeneratedColumn<int> resonance = GeneratedColumn<int>(
      'resonance', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [primaryId, link, resonance];
  @override
  String get aliasedName => _alias ?? 'sources';
  @override
  String get actualTableName => 'sources';
  @override
  VerificationContext validateIntegrity(Insertable<Source> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('primary_id')) {
      context.handle(_primaryIdMeta,
          primaryId.isAcceptableOrUnknown(data['primary_id']!, _primaryIdMeta));
    }
    if (data.containsKey('link')) {
      context.handle(
          _linkMeta, link.isAcceptableOrUnknown(data['link']!, _linkMeta));
    } else if (isInserting) {
      context.missing(_linkMeta);
    }
    if (data.containsKey('resonance')) {
      context.handle(_resonanceMeta,
          resonance.isAcceptableOrUnknown(data['resonance']!, _resonanceMeta));
    } else if (isInserting) {
      context.missing(_resonanceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {primaryId};
  @override
  Source map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Source(
      primaryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}primary_id'])!,
      link: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}link'])!,
      resonance: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}resonance'])!,
    );
  }

  @override
  $SourcesTable createAlias(String alias) {
    return $SourcesTable(attachedDatabase, alias);
  }
}

class Source extends DataClass implements Insertable<Source> {
  final int primaryId;
  final String link;
  final int resonance;
  const Source(
      {required this.primaryId, required this.link, required this.resonance});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['primary_id'] = Variable<int>(primaryId);
    map['link'] = Variable<String>(link);
    map['resonance'] = Variable<int>(resonance);
    return map;
  }

  SourcesCompanion toCompanion(bool nullToAbsent) {
    return SourcesCompanion(
      primaryId: Value(primaryId),
      link: Value(link),
      resonance: Value(resonance),
    );
  }

  factory Source.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Source(
      primaryId: serializer.fromJson<int>(json['primaryId']),
      link: serializer.fromJson<String>(json['link']),
      resonance: serializer.fromJson<int>(json['resonance']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'primaryId': serializer.toJson<int>(primaryId),
      'link': serializer.toJson<String>(link),
      'resonance': serializer.toJson<int>(resonance),
    };
  }

  Source copyWith({int? primaryId, String? link, int? resonance}) => Source(
        primaryId: primaryId ?? this.primaryId,
        link: link ?? this.link,
        resonance: resonance ?? this.resonance,
      );
  @override
  String toString() {
    return (StringBuffer('Source(')
          ..write('primaryId: $primaryId, ')
          ..write('link: $link, ')
          ..write('resonance: $resonance')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(primaryId, link, resonance);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Source &&
          other.primaryId == this.primaryId &&
          other.link == this.link &&
          other.resonance == this.resonance);
}

class SourcesCompanion extends UpdateCompanion<Source> {
  final Value<int> primaryId;
  final Value<String> link;
  final Value<int> resonance;
  const SourcesCompanion({
    this.primaryId = const Value.absent(),
    this.link = const Value.absent(),
    this.resonance = const Value.absent(),
  });
  SourcesCompanion.insert({
    this.primaryId = const Value.absent(),
    required String link,
    required int resonance,
  })  : link = Value(link),
        resonance = Value(resonance);
  static Insertable<Source> custom({
    Expression<int>? primaryId,
    Expression<String>? link,
    Expression<int>? resonance,
  }) {
    return RawValuesInsertable({
      if (primaryId != null) 'primary_id': primaryId,
      if (link != null) 'link': link,
      if (resonance != null) 'resonance': resonance,
    });
  }

  SourcesCompanion copyWith(
      {Value<int>? primaryId, Value<String>? link, Value<int>? resonance}) {
    return SourcesCompanion(
      primaryId: primaryId ?? this.primaryId,
      link: link ?? this.link,
      resonance: resonance ?? this.resonance,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (primaryId.present) {
      map['primary_id'] = Variable<int>(primaryId.value);
    }
    if (link.present) {
      map['link'] = Variable<String>(link.value);
    }
    if (resonance.present) {
      map['resonance'] = Variable<int>(resonance.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SourcesCompanion(')
          ..write('primaryId: $primaryId, ')
          ..write('link: $link, ')
          ..write('resonance: $resonance')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $MeaningTypesTable meaningTypes = $MeaningTypesTable(this);
  late final $ExperienceEntriesTable experienceEntries =
      $ExperienceEntriesTable(this);
  late final $OrdersTable orders = $OrdersTable(this);
  late final $ReadExtrasTable readExtras = $ReadExtrasTable(this);
  late final $WriteExtrasTable writeExtras = $WriteExtrasTable(this);
  late final $NoteExtrasTable noteExtras = $NoteExtrasTable(this);
  late final $ExtractExtrasTable extractExtras = $ExtractExtrasTable(this);
  late final $SettingExtrasTable settingExtras = $SettingExtrasTable(this);
  late final $CommandExtrasTable commandExtras = $CommandExtrasTable(this);
  late final $SourcesTable sources = $SourcesTable(this);
  Future<int> _insertOrderToTop() {
    return customUpdate(
      'UPDATE orders SET order_index = order_index + 1',
      variables: [],
      updates: {orders},
      updateKind: UpdateKind.update,
    );
  }

  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        meaningTypes,
        experienceEntries,
        orders,
        readExtras,
        writeExtras,
        noteExtras,
        extractExtras,
        settingExtras,
        commandExtras,
        sources
      ];
}
