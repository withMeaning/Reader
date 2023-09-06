import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:read_with_meaning/public/constants/app_sizes.dart';
import 'package:read_with_meaning/public/features/boot_up/login/data/secure_login/utils.dart';
import 'package:read_with_meaning/public/routing/routes.dart';

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
            Consumer(builder: (context, ref, _) {
              return ElevatedButton(
                  onPressed: () {
                    logOut(ref);
                    //context.goNamed(AppRoute.login.name);
                  },
                  child: const Text('Log Out'));
            }),
            gapH12,
            ElevatedButton(
                onPressed: () => context.pop(), child: const Text('Go Back')),
          ],
        ),
      ),
    );
  }
}
