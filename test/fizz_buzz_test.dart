import 'package:fizzbuzz/bussiness_logic/view_models/fizz_buzz_view_model.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FizzBuzz Provider group ', () {
    FizzBuzzViewModel? fizzBuzzProvider;

    setUp(() {
      fizzBuzzProvider = FizzBuzzViewModel();
    });

    test('Input change test', () {
      fizzBuzzProvider!.setNumberToGenrate = '2';

      expect(fizzBuzzProvider!.getNumberToGenerate, 2);
    });

    test('List generate', () async {
      fizzBuzzProvider!.setNumberToGenrate = '15';
      fizzBuzzProvider!.generateTestFizzBuzz();
      final List<String> matchList = [
        '1',
        '2',
        'Fizz',
        '4',
        'Buzz',
        'Fizz',
        '7',
        '8',
        'Fizz',
        'Buzz',
        '11',
        'Fizz',
        '13',
        '14',
        'FizzBuzz',
      ];
      expect(fizzBuzzProvider!.getFizzBuzzList, matchList);
    });

    tearDown(() {});
  });
}
