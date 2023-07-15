import 'package:flutter/cupertino.dart';

class NoScroll extends StatelessWidget {
  const NoScroll({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: child,
    );
  }
}
