import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:read_with_meaning/src/features/experience/data/fake/test_experiences.dart';
import 'package:read_with_meaning/src/features/experience/data/types/read.dart';

class FakeReadsRepository {
  final List<Read> _reads = mTestExps.whereType<Read>().toList();

/*   List<Read> getReads() {
    return _reads;
  } */

/*   Read? getRead(String id) {
    try {
      return _reads.firstWhere((Read exp) => exp.id == id);
    } catch (e) {
      return null;
    }
  } */

  Future<void> replaceReads(List<Read> realReads) {
    // TODO this should be observed by a stream?
    // TODO implement with Rx
    _reads.clear();
    _reads.addAll(realReads);
    return Future.value();
  }

  Read getNextRead(String id) {
    int index = _reads.indexWhere((Read exp) => exp.id == id);
    if (index == _reads.length - 1) {
      return _reads.first;
    }
    return _reads[index + 1];
  }

  Read getPreviousRead(String id) {
    int index = _reads.indexWhere((Read exp) => exp.id == id);
    if (index == 0) {
      return _reads.last;
    }
    return _reads[index - 1];
  }

  Future<List<Read>> fetchReads() async {
    return Future.value(_reads);
  }

  Stream<List<Read>> watchReads() async* {
    await Future.delayed(const Duration(seconds: 1));
    yield _reads;
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
/*   final link = ref.keepAlive();
  Timer(const Duration(seconds: 10), () {
    link.close();
  }); */
  return readsRepository.fetchRead(id);
});

final readRepositoryStreamProvider =
    StreamProvider.autoDispose.family<Read, String>((ref, id) {
  final readsRepository = ref.watch(readsRepositoryProvider);

  // TODO fix caching
  // ! the debugPrints are called
  // ! link.close() is not
/*     debugPrint("created $id");
  ref.onDispose(() => debugPrint("disposed"));
  final link = ref.keepAlive();
  Timer(const Duration(seconds: 10), () {
    debugPrint("closed");
    link.close();
  }); */
  return readsRepository.watchRead(id);
});

final readsListRepositoryFutureProvider =
    FutureProvider.autoDispose<List<Read>>((ref) {
  final readsRepository = ref.watch(readsRepositoryProvider);
/*   debugPrint("created readsListRepositoryFutureProvider");
  final link = ref.keepAlive();
  Timer(const Duration(seconds: 10), () {
    link.close();
  }); */
  return readsRepository.fetchReads();
});

final readsListRepositoryStreamProvider =
    StreamProvider.autoDispose<List<Read>>((ref) {
  final readsRepository = ref.watch(readsRepositoryProvider);
/*   final link = ref.keepAlive();
  Timer(const Duration(seconds: 10), () {
    link.close();
  }); */
  return readsRepository.watchReads();
});
