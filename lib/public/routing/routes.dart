import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:read_with_meaning/public/common_widgets/errors/not_yet_implemented.dart';
import 'package:read_with_meaning/public/features/boot_up/login/data/secure_login/storage.dart';
import 'package:read_with_meaning/public/features/experience/data/database/database.dart';
import 'package:read_with_meaning/public/features/experience/plan/debug_admin/db_view.dart';
import 'package:read_with_meaning/public/features/experience/plan/overview/presentation/what_screen.dart';
import 'package:read_with_meaning/public/features/experience/plan/sort/data/order_repositority.dart';
import 'package:read_with_meaning/public/features/experience/plan/sources/presentation/sources_screen.dart';
import 'package:read_with_meaning/public/features/experience/plan/stream_file/data/realm_repository.dart';
import 'package:read_with_meaning/public/features/experience/plan/stream_file/presentation/stream_file.dart';
import 'package:read_with_meaning/public/features/experience/plan/view_all/presentation/all_screen.dart';
import 'package:read_with_meaning/public/features/experience/single/inbox_zero.dart/presentation/inbox_zero_screen.dart';
import 'package:read_with_meaning/public/features/experience/single/view/presentation/single_screen.dart';
import 'package:read_with_meaning/public/features/experience/plan/sort/presentation/when_screen.dart';
import 'package:realm/realm.dart';

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
  sources,
  all,
  four04,
  debugDB,
  settings,
  commands,
  search,
  done,
  file,
}

final goRouterProvider = Provider.autoDispose<GoRouter>((ref) {
  //var firstExperienceId = ref.watch(firstExperienceProvider);
  AppDatabase db = ref.read(AppDatabase.provider);
  OrderRepository repo = ref.read(orderRepositoryProvider);

  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    redirect: (context, state) async {
      User? currentUser = ref.watch(currentUserProvider.notifier).state;
      if (currentUser != null) {
        if (state.location == '/login') {
          return '/now';
        } else {
          return null;
        }
      } else {
        String authToken = await secureStorage.read(key: 'authToken') ?? "";
        if (authToken == "") {
          return '/login';
        } else {
          ref.read(loginRealmRepositoryProvider).whenData((value) {
            if (value) {
              return '/now';
            } else {
              return '/login';
            }
          });
        }
      }
      return null;
    },
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
            redirect: (_, state) async {
              String firstExpId = await repo.firstExperience(db);
              if (firstExpId == "") {
                return '/404';
              }
              return '/exp/$firstExpId';
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
              builder: (_, __) => const WhatScreen(),
              routes: [
                GoRoute(
                  path: 'sources',
                  name: AppRoute.sources.name,
                  builder: (_, __) => const SourcesListScreen(),
                ),
                GoRoute(
                  path: 'all_exps',
                  name: AppRoute.all.name,
                  builder: (_, __) => const AllExpListScreen(),
                ),
              ]),
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
          GoRoute(
            path: 'stream-file',
            name: AppRoute.file.name,
            builder: (_, __) => const StreamFileScreen(),
          ),
        ],
      ),
    ],
  );
});
