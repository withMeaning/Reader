import 'package:flutter/material.dart';

// TODO rewrite
// ! currently not used
class CustomListItem extends StatelessWidget {
  const CustomListItem({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: 800,
        height: 100,
        child: Text(title),
      ),
    );
  }
}
