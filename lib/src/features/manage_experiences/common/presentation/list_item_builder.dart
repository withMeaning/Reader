import 'package:flutter/material.dart';
import 'package:read_with_meaning/src/constants/breakpoints.dart';
import 'package:read_with_meaning/src/common_models/experiences/read.dart';
import 'package:read_with_meaning/localization/string_hardcoded.dart';
import 'package:read_with_meaning/src/common_widgets/responsive/responsive_center.dart';
import 'package:read_with_meaning/src/features/manage_experiences/common/presentation/costum_list_item.dart';

import '../../../../constants/app_sizes.dart';

// ! currently breaking, don't use
class ListItemBuilder extends StatelessWidget {
  const ListItemBuilder({super.key, required this.items});
  final List<Object> items;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return Text(
        'Your shopping cart is empty'.hardcoded,
      );
    }
    // ! MediaQuery is used on the assumption that the widget takes up the full
    // ! width of the screen. If that's not the case, LayoutBuilder should be
    // ! used instead.
    final screenWidth = MediaQuery.of(context).size.width;
    List<Read> onlyReadItems = items.whereType<Read>().toList();

    if (screenWidth >= Breakpoint.tablet) {
      // List of all experiences for tablet and desktop
      return ResponsiveCenter(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
          child: SizedBox(
              width: 600,
              child: Row(children: [
                ListView.builder(
                  itemCount: onlyReadItems.length,
                  itemBuilder: (context, index) => CustomListItem(
                    title: onlyReadItems[index].title,
                  ),
                ),
              ])));
    } else {
      // List of all experiences for mobile
      return ResponsiveCenter(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
          child: Row(children: [
            Flexible(
                flex: 3,
                child: SizedBox(
                  height: 800,
                  width: 400,
                  child: ListView.builder(
                    itemCount: onlyReadItems.length,
                    itemBuilder: (context, index) => CustomListItem(
                      title: onlyReadItems[index].title,
                    ),
                  ),
                )),
            Flexible(
                flex: 1,
                child:
                    ElevatedButton(onPressed: () {}, child: const Text('Buy')))
          ]));
    }
  }
}
