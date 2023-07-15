import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:read_with_meaning/src/constants/colors.dart';
import 'package:read_with_meaning/src/constants/text_strings.dart';
import 'package:read_with_meaning/src/routing/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // * For more info on error handling, see:
  // * https://docs.flutter.dev/testing/errors
  await runZonedGuarded(() async {
    // * Entry point of the app
    runApp(ProviderScope(child: Meaning()));

    // * This code will present some error UI if any uncaught exception happens
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
    };
    ErrorWidget.builder = (FlutterErrorDetails details) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text('An error occurred'),
        ),
        body: Center(child: Text(details.toString())),
      );
    };
  }, (Object error, StackTrace stack) {
    // * Log any errors to console
    debugPrint(error.toString());
  });
}

class Meaning extends StatelessWidget {
  Meaning({super.key});

  final _router = routes;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: title,
      debugShowCheckedModeBanner: false,
      theme: MeaningAppTheme.lightTheme,
      darkTheme: MeaningAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: _router,
    );
  }
}
