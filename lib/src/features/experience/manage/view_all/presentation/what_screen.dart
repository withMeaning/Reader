import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
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
    final streamTypes = ref.watch(allTypes);
    return TopNavigation(
      centerIcon: IconButton(
          onPressed: () {
            context.pushNamed(AppRoute.now.name);
          },
          icon: const Icon(Icons.circle_outlined)),
      child: Row(children: [
        ElevatedButton(onPressed: addTypes, child: const Text("Add Type")),
        streamTypes.when(
            data: (types) {
              return SizedBox(
                  width: 500,
                  height: 500,
                  child: ListView.builder(
                    itemCount: types.length,
                    itemBuilder: (context, index) {
                      return Text(types[index].name);
                    },
                  ));
            },
            error: (e, __) => Center(child: Text("$e")),
            loading: () => const Center(child: CircularProgressIndicator()))
      ]),
    );
  }
}

final allTypes = StreamProvider((ref) {
  final database = ref.watch(AppDatabase.provider);
  return database.watchTypes();
});
