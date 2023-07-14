import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../providers/secure_login/utils.dart';
import '../../constants/image_strings.dart';
import '../../routing/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

// todo: This handles the decision between the login screen and the main screen
// todo: it also fetches a first item from the web, if the useqr is logged in and there is internet
class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              checkUserAuthorizationStatus(mounted).then((isLoggedIn) =>
                  isLoggedIn
                      ? context.replaceNamed(AppRoute.now.name)
                      : context.replaceNamed(AppRoute.login.name));
            }
          });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Stack(
      children: [
        Positioned(
          top: 0,
          bottom: 0,
          left: 0,
          right: 0,
          child: Image(image: AssetImage(logo)),
        )
      ],
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
