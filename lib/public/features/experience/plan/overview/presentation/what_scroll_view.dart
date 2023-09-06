import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:read_with_meaning/localization/string_hardcoded.dart';
import 'package:read_with_meaning/public/common_widgets/navigation/info_card.dart';
import 'package:read_with_meaning/public/common_widgets/navigation/main_swipe_navigation.dart';
import 'package:read_with_meaning/public/constants/app_sizes.dart';
import 'package:read_with_meaning/public/features/experience/plan/overview/application/info_provider.dart';
import 'package:read_with_meaning/public/features/experience/single/view/presentation/now_as_draggable_sheet.dart';
import 'package:read_with_meaning/public/routing/routes.dart';

class WhatScrollView extends ConsumerStatefulWidget
    implements ScrollableWidget {
  const WhatScrollView({super.key, this.scrollController});
  final ScrollController? scrollController;
  @override
  Widget rebuildWithScrollController(ScrollController controller) {
    return WhatScrollView(scrollController: controller);
  }

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WhatScrollViewState();
}

class _WhatScrollViewState extends ConsumerState<WhatScrollView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        controller: widget.scrollController,
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: Theme.of(context).colorScheme.surfaceVariant,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: padding24.top,
                    bottom: MediaQuery.of(context).size.height / 8),
                child: Align(
                  alignment: Alignment.center,
                  child: Consumer(builder: (context, ref, _) {
                    bool hasInfo = ref.watch(infoProvider);
                    return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: InfoCard(
                                title: "From Where?".hardcoded,
                                onTap: () =>
                                    context.pushNamed(AppRoute.sources.name),
                                icon: Icons.cloud_queue_outlined),
                          ),
                          gapH12,
                          Expanded(
                            flex: 1,
                            child: InfoCard(
                                title: "What?".hardcoded,
                                onTap: () =>
                                    context.pushNamed(AppRoute.all.name),
                                icon: Icons.waves_sharp),
                          ),
                          gapH12,
                          Expanded(
                            flex: 1,
                            child: InfoCard(
                                title: "When?".hardcoded,
                                text: "".hardcoded,
                                onTap: () =>
                                    context.pushNamed(AppRoute.file.name),
                                icon: Icons.filter_alt_outlined),
                          ),
                          gapH12,
                          Expanded(
                            flex: 1,
                            child: InfoCard(
                                title: "Today".hardcoded,
                                text:
                                    "Your final list of what you could be doing today."
                                        .hardcoded,
                                onTap: () {
                                  Logger().d("Today");
                                  context.pushNamed(AppRoute.stream.name);
                                },
                                icon: Icons.add_road),
                          ),
                          /* gapH12, // TODO archive
                            Text("Archive".hardcoded,
                        style: Theme.of(context).textTheme.headlineMedium), */
                        ]);
                  }),
                ),
              ),
              const NowAsDraggableSheet(),
            ],
          ),
        ));
  }
}
