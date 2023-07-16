import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:read_with_meaning/src/common_widgets/async_value_widget.dart';
import 'package:read_with_meaning/src/common_widgets/full_screen.dart';
import 'package:read_with_meaning/src/constants/app_sizes.dart';
import 'package:read_with_meaning/src/features/experience/data/fake/fake_reads_repository.dart';
import 'package:read_with_meaning/src/features/experience/single/view/application/go_back_and_forth.dart';

class SingleStream extends ConsumerWidget {
  const SingleStream({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final readRepository = ref.watch(readRepositoryStreamProvider(id));
    // !! this should only called once, per go_route
    // !! and only ever be 1 once.
    // !! instead it is called many timmes with many values
    // !! each time I invoke the /exp route
    debugPrint(id);

    return AsyncValueWidget(
        value: readRepository,
        placeholder: SizedBox(
          width: 100,
          height: 100,
          child: Container(
            color: Theme.of(context).colorScheme.background,
          ),
        ),
        data: (currentItem) {
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
                        currentItem.title ?? "No such experience"),
                    gapH12,
                    currentItem.author != ""
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
                                  text: currentItem.author ?? "",
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
                              goPrevious(context, ref, currentItem.id ?? "1");
                            },
                            child: const Text("<")),
                        ElevatedButton(
                            onPressed: () {
                              goNext(context, ref, currentItem.id ?? "1");
                            },
                            child: const Text(">"))
                      ],
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Flexible(
                    child: Text(
                        style: Theme.of(context).textTheme.bodyLarge,
                        textAlign: TextAlign.left,
                        currentItem.content),
                  ),
                ],
              )
            ]),
          );
        });
  }
}
