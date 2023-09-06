import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:read_with_meaning/public/common_widgets/full_screen.dart';
import 'package:read_with_meaning/public/common_widgets/navigation/main_swipe_navigation.dart';
import 'package:read_with_meaning/public/features/experience/plan/sort/domain/realm_ordered.dart';
import 'package:read_with_meaning/public/features/experience/plan/stream_file/data/realm_repository.dart';
import 'package:read_with_meaning/public/features/experience/single/view/domain/now.dart';
import 'package:read_with_meaning/public/features/experience/single/view/presentation/now_as_draggable_sheet.dart';
import 'package:read_with_meaning/public/routing/routes.dart';
import 'package:realm/realm.dart';

class TodayList extends ConsumerStatefulWidget implements ScrollableWidget {
  const TodayList({super.key, this.scrollController});
  final ScrollController? scrollController;
  @override
  Widget rebuildWithScrollController(ScrollController controller) {
    return TodayList(scrollController: controller);
  }

  @override
  ConsumerState<TodayList> createState() => _TodayListState();
}

class _TodayListState extends ConsumerState<TodayList> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // ? should be currentIndexProvider, but that one doesn't update, and I don't want to use a stream
      int currentIndex = ref
          .read(realmProvider)!
          .query<Orders>(
              "experience = \$0", [ref.watch(nowProvider).experience])
          .first
          .orderIndex;
      widget.scrollController!.jumpTo((40.0 * currentIndex) - 70);
    });
  }

  @override
  Widget build(BuildContext context) {
    //RealmResults<Orders> items = ref.watch(todaysExperiencesProvider);
    Realm realm = ref.watch(realmProvider)!;
    Now now = ref.watch(nowProvider);
    return StreamBuilder(
        stream: ref.watch(todaysExperiencesProvider).changes,
        builder: (context, snapshpt) {
          RealmResults<Orders> items = ref.read(todaysExperiencesProvider);
          int currentIndex = //ref.watch(currentIndexProvider)
              ref
                  .read(realmProvider)!
                  .query<Orders>("experience = \$0", [now.experience])
                  .first
                  .orderIndex; // TODO attempt to build a statenotifier again
          return FullScreenNoAppBar(
            child: Container(
              color: Theme.of(context).colorScheme.surfaceVariant,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 48.0),
                    child: StreamBuilder<Object>(
                        stream: ref.watch(nowProvider).changes,
                        builder: (context, snapshot) {
                          return ReorderableListView.builder(
                            /* prototypeItem: const ListTile(
                            title: Text("text"),
                          ), */
                            onReorder: (int oldIndex, int newIndex) {
                              // update the UI
                              List itemIndexList = items.map((e) => e).toList();
                              if (oldIndex < newIndex) newIndex -= 1;
                              final Orders item =
                                  itemIndexList.removeAt(oldIndex);
                              itemIndexList.insert(newIndex, item);
                              // update the db
                              realm.write(() {
                                for (var i = 0; i < itemIndexList.length; i++) {
                                  realm.add(
                                      Orders(itemIndexList[i].id, i + 1,
                                          experience:
                                              itemIndexList[i].experience),
                                      update: true);
                                }
                              });
                            },
                            scrollController: widget.scrollController,
                            physics: const NeverScrollableScrollPhysics(),
                            footer: const SizedBox(height: 1000),
                            itemBuilder: (context, index) {
                              return Dismissible(
                                confirmDismiss: (direction) async {
                                  if (items[index].experience!.id ==
                                      now.experience!.id) {
                                    return Future.value(false);
                                  }
                                  realm.write(() {
                                    realm.delete(items[index]);
                                  });
                                  return Future.value(true);
                                },
                                key: ValueKey(items[index].id),
                                child: InkWell(
                                    onTap: () {
                                      ref.read(changeNowProvider(
                                          items[index].experience!));
                                    },
                                    onDoubleTap: () {
                                      ref.read(changeNowProvider(
                                          items[index].experience!));
                                      context.pushNamed(AppRoute.now.name);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 24, vertical: 8),
                                      child: (items[index].experience!.id ==
                                              now.experience!.id)
                                          ? Text(
                                              items[index].experience!.content,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineMedium,
                                            )
                                          : items[index].orderIndex <
                                                  currentIndex
                                              ? Text(
                                                  items[index]
                                                      .experience!
                                                      .content,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium
                                                      ?.copyWith(
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .onSurface
                                                                  .withOpacity(
                                                                      0.5)),
                                                )
                                              : Text(items[index]
                                                  .experience!
                                                  .content),
                                    )),
                              );
                            },
                            itemCount: items.length,
                          );
                        }),
                  ),
                  const NowAsDraggableSheet(),
                ],
              ),
            ),
          );
        });
  }
}
