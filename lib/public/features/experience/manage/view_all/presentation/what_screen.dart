import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:read_with_meaning/public/common_widgets/async_value_widget.dart';
import 'package:read_with_meaning/public/common_widgets/navigation/top_navigation.dart';
import 'package:read_with_meaning/public/features/experience/data/database/database.dart';
import 'package:read_with_meaning/public/features/experience/data/repository/read_repository.dart';
import 'package:read_with_meaning/public/routing/routes.dart';

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
    final streamAllReads = ref.watch(readsListRepositoryStreamProvider);
    final database = ref.read(AppDatabase.provider);

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
                          key: Key(reads[index].base.id.toString()),
                          title: Text(reads[index].base.content),
                          onTap: () => {
                                context.pushNamed(AppRoute.exp.name,
                                    pathParameters: {
                                      "id": reads[index].base.id
                                    })
                              },
                          subtitle: Text(reads[index].base.author),
                          trailing: IconButton(
                              onPressed: () {
                                // TODO: turn into provider
                                (database.delete(database.readExtras)
                                      ..where((tbl) =>
                                          tbl.id.equals(reads[index].base.id)))
                                    .go();
                                (database.delete(database.experienceEntries)
                                      ..where((tbl) =>
                                          tbl.id.equals(reads[index].base.id)))
                                    .go();
                                //.delete  (reads[index].id);
                              },
                              icon: const Icon(Icons.delete)));
                    },
                  ));
            })
      ]),
    );
  }
}
