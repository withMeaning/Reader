import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:read_with_meaning/src/common_widgets/navigation/top_navigation.dart';

import '../../../../routing/routes.dart';

class SingleExperienceScreen extends StatelessWidget {
  const SingleExperienceScreen({super.key, required this.id});
  final String id;
  @override
  Widget build(BuildContext context) {
    return TopNavigation(
      centerIcon: IconButton(
          onPressed: () {
            context.pushNamed(AppRoute.stream.name);
          },
          icon: const Icon(Icons.density_small)),
      child: Center(child: Text(id)),
    );
  }
}
