import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:stack_trace/stack_trace.dart';

import 'package:read_with_meaning/public/constants/colors.dart';
import 'package:read_with_meaning/public/constants/text_strings.dart';
import 'package:read_with_meaning/public/routing/routes.dart';

import 'package:flutter/services.dart';

final Logger logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 8,
    lineLength: 120,
    colors: true,
    printEmojis: true,
    printTime: false,
  ),
  level: Level.debug, //main function to tell what to show
);

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterError.demangleStackTrace = (StackTrace stack) {
    if (stack is Trace) return stack.vmTrace;
    if (stack is Chain) return stack.toTrace().vmTrace;
    return stack;
  };

  runApp(
    // ignore: prefer_const_constructors
    ProviderScope(
      child: const Meaning(),
    ),
  );

  // * For more info on error handling, see:
  // * https://docs.flutter.dev/testing/errors
  // runZonedGuarded(
  //   () {
  //     // * Entry point of the app
  //     runApp(
  //       const ProviderScope(
  //         child: Meaning(),
  //       ),
  //     );
  //   },
  //   (Object error, StackTrace stack) {
  //     // * Log any errors to console
  //     debugPrint(error.toString());

  //     // * This code will present some error UI if any uncaught exception happens
  //     FlutterError.onError = (FlutterErrorDetails details) {
  //       FlutterError.presentError(details);
  //     };
  //     ErrorWidget.builder = (FlutterErrorDetails details) {
  //       return MaterialApp(
  //         home: Scaffold(
  //           appBar: AppBar(
  //             backgroundColor: Colors.red,
  //             title: const Text('An error occurred'),
  //             actions: [
  //               Consumer(builder: (context, ref, _) {
  //                 return IconButton(
  //                     icon: const Icon(Icons.logout),
  //                     onPressed: () {
  //                       logOut(ref);
  //                       //context.goNamed(AppRoute.login.name);
  //                     });
  //               })
  //             ],
  //           ),
  //           body: Center(child: Text(details.toString())),
  //         ),
  //       );
  //     };
  //   },
  // );
}

class Meaning extends ConsumerWidget {
  const Meaning({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);
    if (Platform.isAndroid) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.transparent,
          statusBarColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.dark));
    }
    return MaterialApp.router(
      title: title,
      debugShowCheckedModeBanner: false,
      theme: MeaningAppTheme.lightTheme,
      darkTheme: MeaningAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: router,
    );
  }
}
