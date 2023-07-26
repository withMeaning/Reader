import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:read_with_meaning/public/features/experience/data/database/database.dart';
import 'package:read_with_meaning/public/features/experience/data/from_server.dart/fetch_get_items.dart';
import 'package:read_with_meaning/public/features/experience/data/from_server.dart/get_items_response.dart';

void fetchReadsFromAPI(WidgetRef ref) async {
  var logger = Logger();
  logger.d("Logger is working!");
  //final List<Read> parsedReadList = [];
  //final List<GetItem> getItemList = [];
  //await Future.delayed(const Duration(seconds: 1));
  final db = ref.read(AppDatabase.provider);
  try {
    logger.d("fetching reads");
    var response =
        await getItems(); /* .then((value) => {
            resObject = GetItemsResponse.fromJson(value.body),
            resObject?.items.forEach((element) {
              parsedReadList.add(jsonDecode(element));
            })
          }); */
    logger.d("response: ${response.body}");
    GetItemsResponse resObject = GetItemsResponse.fromJson(response.body);
    // TODO should be GetItem and refactored
    for (dynamic eDynamic in resObject.items) {
      logger.d("eDynamic: $eDynamic");
      GetItem element = GetItem.fromMap(eDynamic);
      logger.d("element: ${element.title}");
      if (element.type == "read") {
        db.into(db.readEntries).insert(
            ReadEntriesCompanion.insert(
              id: element.uid,
              title: element.title ?? "",
              author: element.author ?? "",
              createdAt: DateTime.parse(element.createdAt ?? ""),
              link: element.link ?? "",
              mainContent: element.content ?? "",
              source: 'from RSS',
            ),
            mode: InsertMode.insertOrIgnore);
      }
    }
    return;
  } catch (e) {
    logger.e("Error fetching reads: $e");
    return;
  }
}
