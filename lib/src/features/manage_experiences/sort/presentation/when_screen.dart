import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:read_with_meaning/src/common_models/experiences/read.dart';
import 'package:read_with_meaning/src/common_widgets/navigation/top_navigation.dart';

import '../../../../common_widgets/reorderable_list.dart';
import '../../../../constants/test_experiences.dart';
import '../../../../routing/routes.dart';

class WhenListScreen extends StatelessWidget {
  const WhenListScreen({super.key});

  // TODO replace with state management solution

  @override
  Widget build(BuildContext context) {
    final List<Read> onlyReadItems = mTestExps.whereType<Read>().toList();
    final List<Widget> list = onlyReadItems
        .map((Read exp) => ListTile(
              key: Key(exp.id),
              title: Text(exp.title),
              subtitle: Text(exp.author),
            ))
        .toList();
    return TopNavigation(
        centerIcon: IconButton(
            onPressed: () {
              context.pushNamed(AppRoute.now.name);
            },
            icon: const Icon(Icons.circle_outlined)),
        child: CustomReorderableListView(list: list));
  }
}
