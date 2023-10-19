

// ! Drift

/* Future<String> fetchReadsFromAPI(WidgetRef ref) async {
  var logger = Logger();
  //final List<Read> parsedReadList = [];
  //final List<GetItem> getItemList = [];
  //await Future.delayed(const Duration(seconds: 1));
  try {
    logger.d("fetching reads");
    var response = await getItems();
    //logger.d("response: ${response.body}");
    GetItemsResponse resObject =
        GetItemsResponse.fromJson(utf8.decode(response.bodyBytes));
    // TODO should be GetItem and refactored
    for (dynamic eDynamic in resObject.items) {
      //logger.d("eDynamic: $eDynamic");
      GetItem element = GetItem.fromMap(eDynamic);
      logger.d("element: ${element.title}");
      var parsedExp = Items2ExpAdapter().toAny(element);
      if (parsedExp is Read) {
        ref.read(addReadProvider(parsedExp));
      }
    }
    return "Loaded experiences";
  } catch (e) {
    logger.e("Error fetching reads: $e");
    return e.toString();
  }
} */
