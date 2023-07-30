import 'package:read_with_meaning/public/features/experience/data/database/database.dart';

initDB(b, meaningTypes) {
  b.insert(
    meaningTypes,
    MeaningTypesCompanion.insert(name: 'experience'),
  ); /* 
  b.insert(
    meaningTypes,
    MeaningTypesCompanion.insert(name: 'read'),
  ); */
  // TODO: see type setting and command for more intial data
}
/* 
initDB2(db) async {
  try {
    Logger().d("inserting initial data");
    b.insert(
      experienceEntries,
      ExperienceEntriesCompanion.insert(
          id: '1',
          author: "The Team",
          createdAt: DateTime.now(),
          content: "Welcome to Read With Meaning",
          type: "read"),
    );
    b.insert(
        readEntries,
        ReadExtrasCompanion.insert(
          id: const Value<String>("1"),
          mainContent: "Hi! Welcome to Read With Meaning.",
          source: "tutorial",
          link: "docs.withmeaning.io/get_started",
        ));
  } catch (e) {
    Logger().e("Error inserting initial data: $e");
  }
  // TODO: see type setting and command for more intial data
}
 */