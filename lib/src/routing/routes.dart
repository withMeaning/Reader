import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:read_with_meaning/localization/string_hardcoded.dart';
import 'package:read_with_meaning/src/common_widgets/errors/not_yet_implemented.dart';
import 'package:read_with_meaning/src/features/single_experience/view/presentation/single_exp_screen.dart';
import 'package:read_with_meaning/src/features/manage_experiences/sort/presentation/when_screen.dart';

import '../features/boot_up/login/presentation/login_screen.dart';
import '../features/boot_up/splash_screen.dart';

enum AppRoute {
  home,
  login,
  register,
  now,
  exp,
  stream,
  lakes,
}

final routes = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      name: AppRoute.home.name,
      builder: (_, __) => const SplashScreen(),
      routes: [
        GoRoute(
          path: 'login',
          name: AppRoute.login.name,
          builder: (_, __) => const LoginScreen(),
        ),
        GoRoute(
          path: 'register',
          name: AppRoute.register.name,

          pageBuilder: (_, __) => const MaterialPage(
              fullscreenDialog: true, //custom animation
              child: NotYetImplementedScreen()),
          //builder: (_, __) => const ,
        ),
        GoRoute(
          path: 'now',
          name: AppRoute.now.name,
          // this should redirect to the current experience like exp/id_of_now_exp
          redirect: (_, __) => "/exp/1".hardcoded,
        ),
        GoRoute(
            path: 'exp/:id',
            name: AppRoute.exp.name,
            builder: (_, state) {
              final expId = state.pathParameters['id']!;
              return SingleExperienceScreen(id: expId);
            }),
        GoRoute(
          path: 'stream',
          name: AppRoute.stream.name,
          builder: (_, __) => const WhenListScreen(),
        ),
        GoRoute(
          path: 'lakes',
          name: AppRoute.lakes.name,
          builder: (_, __) => const NotYetImplementedScreen(),
        ),
      ],
    ),
  ],
);
