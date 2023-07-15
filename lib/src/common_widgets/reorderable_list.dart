import 'package:flutter/material.dart';

class CustomReorderableListView extends StatefulWidget {
  const CustomReorderableListView({super.key, required this.list});
  final List<Widget> list;

  @override
  State<CustomReorderableListView> createState() =>
      _CustomReorderableListViewState();
}

class _CustomReorderableListViewState extends State<CustomReorderableListView> {
  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      children: <Widget>[
        for (int index = 0; index < widget.list.length; index += 1)
          widget.list[index],
      ],
      // TODO implement with riverpod and build List<Order>
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          final Widget item = widget.list.removeAt(oldIndex);
          widget.list.insert(newIndex, item);
        });
      },
    );
  }
}
