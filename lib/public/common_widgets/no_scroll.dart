import 'package:flutter/cupertino.dart';

class NoScrollBar extends StatelessWidget {
  const NoScrollBar({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: child,
    );
  }
}
