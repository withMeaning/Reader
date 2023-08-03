import 'package:flutter/material.dart';
import 'package:read_with_meaning/public/constants/image_strings.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(randomImage),
            fit: BoxFit.cover,
          ),
        ),
        child: child);
  }
}
