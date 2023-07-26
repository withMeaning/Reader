import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:read_with_meaning/public/routing/routes.dart';

import '../../constants/app_sizes.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('404'),
          gapW8,
          ElevatedButton(
              onPressed: () {
                context.goNamed(AppRoute.home.name);
              },
              child: const Text('Go Back to Safety')),
        ],
      ),
    );
  }
}
