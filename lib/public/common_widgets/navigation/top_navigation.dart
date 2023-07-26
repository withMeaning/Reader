import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:read_with_meaning/public/features/experience/data/from_server.dart/sync_once.dart';
import '../../routing/routes.dart';

class TopNavigation extends StatelessWidget {
  const TopNavigation(
      {super.key, required this.child, required this.centerIcon});
  final Widget child;
  final IconButton centerIcon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text("Read With Meaning"),
        automaticallyImplyLeading: false,
        actions: [
          if (kDebugMode)
            IconButton(
                onPressed: () {
                  context.pushNamed(AppRoute.debugDB.name);
                },
                icon: const Icon(Icons.storage)),
          centerIcon,
          Consumer(
            builder: (context, ref, child) {
              return IconButton(
                  onPressed: () {
                    fetchReadsFromAPI(ref);
                  },
                  icon: const Icon(Icons.refresh));
            },
          ),
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