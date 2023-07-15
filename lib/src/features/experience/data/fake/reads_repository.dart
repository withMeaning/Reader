import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:read_with_meaning/localization/string_hardcoded.dart';
import 'package:read_with_meaning/src/features/experience/data/fake/test_experiences.dart';
import 'package:read_with_meaning/src/features/experience/data/fetch_get_items.dart';
import 'package:read_with_meaning/src/features/experience/data/get_items_response.dart';
import 'package:read_with_meaning/src/features/experience/data/types/read.dart';

class FakeReadsRepository {
  final List<Read> _reads = mTestExps.whereType<Read>().toList();
  final List<Read> parsedReadList = [];

  List<Read> getReads() {
    return parsedReadList;
  }

  Read? getRead(String id) {
    try {
      return parsedReadList.firstWhere((Read exp) => exp.id == id);
    } catch (e) {
      return null;
    }
  }

  Read getNextRead(String id) {
    int index = parsedReadList.indexWhere((Read exp) => exp.id == id);
    if (index == parsedReadList.length - 1) {
      return parsedReadList.first;
    }
    return parsedReadList[index + 1];
  }

  Read getPreviousRead(String id) {
    int index = parsedReadList.indexWhere((Read exp) => exp.id == id);
    if (index == 0) {
      return parsedReadList.last;
    }
    return parsedReadList[index - 1];
  }

  final List<GetItem> getItemList = [];
  GetItemsResponse? resObject;

  Future<List<Read>> fetchReadsFromAPI() async {
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
      // ! this one should bo only called once, ever
      // ! it's called all the time
      // ! ??
      debugPrint("why${resObject.updatedAt}");
      for (var element in resObject.items) {
        getItemList.add(GetItem.fromMap(element));
      }
      for (var element in getItemList) {
        if (element.type == "read" && element.archived == false) {
          parsedReadList.add(Read(
              id: element.uid,
              author: element.author ?? "unknown".hardcoded,
              createdAt: 13213, // TODO this needs some timestamp parsing
              title: element.title ?? "unknown".hardcoded,
              mainContent: element.content ?? "".hardcoded,
              source: "spile.withmeaning.io".hardcoded,
              link: element.link ?? "".hardcoded));
        }
      }
      return Future.value(parsedReadList);
    } catch (e) {
      return Future.value(_reads);
    }
  }

  Future<List<Read>> fetchReads() async {
    return Future.value(parsedReadList);
  }

  Stream<List<Read>> watchReads() async* {
    await Future.delayed(const Duration(seconds: 1));
    yield parsedReadList;
  }

  Future<Read> fetchRead(String id) async {
    return fetchReads()
        .then((value) => value.firstWhere((Read exp) => exp.id == id));
  }

  Stream<Read> watchRead(String id) {
    return watchReads()
        .map((reads) => reads.firstWhere((Read exp) => exp.id == id));
  }
}

final readsRepositoryProvider = Provider<FakeReadsRepository>((ref) {
  return FakeReadsRepository();
});

final readRepositoryFutureProvider =
    FutureProvider.autoDispose.family<Read, String>((ref, id) {
  final readsRepository = ref.watch(readsRepositoryProvider);
  final link = ref.keepAlive();
  Timer(const Duration(seconds: 10), () {
    link.close();
  });
  return readsRepository.fetchRead(id);
});

final readRepositoryStreamProvider =
    StreamProvider.autoDispose.family<Read, String>((ref, id) {
  final readsRepository = ref.watch(readsRepositoryProvider);
  debugPrint("created $id");
  ref.onDispose(() => debugPrint("disposed"));
  final link = ref.keepAlive();
  // ! the debugPrints are called
  // ! link.close() is not
  Timer(const Duration(seconds: 10), () {
    debugPrint("closed");
    link.close();
  });
  return readsRepository.watchRead(id);
});

final readsListRepositoryFutureProvider =
    FutureProvider.autoDispose<List<Read>>((ref) {
  final readsRepository = ref.watch(readsRepositoryProvider);
  debugPrint("created readsListRepositoryFutureProvider");
  final link = ref.keepAlive();
  Timer(const Duration(seconds: 10), () {
    link.close();
  });
  return readsRepository.fetchReads();
});

final readsListRepositoryStreamProvider =
    StreamProvider.autoDispose<List<Read>>((ref) {
  final readsRepository = ref.watch(readsRepositoryProvider);
  final link = ref.keepAlive();
  Timer(const Duration(seconds: 10), () {
    link.close();
  });
  return readsRepository.watchReads();
});
