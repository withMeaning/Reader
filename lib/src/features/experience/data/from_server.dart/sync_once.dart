import 'package:flutter/material.dart';
import 'package:read_with_meaning/localization/string_hardcoded.dart';
import 'package:read_with_meaning/src/features/experience/data/from_server.dart/fetch_get_items.dart';
import 'package:read_with_meaning/src/features/experience/data/from_server.dart/get_items_response.dart';
import 'package:read_with_meaning/src/features/experience/data/types/read.dart';

// TODO sync data from the server to the drift DB
Future<List<Read>> fetchReadsFromAPI() async {
  final List<Read> parsedReadList = [];
  final List<GetItem> getItemList = [];
  //await Future.delayed(const Duration(seconds: 1));
  try {
    debugPrint("fetching reads");
    var response =
        await getItems(); /* .then((value) => {
            resObject = GetItemsResponse.fromJson(value.body),
            resObject?.items.forEach((element) {
              parsedReadList.add(jsonDecode(element));
            })
          }); */
    GetItemsResponse resObject = GetItemsResponse.fromJson(response.body);

    for (var element in resObject.items) {
      getItemList.add(GetItem.fromMap(element));
    }
    for (var element in getItemList) {
      if (element.type == "read" && element.archived == false) {
        parsedReadList.add(Read(
            id: element.uid,
            author: element.author ?? "unknown".hardcoded,
            createdAt: DateTime.now(),
            title: element.title ?? "unknown".hardcoded,
            mainContent: element.content ?? "".hardcoded,
            source: "spile.withmeaning.io".hardcoded,
            link: element.link ?? "".hardcoded));
      }
    }
    return Future.value(parsedReadList);
  } catch (e) {
    return Future.value(parsedReadList);
  }
}
