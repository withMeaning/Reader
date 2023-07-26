import 'package:flutter/material.dart';

import '../application/reorder.dart';

class CustomReorderableListView extends StatefulWidget {
  const CustomReorderableListView({super.key, required this.list, this.header});
  final List<Widget> list;
  final Widget? header;
  @override
  State<CustomReorderableListView> createState() =>
      _CustomReorderableListViewState();
}

class _CustomReorderableListViewState extends State<CustomReorderableListView> {
  late List<Widget> _items;

  @override
  Widget build(BuildContext context) {
    _items = List.from(widget.list);
    // TODO room for improvement, leveraging the state management

    return ReorderableListView(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      header: widget.header,
      children: _items,
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          reorder(_items, oldIndex, newIndex);
        });
      },
    );
  }
}
