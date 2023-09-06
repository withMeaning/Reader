import 'package:read_with_meaning/shared/domain/realm_types/experience.dart';
import 'package:realm/realm.dart';

part 'read.g.dart';

@RealmModel()
class $Read implements ExperienceExtra {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;
  @MapTo('owner_id')
  late String ownerId;

  late $Experience? experience;

  late String mainContent; // the main content of the article, Markdown
  late String author = "me";
  late String source =
      "manual"; // the RSS feed URL, or "Twitter, YouTube, etc."
  late String link; // link to the original content
  late String? summary;
  late String? mp3;
}
