import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:read_with_meaning/public/common_widgets/navigation/main_swipe_navigation.dart';

class ListOfSources extends ConsumerStatefulWidget implements ScrollableWidget {
  const ListOfSources({super.key, this.scrollController});
  final ScrollController? scrollController;
  @override
  Widget rebuildWithScrollController(ScrollController controller) {
    return ListOfSources(scrollController: controller);
  }

  @override
  ConsumerState<ListOfSources> createState() => _ListStreamState();
}

// TODO this should propbably not hold the repository?
class _ListStreamState extends ConsumerState<ListOfSources> {
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
    return Container();
// ! Drift
/*     final readRepository = ref.watch(sourcesListRepositoryStreamProvider);
    return AsyncValueWidget(
        value: readRepository,
        placeholder: SizedBox(
          width: 100,
          height: 100,
          child: Container(
            color: Theme.of(context).colorScheme.background,
          ),
        ),
        data: (List<Source> sources) {
          var list = sources
              .map((Source source) => ListTile(
                    key: Key(source.primaryId.toString()),
                    title: Text(source.link),
                  ))
              .toList();
          return Stack(
            children: [
              TopLabel(
                routeName: AppRoute.lakes,
                text: "Sources".hardcoded,
                child: ListView(
                    controller: widget.scrollController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: list),
              ),
              const StreamAsDraggableSheet()
            ],
          );
        }); */
  }
}
