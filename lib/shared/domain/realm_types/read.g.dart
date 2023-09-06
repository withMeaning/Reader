// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'read.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Read extends $Read with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  Read(
    ObjectId id,
    String ownerId,
    String mainContent,
    String link, {
    Experience? experience,
    String author = "me",
    String source = "manual",
    String? summary,
    String? mp3,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<Read>({
        'author': "me",
        'source': "manual",
      });
    }
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'owner_id', ownerId);
    RealmObjectBase.set(this, 'experience', experience);
    RealmObjectBase.set(this, 'mainContent', mainContent);
    RealmObjectBase.set(this, 'author', author);
    RealmObjectBase.set(this, 'source', source);
    RealmObjectBase.set(this, 'link', link);
    RealmObjectBase.set(this, 'summary', summary);
    RealmObjectBase.set(this, 'mp3', mp3);
  }

  Read._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get ownerId => RealmObjectBase.get<String>(this, 'owner_id') as String;
  @override
  set ownerId(String value) => RealmObjectBase.set(this, 'owner_id', value);

  @override
  Experience? get experience =>
      RealmObjectBase.get<Experience>(this, 'experience') as Experience?;
  @override
  set experience(covariant Experience? value) =>
      RealmObjectBase.set(this, 'experience', value);

  @override
  String get mainContent =>
      RealmObjectBase.get<String>(this, 'mainContent') as String;
  @override
  set mainContent(String value) =>
      RealmObjectBase.set(this, 'mainContent', value);

  @override
  String get author => RealmObjectBase.get<String>(this, 'author') as String;
  @override
  set author(String value) => RealmObjectBase.set(this, 'author', value);

  @override
  String get source => RealmObjectBase.get<String>(this, 'source') as String;
  @override
  set source(String value) => RealmObjectBase.set(this, 'source', value);

  @override
  String get link => RealmObjectBase.get<String>(this, 'link') as String;
  @override
  set link(String value) => RealmObjectBase.set(this, 'link', value);

  @override
  String? get summary =>
      RealmObjectBase.get<String>(this, 'summary') as String?;
  @override
  set summary(String? value) => RealmObjectBase.set(this, 'summary', value);

  @override
  String? get mp3 => RealmObjectBase.get<String>(this, 'mp3') as String?;
  @override
  set mp3(String? value) => RealmObjectBase.set(this, 'mp3', value);

  @override
  Stream<RealmObjectChanges<Read>> get changes =>
      RealmObjectBase.getChanges<Read>(this);

  @override
  Read freeze() => RealmObjectBase.freezeObject<Read>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Read._);
    return const SchemaObject(ObjectType.realmObject, Read, 'Read', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('ownerId', RealmPropertyType.string, mapTo: 'owner_id'),
      SchemaProperty('experience', RealmPropertyType.object,
          optional: true, linkTarget: 'Experience'),
      SchemaProperty('mainContent', RealmPropertyType.string),
      SchemaProperty('author', RealmPropertyType.string),
      SchemaProperty('source', RealmPropertyType.string),
      SchemaProperty('link', RealmPropertyType.string),
      SchemaProperty('summary', RealmPropertyType.string, optional: true),
      SchemaProperty('mp3', RealmPropertyType.string, optional: true),
    ]);
  }
}
