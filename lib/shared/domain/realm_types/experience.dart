import 'package:realm/realm.dart';

part 'experience.g.dart';

abstract class ExperienceExtra {}

class PureExperience implements ExperienceExtra {}

@RealmModel()
class $Experience {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;
  @MapTo('owner_id')
  late String ownerId;

  late DateTime createdAt;
  late String content;
  late String type;
}
