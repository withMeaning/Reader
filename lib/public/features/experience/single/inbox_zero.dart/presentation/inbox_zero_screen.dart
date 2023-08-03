import 'package:flutter/material.dart';
import 'package:read_with_meaning/localization/string_hardcoded.dart';
import 'package:read_with_meaning/public/common_widgets/background_image.dart';
import 'package:read_with_meaning/public/common_widgets/full_screen.dart';

class InboxZeroScreen extends StatelessWidget {
  const InboxZeroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FullScreenNoAppBar(
        child: BackgroundImage(
      child: Stack(
        children: [
          Positioned(
              child: Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: const Alignment(0, 0),
                  colors: <Color>[
                    Colors.black.withOpacity(0.9),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          )),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Your Done!".hardcoded,
                    style: Theme.of(context).textTheme.bodyLarge,
                  )))
        ],
      ),
    ));
  }
}
