import 'package:flutter/material.dart';

import '../application/reorder.dart';

class CustomReorderableListView extends StatefulWidget {
  const CustomReorderableListView({super.key, required this.list});
  final List<Widget> list;

  @override
  State<CustomReorderableListView> createState() =>
      _CustomReorderableListViewState();
}

class _CustomReorderableListViewState extends State<CustomReorderableListView> {
  late List<Widget> _items;
  @override
  void initState() {
    _items = List.from(widget.list);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      children: _items,
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          reorder(_items, oldIndex, newIndex);
        });
      },
    );
  }
}
