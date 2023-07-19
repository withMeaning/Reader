import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:read_with_meaning/src/features/experience/data/database/database.dart';
import 'package:read_with_meaning/src/routing/routes.dart';

void goNext(BuildContext context, WidgetRef ref, String id) {
  // TODO replace with db solution
  // ! this is a hack, and doesn't actually use the order
  final db = ref.read(AppDatabase.provider);
  (db.select(db.readEntries)..where((tbl) => tbl.id.equals(id)))
      .getSingle()
      .then((value) => db
          .customSelect(
              "SELECT * FROM read_entries WHERE primary_id > '${value.primaryId}' ORDER BY primary_id ASC LIMIT 1")
          .getSingle())
      .then((value) => context.pushNamed(AppRoute.exp.name,
          pathParameters: {"id": value.data["id"]}));
}

void goPrevious(BuildContext context, WidgetRef ref, String id) {
  final db = ref.read(AppDatabase.provider);
  (db.select(db.readEntries)..where((tbl) => tbl.id.equals(id)))
      .getSingle()
      .then((value) => db
          .customSelect(
              "SELECT * FROM read_entries WHERE primary_id < '${value.primaryId}' ORDER BY primary_id DESC LIMIT 1")
          .getSingle())
      .then((value) => context.pushNamed(AppRoute.exp.name,
          pathParameters: {"id": value.data["id"]}));
}
