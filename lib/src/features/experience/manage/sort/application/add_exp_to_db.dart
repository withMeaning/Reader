import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:read_with_meaning/src/features/experience/data/database/database.dart';
import 'package:uuid/uuid.dart';

addExpToDB(WidgetRef ref, String title, String mainContent, String link) {
  final database = ref.watch(AppDatabase.provider);
  database.into(database.readEntries).insert(ReadEntriesCompanion.insert(
        title: title,
        mainContent: mainContent,
        link: link,
        author: 'me',
        createdAt: DateTime.now(),
        id: const Uuid().v4(),
        source: 'manual',
      ));
}
