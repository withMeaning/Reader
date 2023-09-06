import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:read_with_meaning/public/common_widgets/navigation/main_swipe_navigation.dart';
import 'package:read_with_meaning/public/constants/icomoon_icons.dart';
import 'package:read_with_meaning/public/constants/image_strings.dart';
import 'package:read_with_meaning/public/features/experience/plan/stream_file/presentation/edit_stream_file.dart';
import 'package:read_with_meaning/public/routing/navigation.dart';
import 'package:read_with_meaning/public/routing/routes.dart';

class StreamFileScreen extends StatelessWidget {
  const StreamFileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainSwipeNavigation(
          gradientImage: const AssetImage(navigationBackgroundImageOnBlack),
          centerMenuItem: MenuItem(
            label: NavOptions.now.label,
            icon: Icons.circle_outlined,
            callback: () {
              context.pushNamed(AppRoute.now.name);
            },
          ),
          leftMenuItem: MenuItem(
            label: NavOptions.add.label,
            icon: Icons.add,
            callback: () {},
          ),
          rightMenuItem: MenuItem(
            label: NavOptions.command.label,
            icon: Icomoon.magic_search,
            callback: () {
              context.pushNamed(AppRoute.search.name);
            },
          ),
          child: const EditFile()),
    );
  }
}
