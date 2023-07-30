import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:read_with_meaning/public/common_widgets/async_value_widget.dart';
import 'package:read_with_meaning/public/common_widgets/full_screen.dart';
import 'package:read_with_meaning/public/constants/app_sizes.dart';
import 'package:read_with_meaning/public/features/experience/data/database/database.dart';
import 'package:read_with_meaning/public/features/experience/data/repository/read_repository.dart';
import 'package:read_with_meaning/public/features/experience/single/view/application/go_back_and_forth.dart';
import 'package:url_launcher/url_launcher.dart';

class SingleStream extends ConsumerWidget {
  const SingleStream({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final readRepository = ref.watch(readFutureProvider(id));
    var db = ref.read(AppDatabase.provider);
    return AsyncValueWidget(
        value: readRepository,
        // TODO refactor placeholder
        placeholder: SizedBox(
          width: 100,
          height: 100,
          child: Container(
            color: Theme.of(context).colorScheme.background,
          ),
        ),
        data: (currentItem) {
          debugPrint(currentItem.toString());
          return SingleChildScrollView(
            child: Column(children: [
              FullScreen(
                child: Column(
                  // TODO refactor this into even more widgets
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        style: Theme.of(context).textTheme.headlineLarge,
                        textAlign: TextAlign.center,
                        // TODO load this first, the content second
                        currentItem.base.content),
                    gapH12,
                    currentItem.base.author != ""
                        ? RichText(
                            text: TextSpan(
                              text: 'by ',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground
                                          .withAlpha(150)),
                              children: <TextSpan>[
                                TextSpan(
                                  text: currentItem
                                      .base.author, // TODO formating if long
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                )
                              ],
                            ),
                          )
                        : Container(),
                    gapH12,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              // ! TODO goPrevious(context, ref, currentItem.id ?? "1");
                              goPrevious(context, ref, id);
                            },
                            child: const Text("<")),
                        ElevatedButton(
                            onPressed: () {
                              goNext(context, ref, id);
                              // ! TODO  goNext(context, ref, currentItem.id ?? "1");
                            },
                            child: const Text(">"))
                      ],
                    )
                  ],
                ),
              ),
              Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Flexible(
                      child: MarkdownBody(
                          selectable: true,
                          onTapLink: (text, url, title) {
                            launchUrl(Uri.parse(url!));
                          },
                          /*styleSheet: MarkdownStyleSheet(
                              p: Theme.of(context).textTheme.headlineSmall),
                                                   style: Theme.of(context).textTheme.bodyLarge,
                          textAlign: TextAlign.left, */
                          data: currentItem.mainContent ?? " "),
                    ),
                  ),
                ],
              )
            ]),
          );
        });
  }
}
