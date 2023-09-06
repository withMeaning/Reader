import 'package:flutter/material.dart';
import 'package:read_with_meaning/public/common_widgets/navigation/clickable_text.dart';
import 'package:read_with_meaning/public/routing/routes.dart';

class TopLabel extends StatelessWidget {
  const TopLabel(
      {super.key,
      required this.child,
      required this.routeName,
      required this.text});

  final Widget child;
  final AppRoute routeName;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Center(
          child: Padding(
        padding: const EdgeInsets.only(top: 32.0, bottom: 10.0),
        child: ClickableText(
          route: routeName,
          text: text,
        ),
      )),
      Expanded(
        child: Container(
          foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: const Alignment(0, -0.95),
            colors: <Color>[
              Theme.of(context).colorScheme.background,
              Theme.of(context).colorScheme.background.withOpacity(0),
            ],
          )),
          child: child,
        ),
      )
    ]);
  }
}
