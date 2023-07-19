import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:read_with_meaning/src/features/experience/data/database/database.dart';

class DBViewScreen extends ConsumerWidget {
  const DBViewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final database = ref.read(AppDatabase.provider);
    return DriftDbViewer(database);
  }
}
