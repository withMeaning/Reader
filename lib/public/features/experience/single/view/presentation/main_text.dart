import 'package:flutter/material.dart';
import 'package:flutter_markdown_selectionarea/flutter_markdown_selectionarea.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:read_with_meaning/public/common_widgets/async_value_widget.dart';
import 'package:read_with_meaning/public/common_widgets/launch_url_and_route.dart';
import 'package:read_with_meaning/public/features/experience/data/repository/read_repository.dart';

class MainText extends ConsumerWidget {
  const MainText({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var repo = ref.watch(readFutureProvider(id));
    String selection = "";

    highlight() {
      // what should happen here?
      // 1. get the selection
      // 2. get the current read
      // 3. turn the selection into plain text
      // 4. find the beginning of the selection in the mainContent
      // 5. find the end of the selection in the mainContent
      // 6. add a highlight to the mainContent
      // 7. save the mainContent as Markdown again
      // 8. save the read to the database
      // 9. update the UI

      Logger().d(selection);
    }

    return Container(
      child: Center(
        child: AsyncValueWidget(
            value: repo,
            data: (currentItem) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 48.0, right: 48.0),
                      child: SelectionArea(
                        onSelectionChanged: (text) {
                          if (text != null) {
                            selection = text.plainText;
                          }
                        },
                        contextMenuBuilder: (context, editableTextState) {
                          return AdaptiveTextSelectionToolbar.buttonItems(
                              anchors: editableTextState.contextMenuAnchors,
                              buttonItems:
                                  editableTextState.contextMenuButtonItems
                                    ..insertAll(0, [
                                      ContextMenuButtonItem(
                                          onPressed: highlight,
                                          type: ContextMenuButtonType.custom,
                                          label: "Highlight"),
                                    ]));
                        },
                        focusNode: FocusNode(),
                        child: MarkdownBody(
                            styleSheet: MarkdownStyleSheet(
                                a: const TextStyle(color: Colors.red)),
                            onTapLink: (text, url, title) {
                              LaunchUrlAndRoute.launch(context, url!);
                            },
                            data: currentItem.mainContent),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
