import 'package:flutter/material.dart';
import 'package:flutter_markdown_selectionarea/flutter_markdown_selectionarea.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:read_with_meaning/public/common_widgets/async_value_widget.dart';
import 'package:read_with_meaning/public/common_widgets/launch_url_and_route.dart';
import 'package:read_with_meaning/public/features/experience/data/repository/read_repository.dart';

class MainText extends ConsumerWidget {
  const MainText({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var repo = ref.watch(readFutureProvider(id));
    late String selection = "";

    return Container(
      child: Center(
        child: AsyncValueWidget(
            value: repo,
            data: (currentItem) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height - 48,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 32.0, right: 32.0),
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
                                // TODO replace with Super Editor Selection
                                /* ..insertAll(0, [
                                        ContextMenuButtonItem(
                                            onPressed: () {
                                              highlight(selection);
                                            },
                                            type: ContextMenuButtonType.custom,
                                            label: "Highlight"),
                                      ]), */
                                );
                          },
                          focusNode: FocusNode(),
                          child: MarkdownBody(
                              styleSheet: MarkdownStyleSheet(
                                blockquoteDecoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface
                                        .withAlpha(10),
                                    borderRadius: BorderRadius.circular(4)),
                              ),
                              onTapLink: (text, url, title) {
                                LaunchUrlAndRoute.launch(context, url!);
                              },
                              data: currentItem.mainContent),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
