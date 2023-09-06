import 'package:flutter_test/flutter_test.dart';

void main() {
  group('swiping down', () {
    // GIVEN that I am on a screen that implements the navigation

    // WHEN I swipe down on the (left, center, right) side
    // AND the inner child is scrolled to the top position
    // THEN I should see a label of the (left, center, right) navigation

    // WHEN I swipe down
    // BUT then stop and swipe up the same distance
    // THEN the label should dissapear again
    // TODO  FAILS if only a few items

    // WHEN I swipe down
    // AND to to the left / right
    // THEN a different menu item should become selected

    // WHEN I swipe up
    // THEN the inner child scrollview should scroll

    // WHEN I swipe down
    // AND the inner child is NOT at the top
    // THEN I should scroll noramlly
    testWidgets('main swipe navigation ...', (tester) async {
      // TODO: Implement test
    });
  });

  group('swiping left / right', () {
    // GIVEN that I am on a screen that has left/right swipe

    // WHEN I swipe up or down, all the tests
    // of "swiping down" should still pass

    // WHEN I swipe left / right
    // THEN the entire screen should move to the left
    // AND a background image becomes visible

    // WHEN I swipe a certain amount
    // THEN different Icons should appear
    // AND the background image moves

    // WHEN I swipe left/right
    // BUT I stop and reverse direction
    // THEN the direction should change

    // WHEN I swipe
    // AND the end position of the screen movement is close
    // to where I started
    // THEN the screen should snap back
    // AND no function called

    // WHEN I swipe left/right
    // AND then up/down
    // THEN different labels to should be selected
    // (6 in total left/right * upper/middle/lower)
  });
}
