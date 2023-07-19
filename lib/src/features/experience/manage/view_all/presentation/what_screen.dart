import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:read_with_meaning/src/common_widgets/async_value_widget.dart';
import 'package:read_with_meaning/src/common_widgets/navigation/top_navigation.dart';
import 'package:read_with_meaning/src/features/experience/data/database/database.dart';
import 'package:read_with_meaning/src/routing/routes.dart';

class ViewAllScreen extends ConsumerStatefulWidget {
  const ViewAllScreen({super.key});

  @override
  ConsumerState<ViewAllScreen> createState() => _ViewAllScreenState();
}

class _ViewAllScreenState extends ConsumerState<ViewAllScreen> {
  // ? route is "Lakes", UI name is "What"

  @override
  void initState() {
    super.initState();
  }

  addTypes() {
    final database = ref.read(AppDatabase.provider);
    database
        .into(database.meaningTypes)
        .insert(MeaningTypesCompanion.insert(name: "Read"));
  }

  @override
  Widget build(BuildContext context) {
    final streamAllReads = ref.watch(dbStreamProvider);
    return TopNavigation(
      centerIcon: IconButton(
          onPressed: () {
            context.pushNamed(AppRoute.now.name);
          },
          icon: const Icon(Icons.circle_outlined)),
      child: Row(children: [
        AsyncValueWidget(
            value: streamAllReads,
            data: (reads) {
              return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                    itemCount: reads.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                          key: Key(reads[index].id.toString()),
                          title: Text(reads[index].title),
                          onTap: () => {
                                context.pushNamed(AppRoute.exp.name,
                                    pathParameters: {"id": reads[index].id})
                              },
                          subtitle: Text(reads[index].author),
                          trailing: IconButton(
                              onPressed: () {
                                // TODO: turn into provider
                                final database = ref.read(AppDatabase.provider);
                                database
                                    .delete(database.readEntries)
                                    .delete(reads[index]);
                              },
                              icon: const Icon(Icons.delete)));
                    },
                  ));
            })
      ]),
    );
  }
}
