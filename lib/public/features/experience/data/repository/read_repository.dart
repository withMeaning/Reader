import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:read_with_meaning/public/features/experience/data/database/database.dart';
import 'package:read_with_meaning/shared/domain/all_types_definition.dart';
import 'package:read_with_meaning/shared/domain/types/read.dart';
import 'package:uuid/uuid.dart';

class ReadReposiory {
  Stream<List<Read>> watchReads(AppDatabase db) async* {
    var justReads = (db.select(db.experienceEntries)
      ..where((tbl) => tbl.type.equals(AllTypes.read.name)));
    Stream<List<TypedResult>> query = justReads.join([
      innerJoin(
          db.readExtras, db.readExtras.id.equalsExp(db.experienceEntries.id))
    ]).watch();

    yield* query.map((entries) {
      return entries.map((entry) {
        ExperienceEntry expResult = entry.readTable(db.experienceEntries);
        ReadExtra readResult = entry.readTable(db.readExtras);
        return Read.fromReadEntry(expResult, readResult);
      }).toList();
    });
  }

  Stream<List<ReadsWithOrder>> watchReadsWithOrder(AppDatabase db) async* {
    var justReads = (db.select(db.experienceEntries)
      ..where((tbl) => tbl.type.equals(AllTypes.read.name)));
    Stream<List<TypedResult>> query = justReads.join([
      innerJoin(
          db.readExtras, db.readExtras.id.equalsExp(db.experienceEntries.id)),
      leftOuterJoin(db.orders, db.orders.id.equalsExp(db.experienceEntries.id))
    ]).watch();

    yield* query.map((entries) {
      return entries.map((entry) {
        ExperienceEntry expResult = entry.readTable(db.experienceEntries);
        ReadExtra readResult = entry.readTable(db.readExtras);
        bool ordered = entry.readTableOrNull(db.orders) != null;
        return ReadsWithOrder(
            read: Read.fromReadEntry(expResult, readResult), ordered: ordered);
      }).toList();
    });
  }

  Future<Read> fetchRead(AppDatabase db, String id) async {
    var firstQuery =
        (db.select(db.experienceEntries)..where((tbl) => tbl.id.equals(id)));
    Future<List<TypedResult>> query = firstQuery.join([
      innerJoin(
          db.readExtras, db.readExtras.id.equalsExp(db.experienceEntries.id))
    ]).get();

    ExperienceEntry expResult =
        (await query).first.readTable(db.experienceEntries);
    ReadExtra readResult = (await query).first.readTable(db.readExtras);

    return Read.fromReadEntry(expResult, readResult);
  }

  Stream<Read> watchSingleRead(AppDatabase db, String id) async* {
    var firstQuery =
        (db.select(db.experienceEntries)..where((tbl) => tbl.id.equals(id)));
    Stream<List<TypedResult>> query = firstQuery.join([
      innerJoin(
          db.readExtras, db.readExtras.id.equalsExp(db.experienceEntries.id))
    ]).watch();

    /*  ExperienceEntry expResult = query.first.readTable(db.experienceEntries);
    ReadExtra readResult = (await query).first.readTable(db.readExtras); */

    yield* query.map((entries) {
      return entries.map((entry) {
        ExperienceEntry expResult = entry.readTable(db.experienceEntries);
        ReadExtra readResult = entry.readTable(db.readExtras);
        return Read.fromReadEntry(expResult, readResult);
      }).first;
    });
  }

  void addRead(AppDatabase db, Read read) async {
    String generatedId = const Uuid().v4();
    await db.into(db.experienceEntries).insert(
        ExperienceEntriesCompanion.insert(
          id: read.base.id != "" ? read.base.id : generatedId,
          content: read.base.content,
          author: read.base.author,
          createdAt: read.base.createdAt,
          type: AllTypes.read.name,
        ),
        mode: InsertMode.insertOrIgnore);
    await db.into(db.readExtras).insert(
        ReadExtrasCompanion.insert(
          mainContent: read.mainContent,
          link: read.link,
          id: read.base.id != "" ? read.base.id : generatedId,
          source: read.source,
        ),
        mode: InsertMode.insertOrIgnore);
  }

  void updateRead(AppDatabase db, String id, Read read) async {
    await (db.update(db.experienceEntries)..where((tbl) => tbl.id.equals(id)))
        .write(ExperienceEntriesCompanion.insert(
      id: read.base.id != ""
          ? read.base.id
          : id, // ! this will not work, because I'm updating the primary key
      content: read.base.content,
      author: read.base.author,
      createdAt: read.base.createdAt,
      type: AllTypes.read.name,
    ));
    await (db.update(db.readExtras)..where((tbl) => tbl.id.equals(id)))
        .write(ReadExtrasCompanion.insert(
      mainContent: read.mainContent,
      link: read.link,
      id: read.base.id != "" ? read.base.id : id,
      source: read.source,
    ));
  }

  void deleteRead(AppDatabase db, String id) {
    (db.delete(db.experienceEntries)..where((tbl) => tbl.id.equals(id))).go();
    (db.delete(db.readExtras)..where((tbl) => tbl.id.equals(id))).go();
  }
}

final readsRepositoryProvider = Provider.autoDispose<ReadReposiory>((ref) {
  return ReadReposiory();
});

final readsListRepositoryStreamProvider =
    StreamProvider.autoDispose<List<Read>>((ref) {
  final database = ref.watch(AppDatabase.provider);
  final ReadReposiory repository = ref.watch(readsRepositoryProvider);
  return repository.watchReads(database);
/*   final link = ref.keepAlive();
  Timer(const Duration(seconds: 10), () {
    link.close();
  }); */
});

class ReadsWithOrder {
  final Read read;
  final bool ordered;

  ReadsWithOrder({required this.read, required this.ordered});
}

final readsWithOrderListRepositoryStreamProvider =
    StreamProvider.autoDispose<List<ReadsWithOrder>>((ref) {
  final database = ref.watch(AppDatabase.provider);
  final ReadReposiory repository = ref.watch(readsRepositoryProvider);
  return repository.watchReadsWithOrder(database);
});

final readFutureProvider =
    FutureProvider.autoDispose.family<Read, String>((ref, id) {
  final database = ref.watch(AppDatabase.provider);
  final ReadReposiory repository = ref.watch(readsRepositoryProvider);
  return repository.fetchRead(database, id);
});

final readStreamProvider =
    StreamProvider.autoDispose.family<Read, String>((ref, id) {
  final database = ref.watch(AppDatabase.provider);
  final ReadReposiory repository = ref.watch(readsRepositoryProvider);
  return repository.watchSingleRead(database, id);
});

final addReadProvider = Provider.autoDispose.family<void, Read>((ref, read) {
  final database = ref.watch(AppDatabase.provider);
  final ReadReposiory repository = ref.watch(readsRepositoryProvider);
  return repository.addRead(database, read);
});

class ReadAndId {
  final Read read;
  final String id;
  ReadAndId(this.read, this.id);
}

final updateReadProvider =
    Provider.autoDispose.family<void, ReadAndId>((ref, readandid) {
  final database = ref.watch(AppDatabase.provider);
  final ReadReposiory repository = ref.watch(readsRepositoryProvider);
  return repository.updateRead(database, readandid.id, readandid.read);
});

final deleteReadProvider = Provider.autoDispose.family<void, String>((ref, id) {
  final database = ref.watch(AppDatabase.provider);
  final ReadReposiory repository = ref.watch(readsRepositoryProvider);
  return repository.deleteRead(database, id);
});
