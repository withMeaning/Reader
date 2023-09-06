import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:read_with_meaning/public/constants/app_sizes.dart';
import 'package:read_with_meaning/public/features/experience/plan/overview/application/info_provider.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.title,
    required this.onTap,
    this.text,
    this.icon,
  });

  final String title;
  final Function onTap;
  final String? text;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 5 / 6,
      child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              onTap();
            },
            hoverColor: Theme.of(context).colorScheme.surface,
            child: Consumer(builder: (context, ref, widget) {
              bool showInfoText = ref.watch(infoProvider);
              return Row(
                mainAxisAlignment: showInfoText
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.center,
                children: [
                  Center(
                    child: Icon(
                      icon,
                      color: Theme.of(context).colorScheme.onBackground,
                      size: 48,
                    ),
                  ),
                  gapW20,
                  showInfoText
                      ? Column(children: [
                          Text(title,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  Theme.of(context).textTheme.headlineMedium),
                          gapH12,
                          if (text != null) Text(text!),
                        ])
                      : Container(),
                ],
              );
            }),
          )),
    );
  }
}
