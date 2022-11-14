import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:fizzbuzz/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group(
    'end-to-end test',
    () {
      testWidgets(
        'tap on the floating action button, verify counter',
        (WidgetTester tester) async {
          app.main();
          await tester.pumpAndSettle();

          Finder inputField = find.byKey(
            const ValueKey('FizzBuzzInputKey'),
          );
          Finder generateButton = find.byKey(
            const ValueKey('FizzBuzzButtonKey'),
          );

          //execute function

          await tester.enterText(
            inputField,
            '10000',
          );
          await tester.tap(
            generateButton,
            warnIfMissed: false,
          );

          //expect results
          expect(
            find.text("FizzBuzz"),
            findsWidgets,
          );
          await addDelay(10);
        },
      );
    },
  );
}

Future<void> addDelay(int ms) async {
  await Future<void>.delayed(Duration(seconds: ms));
}
