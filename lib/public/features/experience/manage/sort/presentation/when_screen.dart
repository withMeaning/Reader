import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:read_with_meaning/public/common_widgets/navigation/top_navigation.dart';
import 'package:read_with_meaning/public/common_widgets/responsive/responsive_center.dart';
import 'package:read_with_meaning/public/features/experience/manage/sort/presentation/add_exp.dart';
import 'package:read_with_meaning/public/features/experience/manage/sort/presentation/list_stream.dart';

import 'package:read_with_meaning/public/routing/routes.dart';

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
          body: const ResponsiveCenter(child: ListStream()),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return const SingleChildScrollView(
                      child: AddExpForm(),
                    );
                  });
            },
            child: const Icon(Icons.add),
          ),
        ));
  }
}
