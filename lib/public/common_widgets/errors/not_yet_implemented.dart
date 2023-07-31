import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:read_with_meaning/public/constants/app_sizes.dart';

class NotYetImplementedScreen extends StatelessWidget {
  const NotYetImplementedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Not Yet Implemented'),
            gapH12,
            ElevatedButton(
                onPressed: () => context.pop(), child: const Text('Go Back')),
          ],
        ),
      ),
    );
  }
}
