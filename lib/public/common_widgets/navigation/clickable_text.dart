import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:read_with_meaning/public/routing/routes.dart';

class ClickableText extends StatelessWidget {
  const ClickableText(
      {super.key,
      required this.text,
      required this.route,
      this.hoverColor,
      this.icon});

  final String text;
  final AppRoute route;
  final Color? hoverColor;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(route.name);
      },
      hoverColor: hoverColor,
      child: Stack(
        children: [
          Align(
              alignment: text == "" ? Alignment.center : Alignment.topCenter,
              child: Icon(
                icon,
                color: Theme.of(context).colorScheme.onBackground,
                size: 48,
              )),
          Center(
              child: Text(text,
                  style: Theme.of(context).textTheme.headlineMedium)),
        ],
      ),
    );
  }
}
