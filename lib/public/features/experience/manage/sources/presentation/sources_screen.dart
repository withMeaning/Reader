import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:read_with_meaning/public/common_widgets/navigation/top_navigation.dart';
import 'package:read_with_meaning/public/common_widgets/responsive/responsive_center.dart';
import 'package:read_with_meaning/public/features/experience/manage/sources/presentation/add_source.dart';
import 'package:read_with_meaning/public/features/experience/manage/view_all/presentation/list_of_exps.dart';

import 'package:read_with_meaning/public/routing/routes.dart';

class SourcesListScreen extends StatelessWidget {
  const SourcesListScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return TopNavigation(
        centerIcon: IconButton(
            onPressed: () {
              context.pushNamed(AppRoute.now.name);
            },
            icon: const Icon(Icons.circle_outlined)),
        child: Scaffold(
          body: const ResponsiveCenter(child: ListOfReads()),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return const SingleChildScrollView(
                      child: AddSourceForm(),
                    );
                  });
            },
            child: const Icon(Icons.add),
          ),
        ));
  }
}
