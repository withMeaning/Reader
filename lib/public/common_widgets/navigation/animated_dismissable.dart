import 'package:flutter/material.dart';

class AnimatedDismissable extends StatelessWidget {
  const AnimatedDismissable(
      {super.key, required this.child, required this.controller});

  final Widget child;
  final AnimationController controller;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: const Key(""),
        background: Container(
          color: controller.value < 0 ? Colors.red : Colors.green,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Align(
              alignment: controller.value < 0
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
          ),
        ),
        child: child);
  }
}
