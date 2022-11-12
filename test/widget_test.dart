import 'package:fizzbuzz/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    "Show Fizzbuzz ",
    (WidgetTester tester) async {
      //find widgets
      Finder inputField = find.byKey(
        const ValueKey('FizzBuzzInputKey'),
      );
      Finder generateButton = find.byKey(
        const ValueKey('FizzBuzzButtonKey'),
      );

      //execute function
      await tester.pumpWidget(
        const MaterialApp(
          home: MyApp(),
        ),
      );
      await tester.enterText(
        inputField,
        '10000',
      );
      await tester.tap(
        generateButton,
        warnIfMissed: false,
      );
      await tester.pump();

      //expect results
      expect(
        find.text("FizzBuzz"),
        findsWidgets,
      );
    },
  );
}
