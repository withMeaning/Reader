import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Reaordarable List View", () {
    // https://drift.simonbinder.eu/docs/testing/
    testWidgets(
        'If I take the second element and move it to the first position, it should show up at the first postion',
        (tester) async {
      // TODO: Preparing the Mock DB
      ///tester.
      //find.
      // var database = AppDatabase(NativeDatabase.memory());

      // TODO: Pump the UI
      Widget text = const Text("Hello");
      await tester.pumpWidget(Material(
        child: Scaffold(body: text),
      )); // does not wait for animation to build

      // TODO: Verify the result
      expect(find.byWidget(text), findsOneWidget);
    });
  });
}
