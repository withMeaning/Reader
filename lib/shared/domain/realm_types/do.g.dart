// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'do.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class DoIt extends $DoIt with RealmEntity, RealmObjectBase, RealmObject {
  DoIt(
    ObjectId id,
    String ownerId,
    String description,
    String state, {
    Experience? experience,
  }) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'owner_id', ownerId);
    RealmObjectBase.set(this, 'experience', experience);
    RealmObjectBase.set(this, 'description', description);
    RealmObjectBase.set(this, 'state', state);
  }

  DoIt._();

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
  String get description =>
      RealmObjectBase.get<String>(this, 'description') as String;
  @override
  set description(String value) =>
      RealmObjectBase.set(this, 'description', value);

  @override
  String get state => RealmObjectBase.get<String>(this, 'state') as String;
  @override
  set state(String value) => RealmObjectBase.set(this, 'state', value);

  @override
  Stream<RealmObjectChanges<DoIt>> get changes =>
      RealmObjectBase.getChanges<DoIt>(this);

  @override
  DoIt freeze() => RealmObjectBase.freezeObject<DoIt>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(DoIt._);
    return const SchemaObject(ObjectType.realmObject, DoIt, 'DoIt', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('ownerId', RealmPropertyType.string, mapTo: 'owner_id'),
      SchemaProperty('experience', RealmPropertyType.object,
          optional: true, linkTarget: 'Experience'),
      SchemaProperty('description', RealmPropertyType.string),
      SchemaProperty('state', RealmPropertyType.string),
    ]);
  }
}
