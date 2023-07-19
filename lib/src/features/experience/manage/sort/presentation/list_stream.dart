import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:read_with_meaning/src/common_widgets/async_value_widget.dart';
import 'package:read_with_meaning/src/features/experience/data/repository/read_repository.dart';
import 'package:read_with_meaning/src/features/experience/data/types/read.dart';
import 'package:read_with_meaning/src/features/experience/manage/sort/presentation/reorderable_list.dart';
import 'package:read_with_meaning/src/routing/routes.dart';

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
        placeholder: ListView.builder(
          itemBuilder: (_, __) => Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 48.0,
                  height: 48.0,
                  color: Colors.white,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: 8.0,
                        color: Colors.white,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.0),
                      ),
                      Container(
                        width: double.infinity,
                        height: 8.0,
                        color: Colors.white,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.0),
                      ),
                      Container(
                        width: 40.0,
                        height: 8.0,
                        color: Colors.white,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          itemCount: 6,
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
