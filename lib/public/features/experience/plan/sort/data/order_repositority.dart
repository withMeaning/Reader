import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:read_with_meaning/public/features/experience/data/database/database.dart';
import 'package:read_with_meaning/public/features/experience/plan/sort/domain/sort.dart';
import 'package:read_with_meaning/shared/domain/all_types_definition.dart';
import 'package:read_with_meaning/shared/domain/types/read.dart';

class OrderRepository {
  void addToTop(AppDatabase db, String id) {
    try {
      db.insertOrderToTop(id);
    } catch (e) {
      Logger().e("Error updating order: $e");
    }
  }

  void addToBottom(AppDatabase db, String id) async {
    try {
      var maxInt =
          await db.getMaxOrderInt().getSingle(); // TODO doesn't seem to work!
      /* int maxInt = await db
          .customSelect('SELECT max(order_index) FROM orders')
          .map((row) => row.read<int>('order_index'))
          .getSingle();*/
      db.into(db.orders).insert(Order(id: id, orderIndex: (maxInt ?? 0) + 1));
    } catch (e) {
      Logger().e("Error fetching max order: $e");
    }
  }

  addToIndex(AppDatabase db, Sort sort) async {
    List<Order> ordered = await (db.select(db.orders)
          ..orderBy([(o) => OrderingTerm.asc(o.orderIndex)]))
        .get();
    String id = ordered[sort.oldIndex!].id;

    await db.customStatement(
        'UPDATE orders SET order = order + 1 WHERE order >= ${sort.newIndex}');
    db.into(db.orders).insert(Order(id: id, orderIndex: sort.newIndex));
  }

  void removeExp(AppDatabase db, String id) async {
    (db.delete(db.orders)..where((tbl) => tbl.id.equals(id))).go();
  }
/*   void sort(AppDatabase db, Sort sort) async {
    await db.customStatement(
        'UPDATE orders SET order_index = order_index + 1 WHERE order_index >= ${sort.newIndex} AND order_index < ${sort.oldIndex}');
    (db.update(db.orders)
          ..where((tbl) => tbl.orderIndex.equals(sort.oldIndex!)))
        .write(OrdersCompanion(orderIndex: Value(sort.newIndex)));
  } */

  Future<String> firstExperience(AppDatabase db) async {
    try {
      var first = await (db.select(db.orders)
            ..orderBy([(o) => OrderingTerm.asc(o.orderIndex)])
            ..limit(1))
          .getSingleOrNull();
      return first?.id ?? "";
    } catch (e) {
      Logger().e("Error fetching first experience: $e");
      return "";
    }
  }

  void sortAll(AppDatabase db, List<String> sortedIdList) async {
    try {
      await db.transaction(() async {
        for (int i = 0; i < sortedIdList.length; i++) {
          String id = sortedIdList[i];
          await (db.update(db.orders)..where((tbl) => tbl.id.equals(id)))
              .write(OrdersCompanion(orderIndex: Value(i)));
        }
      });
    } catch (e) {
      Logger().e("Error sorting all: $e");
    }
  }

  Stream<List<Read>> watchSortedReads(AppDatabase db) async* {
    var justReads = (db.select(db.experienceEntries)
      ..where((tbl) => tbl.type.equals(AllTypes.read.name)));

    var query = justReads.join([
      innerJoin(
          db.readExtras, db.readExtras.id.equalsExp(db.experienceEntries.id)),
      innerJoin(db.orders, db.orders.id.equalsExp(db.experienceEntries.id))
    ])
      ..orderBy([OrderingTerm.asc(db.orders.orderIndex)]);

    yield* query.watch().map((entries) {
      return entries.map((entry) {
        ExperienceEntry expResult = entry.readTable(db.experienceEntries);
        ReadExtra readResult = entry.readTable(db.readExtras);
        return Read.fromReadEntry(expResult, readResult);
      }).toList();
    });
  }
}

final orderRepositoryProvider = Provider.autoDispose<OrderRepository>((ref) {
  return OrderRepository();
});

final addToTopProvider = Provider.autoDispose.family<void, String>((ref, id) {
  AppDatabase db = ref.read(AppDatabase.provider);
  OrderRepository repo = ref.read(orderRepositoryProvider);

  (db.select(db.orders)..where((tbl) => tbl.id.equals(id)))
      .getSingleOrNull()
      .then((value) {
    if (value == null) {
      return repo.addToTop(db, id);
    } else {
      return repo.removeExp(db, id);
    }
  });
});

final addToBottomProvider =
    Provider.autoDispose.family<void, String>((ref, id) {
  AppDatabase db = ref.read(AppDatabase.provider);
  return ref.read(orderRepositoryProvider).addToBottom(db, id);
});

final removeExpFromOrdersProvider =
    Provider.autoDispose.family<void, String>((ref, id) {
  AppDatabase db = ref.read(AppDatabase.provider);
  return ref.read(orderRepositoryProvider).removeExp(db, id);
});

final sortOrderProvider = Provider.autoDispose.family<void, Sort>((ref, sort) {
  AppDatabase db = ref.read(AppDatabase.provider);
  final reads = ref.read(sortedReadsListRepositoryStreamProvider);
  List<String> readIds = reads.value!.map((e) => e.base.id).toList();
  String idOfSortedRead = readIds.removeAt(sort.oldIndex!);
  readIds.insert(sort.newIndex, idOfSortedRead);
  return ref.read(orderRepositoryProvider).sortAll(db, readIds);
});

final sortedReadsListRepositoryStreamProvider =
    StreamProvider.autoDispose<List<Read>>((ref) {
  final database = ref.watch(AppDatabase.provider);
  final OrderRepository repository = ref.watch(orderRepositoryProvider);

  return repository.watchSortedReads(database);
/*   final link = ref.keepAlive();
  Timer(const Duration(seconds: 10), () {
    link.close();
  }); */
});

final firstExperienceProvider = FutureProvider.autoDispose<String>((ref) {
  AppDatabase db = ref.read(AppDatabase.provider);
  OrderRepository repo = ref.read(orderRepositoryProvider);
  return repo.firstExperience(db);
});
