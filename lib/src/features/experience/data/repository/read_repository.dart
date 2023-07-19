import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:read_with_meaning/src/features/experience/data/database/database.dart';
import 'package:read_with_meaning/src/features/experience/data/types/read.dart';

class ReadReposiory {
  // ! this seems not to work correctly.
  Stream<List<Read>> watchReads(AppDatabase db) async* {
    yield* db.select(db.readEntries).watch().map((List<ReadEntry> entries) {
      return entries
          .map((ReadEntry entry) => Read.fromReadEntry(entry))
          .toList();
    });
  }

  Future<Read> fetchRead(String id, AppDatabase db) async {
    ReadEntry readEntry = await (db.select(db.readEntries)
          ..where((tbl) => tbl.id.equals(id)))
        .getSingle();
    Read read = Read.fromReadEntry(readEntry);
    return read;
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
  return repository.fetchRead(id, database);
});
