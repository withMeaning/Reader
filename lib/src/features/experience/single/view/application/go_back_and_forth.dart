import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:read_with_meaning/src/features/experience/data/fake/reads_repository.dart';
import 'package:read_with_meaning/src/routing/routes.dart';

void goNext(BuildContext context, WidgetRef ref, String id) {
  final nextRead = ref.read(readsRepositoryProvider).getNextRead(id).id;
  context.pushNamed(AppRoute.exp.name, pathParameters: {"id": nextRead});
}

void goPrevious(BuildContext context, WidgetRef ref, String id) {
  final nextRead = ref.read(readsRepositoryProvider).getPreviousRead(id).id;
  context.pushNamed(AppRoute.exp.name, pathParameters: {"id": nextRead});
}
