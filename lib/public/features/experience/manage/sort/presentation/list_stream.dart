import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:read_with_meaning/public/common_widgets/async_value_widget.dart';
import 'package:read_with_meaning/public/features/experience/data/repository/read_repository.dart';
import 'package:read_with_meaning/shared/domain/types/read.dart';
import 'package:read_with_meaning/public/features/experience/manage/sort/presentation/reorderable_list.dart';
import 'package:read_with_meaning/public/routing/routes.dart';

class ListStream extends ConsumerStatefulWidget {
  const ListStream({super.key});

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
                    key: Key(exp.id),
                    title: Text(exp.title),
                    onTap: () => {
                      context.pushNamed(AppRoute.exp.name,
                          pathParameters: {"id": exp.id})
                    },
                    subtitle: Text(exp.author),
                  ))
              .toList();
          return CustomReorderableListView(list: list);
        });
  }
}
