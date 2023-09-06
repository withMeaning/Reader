import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:read_with_meaning/localization/string_hardcoded.dart';
import 'package:read_with_meaning/public/common_widgets/async_value_widget.dart';
import 'package:read_with_meaning/public/common_widgets/navigation/main_swipe_navigation.dart';
import 'package:read_with_meaning/public/features/experience/plan/sort/data/order_repositority.dart';
import 'package:read_with_meaning/public/features/experience/single/view/presentation/now_as_draggable_sheet.dart';
import 'package:read_with_meaning/shared/domain/types/read.dart';
import 'package:read_with_meaning/public/features/experience/plan/sort/presentation/reorderable_list.dart';
import 'package:read_with_meaning/public/routing/routes.dart';

class ListStream extends ConsumerStatefulWidget implements ScrollableWidget {
  const ListStream({super.key, this.scrollController});
  final ScrollController? scrollController;
  @override
  Widget rebuildWithScrollController(ScrollController controller) {
    return ListStream(scrollController: controller);
  }

  @override
  ConsumerState<ListStream> createState() => _ListStreamState();
}

class _ListStreamState extends ConsumerState<ListStream> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //final readRepository = ref.watch(readsListRepositoryStreamProvider);

/*     final readRepository = ref.watch(dbStreamProvider).map(
        data: (value) => {value.value.map((e) => Read.fromReadEntry(e))},
        error: (asyncError) => placeholderRead,
        loading: (asyncLoading) => placeholderRead); */
    final readRepository = ref.watch(sortedReadsListRepositoryStreamProvider);
    return AsyncValueWidget(
        value: readRepository,
        placeholder: SizedBox(
          width: 100,
          height: 100,
          child: Container(
            color: Theme.of(context).colorScheme.background,
          ),
        ),
        data: (List<Read> onlyReadItems) {
          var list = onlyReadItems
              .map((Read exp) => Dismissible(
                    confirmDismiss: (_) async {
                      try {
                        ref.read(removeExpFromOrdersProvider(exp.base.id));
                        return true;
                      } catch (e) {
                        return false;
                      }
                    },
                    key: Key(exp.base.id),
                    child: ListTile(
                      key: Key(exp.base.id),
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 1.0, top: 1.0),
                        child: Text(
                          exp.base.content,
                          maxLines: 2,
                        ),
                      ),
                      onTap: () => {
                        context.pushNamed(AppRoute.exp.name,
                            pathParameters: {"id": exp.base.id})
                      },
                      //contentPadding: const EdgeInsets.only(top: 10),
                      subtitle: exp.base.author != "me"
                          ? Text(
                              exp.base.author,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      color: Theme.of(context).disabledColor),
                            )
                          : null,
                    ),
                  ))
              .toList();

          /* list.add(Dismissible(
              key: const Key("add"),
              child: Container(
                height: 2000,
                color: Colors.red,
              ))); */
          return Stack(
            children: [
              CustomReorderableListView(
                list: list,
                controller: widget.scrollController,
                header: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 32.0, bottom: 10.0),
                    child: Text(
                      "Today".hardcoded,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                ),
              ),
              const NowAsDraggableSheet(),
            ],
          );
        });
  }
}
