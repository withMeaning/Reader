import 'package:flutter/material.dart';

// TODO implement with riverpod and build List<Order>

void reorder(List<Widget> list, int oldIndex, int newIndex) {
  if (oldIndex < newIndex) {
    newIndex -= 1;
  }
  final Widget item = list.removeAt(oldIndex);
  list.insert(newIndex, item);
}


          // the actual reordering logic:
          // do the above
          // which will result in something like [widget 1, widget 3, widget 2, widget 4]
          // then create a new list, that looks like this: [<order>{widget_1.id, 0}, <order>{widget_3.id , 1}, order{widget 2, 2}, order{widget 4, 3}}]
          // I guess that's not necessary, as the index is already part of list? So I don't
          // need to an Order object, but can just use a List<String>?