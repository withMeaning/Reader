import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:read_with_meaning/public/common_widgets/async_value_widget.dart';
import 'package:read_with_meaning/public/features/experience/data/repository/read_repository.dart';
import 'package:read_with_meaning/public/features/experience/manage/sort/data/order_repositority.dart';
import 'package:read_with_meaning/shared/domain/types/read.dart';

class ListOfReads extends ConsumerStatefulWidget {
  const ListOfReads({super.key});

  @override
  ConsumerState<ListOfReads> createState() => _ListStreamState();
}

// TODO this should propbably not hold the repository?
class _ListStreamState extends ConsumerState<ListOfReads> {
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
    final readRepository = ref.watch(readsListRepositoryStreamProvider);
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
              .map((Read exp) => ListTile(
                    key: Key(exp.base.id),
                    title: Text(exp.base.content),
                    onTap: () => {
                      ref.read(addToTopProvider(exp.base.id)),
                    },
                    subtitle: Text(exp.base.author),
                  ))
              .toList();
          return ListView(children: list);
        });
  }
}
