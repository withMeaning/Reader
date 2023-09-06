import 'package:flutter/material.dart';

class FullScreen extends StatelessWidget {
  const FullScreen({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.maybeSizeOf(context)?.width,
      height: MediaQuery.maybeSizeOf(context)?.height ??
          0 -
              Scaffold.of(context).appBarMaxHeight!.toInt() -
              MediaQuery.of(context).padding.top,
      child: child,
    );
  }
}

class FullScreenNoAppBar extends StatelessWidget {
  const FullScreenNoAppBar({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.maybeOf(context)?.size.width,
      height: (MediaQuery.maybeOf(context)?.size.height ?? 0) -
          MediaQuery.of(context).padding.top,
      child: child,
    );
  }
}
