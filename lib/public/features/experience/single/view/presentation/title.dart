import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:read_with_meaning/public/common_widgets/async_value_widget.dart';
import 'package:read_with_meaning/public/common_widgets/responsive/responsive_center.dart';
import 'package:read_with_meaning/public/constants/app_sizes.dart';
import 'package:read_with_meaning/public/features/experience/data/repository/read_repository.dart';

class ExpandingTitle extends ConsumerStatefulWidget {
  const ExpandingTitle({super.key, required this.id});
  final String id;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ExpandingTitleState();
}

class _ExpandingTitleState extends ConsumerState<ExpandingTitle> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    var repo = ref.watch(readFutureProvider(widget.id));
    return ResponsiveCenter(
      child: Padding(
        padding: padding32,
        child: Column(
          children: [
            AsyncValueWidget(
                value: repo,
                data: (currentItem) {
                  return InkWell(
                      onTap: () {
                        Logger().d(isExpanded);
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                      // TODO on very small screens maxLines should be dynamic
                      child: Text(currentItem.title,
                          textAlign: TextAlign.center,
                          softWrap: true,
                          maxLines: 7,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.headlineLarge));
                }),
            if (isExpanded)
              Column(children: [
                gapH12,
                AsyncValueWidget(
                    value: repo,
                    data: (currentItem) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 48.0, right: 48.0),
                        child: Text(currentItem.author,
                            textAlign: TextAlign.center,
                            softWrap: true,
                            style: Theme.of(context).textTheme.titleLarge),
                      );
                    }),
                gapH12,
                AsyncValueWidget(
                    value: repo,
                    data: (currentItem) {
                      return Text(currentItem.summary ?? "",
                          style: Theme.of(context).textTheme.bodyMedium);
                    }),
              ])
          ],
        ),
      ),
    );
  }
}
