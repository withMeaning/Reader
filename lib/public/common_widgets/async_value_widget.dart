import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

class AsyncValueWidget<T> extends StatefulWidget {
  const AsyncValueWidget(
      {super.key, required this.value, required this.data, this.placeholder});

  final AsyncValue<T> value;
  final Widget Function(T) data;
  final Widget? placeholder;

  @override
  State<AsyncValueWidget<T>> createState() => _AsyncValueWidgetState<T>();
}

class _AsyncValueWidgetState<T> extends State<AsyncValueWidget<T>> {
  @override
  Widget build(BuildContext context) {
    return widget.value.when(
        data: widget.data,
        loading: () => Center(
            child: Shimmer.fromColors(
                baseColor: Theme.of(context).colorScheme.background,
                highlightColor: Colors.grey[800]!,
                child: widget.placeholder ?? Container())),
        error: (error, stack) => Center(child: Text(error.toString())));
  }
}
