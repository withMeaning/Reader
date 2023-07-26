import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:read_with_meaning/public/features/experience/data/database/database.dart';
import 'package:read_with_meaning/public/routing/routes.dart';

void goNext(BuildContext context, WidgetRef ref, String id) {
  // * could also go into route /next. Previous is just a pop.
  // TODO replace with db order solution
  // ! this is a hack, and doesn't actually use the order
  final db = ref.read(AppDatabase.provider);
  (db.select(db.readEntries)..where((tbl) => tbl.id.equals(id)))
      .getSingle()
      .then((value) => db
          .customSelect(
              "SELECT * FROM read_entries WHERE id > '${value.id}' ORDER BY id ASC LIMIT 1")
          .getSingle())
      .then((value) => context.pushNamed(AppRoute.exp.name,
          pathParameters: {"id": value.data["id"]}));
}

void goPrevious(BuildContext context, WidgetRef ref, String id) {
  context.pop();
  /*final db = ref.read(AppDatabase.provider);
  (db.select(db.readEntries)..where((tbl) => tbl.id.equals(id)))
      .getSingle()
      .then((value) => db
          .customSelect(
              "SELECT * FROM read_entries WHERE id < '${value.id}' ORDER BY id DESC LIMIT 1")
          .getSingle())
      .then((value) => context.goNamed(AppRoute.exp.name,
          pathParameters: {"id": value.data["id"]}));*/
}
