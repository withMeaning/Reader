import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:read_with_meaning/src/common_widgets/navigation/top_navigation.dart';
import 'package:read_with_meaning/src/common_widgets/no_scroll.dart';
import 'package:read_with_meaning/src/constants/app_sizes.dart';
import 'package:read_with_meaning/src/features/experience/single/view/presentation/single_stream.dart';
import 'package:read_with_meaning/src/routing/routes.dart';

class SingleExperienceScreen extends StatelessWidget {
  const SingleExperienceScreen({super.key, required this.id});
  final String id;
  @override
  Widget build(BuildContext context) {
/*     late Read currentItem;
    try {
      currentItem = onlyReadItems.firstWhere((Read exp) => exp.id == id);
    } catch (e) {
      context.goNamed(AppRoute.four04.name);
    } */
    return TopNavigation(
        centerIcon: IconButton(
            onPressed: () {
              context.pushNamed(AppRoute.stream.name);
            },
            icon: const Icon(Icons.density_small)),
        child: NoScroll(
            child: Padding(padding: padding32, child: SingleStream(id: id))));
  }
}
