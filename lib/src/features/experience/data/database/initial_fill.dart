import 'package:read_with_meaning/src/features/experience/data/database/database.dart';

initDB(b, meaningTypes, readEntries) {
  b.insert(
    meaningTypes,
    MeaningTypesCompanion.insert(name: 'experience'),
  );
  b.insert(
    meaningTypes,
    MeaningTypesCompanion.insert(name: 'read'),
  );
  b.insert(
      readEntries,
      ReadEntriesCompanion.insert(
        title: "Welcome",
        author: "The Meaning Team",
        id: "1",
        createdAt: DateTime.now(),
        mainContent: "Hi! Welcome to Read With Meaning.",
        source: "tutorial",
        link: "docs.withmeaning.io/get_started",
      ));
}
