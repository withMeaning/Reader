import 'package:flutter/material.dart';

class FullScreen extends StatelessWidget {
  const FullScreen({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height -
          Scaffold.of(context).appBarMaxHeight!.toInt() -
          MediaQuery.of(context).padding.top,
      child: child,
    );
  }
}
