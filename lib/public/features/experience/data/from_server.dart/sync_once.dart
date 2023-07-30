import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:read_with_meaning/public/features/experience/data/from_server.dart/fetch_get_items.dart';
import 'package:read_with_meaning/public/features/experience/data/from_server.dart/get_items_response.dart';
import 'package:read_with_meaning/public/features/experience/data/from_server.dart/items_2_exp_adapter.dart';
import 'package:read_with_meaning/public/features/experience/data/repository/read_repository.dart';
import 'package:read_with_meaning/shared/domain/types/read.dart';

void fetchReadsFromAPI(WidgetRef ref) async {
  var logger = Logger();
  //final List<Read> parsedReadList = [];
  //final List<GetItem> getItemList = [];
  //await Future.delayed(const Duration(seconds: 1));
  try {
    logger.d("fetching reads");
    var response = await getItems();
    logger.d("response: ${response.body}");
    GetItemsResponse resObject = GetItemsResponse.fromJson(response.body);
    // TODO should be GetItem and refactored
    for (dynamic eDynamic in resObject.items) {
      logger.d("eDynamic: $eDynamic");
      GetItem element = GetItem.fromMap(eDynamic);
      logger.d("element: ${element.title}");
      var parsedExp = Items2ExpAdapter().toAny(element);
      if (parsedExp is Read) {
        ref.read(addReadProvider(parsedExp));
      }
    }
    return;
  } catch (e) {
    logger.e("Error fetching reads: $e");
    return;
  }
}
