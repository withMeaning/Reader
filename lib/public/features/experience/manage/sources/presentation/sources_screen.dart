import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:read_with_meaning/public/common_widgets/navigation/top_navigation.dart';
import 'package:read_with_meaning/public/common_widgets/responsive/responsive_center.dart';
import 'package:read_with_meaning/public/features/experience/manage/sources/presentation/add_source.dart';
import 'package:read_with_meaning/public/features/experience/manage/view_all/presentation/list_of_exps.dart';

import 'package:read_with_meaning/public/routing/routes.dart';

class SourcesListScreen extends StatelessWidget {
  const SourcesListScreen({super.key});
  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    double panEndY = 0.0;
    double velocityY = 0.0;

    return TopNavigation(
        centerIcon: IconButton(
            onPressed: () {
              context.pushNamed(AppRoute.now.name);
            },
            icon: const Icon(Icons.circle_outlined)),
        child: Scaffold(
          body: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                Logger().d("tap");
              },
              onPanUpdate: (details) {
                Logger().d("pan update $details");
                double newOffset = scrollController.offset - details.delta.dy;
                // Clamping scroll offset within the scrollable bounds
                if (newOffset < 0) {
                  newOffset = 0;
                } else if (newOffset >
                    scrollController.position.maxScrollExtent) {
                  newOffset = scrollController.position.maxScrollExtent;
                }
                scrollController.position.jumpTo(newOffset);
              },
              onPanEnd: (DragEndDetails details) {
                velocityY = details.velocity.pixelsPerSecond.dy;
                double finalOffset = scrollController.offset - velocityY;
                // Clamping scroll offset within the scrollable bounds
                if (finalOffset < 0) {
                  finalOffset = 0;
                } else if (finalOffset >
                    scrollController.position.maxScrollExtent) {
                  finalOffset = scrollController.position.maxScrollExtent;
                }
                scrollController.animateTo(finalOffset,
                    duration: const Duration(milliseconds: 700),
                    curve: Curves.decelerate);
              },
              child: Padding(
                  padding: const EdgeInsets.only(top: 100, bottom: 100),
                  child: ResponsiveCenter(
                      child: ListOfReads(
                    scrollController: scrollController,
                  )))),
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
