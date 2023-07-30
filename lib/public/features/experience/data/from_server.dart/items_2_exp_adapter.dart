// TODO refactor using an abstract class + factory
//, in case we manage to use
// read extends experience with freezed, instead of the
// current reads.base

import 'package:read_with_meaning/public/features/experience/data/from_server.dart/get_items_response.dart';
import 'package:read_with_meaning/shared/domain/all_types_definition.dart';
import 'package:read_with_meaning/shared/domain/experience.dart';
import 'package:read_with_meaning/shared/domain/types/read.dart';

class Items2ExpAdapter {
  dynamic toAny(GetItem item) {
    Experience exp = Experience(
      id: item.uid,
      author: item.author ?? "",
      createdAt: DateTime.parse(item.createdAt ?? ""),
      content: item.title ?? "",
      type: AllTypes.fromString(item.type),
    );
    switch (item.type) {
      case "read":
        return Read(
          base: exp,
          mainContent: item.content ?? "",
          source: "from RSS",
          link: item.link ?? "",
          summary: item.summary ?? "",
        );
      default:
        return exp;
    }
  }
}
