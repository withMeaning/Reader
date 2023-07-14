import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../routing/routes.dart';

class TopNavigation extends StatelessWidget {
  const TopNavigation(
      {super.key, required this.child, required this.centerIcon});
  final Widget child;
  final IconButton centerIcon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Read With Meaning"),
        automaticallyImplyLeading: false,
        actions: [
          centerIcon,
          IconButton(
              onPressed: () {
                context.pushNamed(AppRoute.login.name);
              },
              icon: const Icon(Icons.login)),
        ],
      ),
      body: child,
    );
  }
}
