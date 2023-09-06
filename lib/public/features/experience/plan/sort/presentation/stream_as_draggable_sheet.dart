import 'package:flutter/material.dart';
import 'package:read_with_meaning/public/features/experience/plan/sort/presentation/list_stream.dart';

class StreamAsDraggableSheet extends StatelessWidget {
  const StreamAsDraggableSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.1,
        minChildSize: 0.1,
        maxChildSize: 0.9,
        snap: true,
        snapSizes: const [0.1, 0.5],
        builder: (context, controller) {
          return Container(
              height: MediaQuery.of(context).size.height,
              color: Theme.of(context).colorScheme.surface,
              child: ListStream(
                scrollController: controller,
              ));
        });
  }
}
