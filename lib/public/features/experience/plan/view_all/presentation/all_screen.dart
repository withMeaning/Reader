import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:read_with_meaning/public/common_widgets/errors/snack_bar.dart';
import 'package:read_with_meaning/public/common_widgets/navigation/main_swipe_navigation.dart';
import 'package:read_with_meaning/public/common_widgets/responsive/responsive_center.dart';
import 'package:read_with_meaning/public/constants/icomoon_icons.dart';
import 'package:read_with_meaning/public/features/experience/data/from_server.dart/sync_once.dart';
import 'package:read_with_meaning/public/features/experience/plan/sort/presentation/stream_as_draggable_sheet.dart';
import 'package:read_with_meaning/public/features/experience/plan/sort/presentation/list_stream.dart';
import 'package:read_with_meaning/public/features/experience/plan/view_all/presentation/all_exp_list.dart';
import 'package:read_with_meaning/public/routing/navigation.dart';

import 'package:read_with_meaning/public/routing/routes.dart';

class AllExpListScreen extends StatelessWidget {
  const AllExpListScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ResponsiveCenter(
            child: Stack(
      children: [
        Consumer(
          builder: (context, ref, child) {
            return MainSwipeNavigation(
                centerMenuItem: MenuItem(
                  label: NavOptions.now.label,
                  icon: Icons.circle_outlined,
                  callback: () {
                    context.pushNamed(AppRoute.now.name);
                  },
                ),
                leftMenuItem: MenuItem(
                  label: NavOptions.refresh.label,
                  icon: Icons.refresh,
                  callback: () async {
                    snackBar(context, "Syncing...");
                    String message = await fetchReadsFromAPI(ref);
                    snackBar(context,
                        message); /* showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (BuildContext context) {
                            return const SingleChildScrollView(
                              child: AddSourceForm(),
                            );
                          }); */
                  },
                ),
                rightMenuItem: MenuItem(
                  label: NavOptions.command.label,
                  icon: Icomoon.magic_search,
                  callback: () {
                    context.pushNamed(AppRoute.search.name);
                  },
                ),
                child: const AllExpList());
          },
        ),
        const StreamAsDraggableSheet(),
      ],
    )));
  }
}
