import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:read_with_meaning/public/features/experience/data/from_server.dart/add_item.dart';
import 'package:read_with_meaning/public/features/experience/data/from_server.dart/get_items_response.dart';
import 'package:read_with_meaning/public/features/experience/data/from_server.dart/items_2_exp_adapter.dart';
import 'package:read_with_meaning/public/features/experience/data/repository/read_repository.dart';
import 'package:read_with_meaning/public/features/experience/plan/sort/data/order_repositority.dart';
import 'package:read_with_meaning/shared/domain/all_types_definition.dart';
import 'package:read_with_meaning/shared/domain/experience.dart';
import 'package:read_with_meaning/shared/domain/types/read.dart';
import 'package:uuid/uuid.dart';

class addReadModel {
  final String title;
  final String mainContent;
  final String link;
  const addReadModel(
      {required this.title, required this.mainContent, required this.link});
}

final addReadToDBandServerProvider =
    FutureProvider.family<void, addReadModel>((ref, add) async {
  String placeholderId = const Uuid().v4();
  bool linkOnly = (add.title == "" && add.mainContent == "" && add.link != "");
  Read read = Read(
      base: Experience(
          id: placeholderId,
          content: add.title,
          createdAt: DateTime.now(),
          type: AllTypes.read,
          author: linkOnly ? "loading link ..." : "me"),
      mainContent: add.mainContent,
      source: 'manual',
      link: add.link);

  ref.read(addReadProvider(read));
  ref.read(addToBottomProvider(placeholderId));
  Response res;
  if (linkOnly) {
    res = await addLink(read.link);
  } else {
    res = await addRead(read);
  }
  GetItem item = GetItem.fromJson(utf8.decode(res.bodyBytes));
  Read newRead = Items2ExpAdapter().toAny(item);
  //ref.read(updateReadProvider(ReadAndId(newRead, placeholderId)));

  ref.read(removeExpFromOrdersProvider(placeholderId));
  ref.read(deleteReadProvider(placeholderId));
  ref.read(addReadProvider(newRead));
  ref.read(addToBottomProvider(newRead.base.id));
  Logger().d("posted read: ${utf8.decode(res.bodyBytes)}");
  return await null;
});
