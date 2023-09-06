import 'package:read_with_meaning/shared/domain/realm_types/experience.dart';
import 'package:realm/realm.dart';

part 'do.g.dart';

@RealmModel()
class $DoIt implements ExperienceExtra {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;
  @MapTo('owner_id')
  late String ownerId;

  late $Experience? experience;
  late String description;
  late String state;
}
