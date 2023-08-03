import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:read_with_meaning/public/common_widgets/errors/not_yet_implemented.dart';
import 'package:read_with_meaning/public/features/experience/manage/debug_admin/db_view.dart';
import 'package:read_with_meaning/public/features/experience/manage/sort/data/order_repositority.dart';
import 'package:read_with_meaning/public/features/experience/manage/sources/presentation/sources_screen.dart';
import 'package:read_with_meaning/public/features/experience/single/inbox_zero.dart/presentation/inbox_zero_screen.dart';
import 'package:read_with_meaning/public/features/experience/single/view/presentation/single_exp_screen.dart';
import 'package:read_with_meaning/public/features/experience/manage/sort/presentation/when_screen.dart';

import '../common_widgets/errors/404_screen.dart';
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
  four04,
  debugDB,
  settings,
  commands,
  search,
  done,
}

final goRouterProvider = Provider.autoDispose<GoRouter>((ref) {
  final firstExperienceId = ref.watch(firstExperienceProvider);
  return GoRouter(
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
            redirect: (_, __) {
              return '/exp/${firstExperienceId.value}';
            },
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
            builder: (_, __) => const SourcesListScreen(),
          ),
          GoRoute(
            path: '404',
            name: AppRoute.four04.name,
            builder: (_, __) => const NotFoundScreen(),
          ),
          GoRoute(
            path: 'debug/db',
            name: AppRoute.debugDB.name,
            builder: (_, __) => const DBViewScreen(),
          ),
          GoRoute(
            path: 'search',
            name: AppRoute.search.name,
            builder: (_, __) => const NotYetImplementedScreen(),
          ),
          GoRoute(
            path: 'done',
            name: AppRoute.done.name,
            builder: (_, __) => const InboxZeroScreen(),
          ),
        ],
      ),
    ],
  );
});
