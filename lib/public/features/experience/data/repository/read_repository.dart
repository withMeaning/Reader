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

  void addRead(AppDatabase db, Read read) async {
    String generatedId = const Uuid().v4();
    await db.into(db.experienceEntries).insert(
        ExperienceEntriesCompanion.insert(
          id: generatedId,
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
          id: generatedId,
          source: read.source,
        ),
        mode: InsertMode.insertOrIgnore);
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

final readFutureProvider =
    FutureProvider.autoDispose.family<Read, String>((ref, id) {
  final database = ref.watch(AppDatabase.provider);
  final ReadReposiory repository = ref.watch(readsRepositoryProvider);
  return repository.fetchRead(database, id);
});

final addReadProvider = Provider.autoDispose.family<void, Read>((ref, read) {
  final database = ref.watch(AppDatabase.provider);
  final ReadReposiory repository = ref.watch(readsRepositoryProvider);
  return repository.addRead(database, read);
});
