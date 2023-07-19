import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:read_with_meaning/src/common_widgets/navigation/top_navigation.dart';
import 'package:read_with_meaning/src/features/experience/manage/sort/presentation/add_exp.dart';
import 'package:read_with_meaning/src/features/experience/manage/sort/presentation/list_stream.dart';

import 'package:read_with_meaning/src/routing/routes.dart';

class WhenListScreen extends StatelessWidget {
  const WhenListScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return TopNavigation(
        centerIcon: IconButton(
            onPressed: () {
              context.pushNamed(AppRoute.lakes.name);
            },
            icon: const Icon(Icons.scatter_plot_outlined)),
        child: Scaffold(
          body: const ListStream(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return const AddExpForm();
                  });
            },
            child: const Icon(Icons.add),
          ),
        ));
  }
}
