import 'package:flutter/material.dart';
import 'package:read_with_meaning/public/constants/app_sizes.dart';

class SwipeableIcon extends StatefulWidget {
  const SwipeableIcon(
      {super.key,
      required this.isSelected,
      required this.icon,
      this.iconSize,
      this.opacity,
      this.labelText});
  final bool isSelected;
  final double? iconSize;
  final double? opacity;
  final String? labelText;
  final IconData icon;

  @override
  State<SwipeableIcon> createState() => _SwipeableIconState();
}

class _SwipeableIconState extends State<SwipeableIcon> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          surfaceTintColor: Theme.of(context).colorScheme.onBackground,
          elevation: widget.isSelected ? 1 : 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1000.0),
          ),
          child: Padding(
            padding: padding12,
            child: Icon(widget.icon,
                size: widget.iconSize ?? 40.0,
                color: Theme.of(context)
                    .colorScheme
                    .onBackground
                    .withOpacity(widget.opacity ?? 1)),
          ),
        ),
        widget.isSelected && widget.labelText != null
            ? Text(widget.labelText!,
                style: Theme.of(context).textTheme.bodyMedium)
            : Container(),
      ],
    );
  }
}
