import 'dart:isolate';

import 'package:fizzbuzz/bussiness_logic/models/isolate_model.dart';

Future fizzBuzzInIsolate(int inputData) async {
  final ReceivePort port = ReceivePort();

  IsolateSetupModel requiredArgs =
      IsolateSetupModel(sendPort: port.sendPort, input: inputData);
  await Isolate.spawn(
    generateFizzBuzzIsolate,
    requiredArgs,
  );
  return await port.first;
}

Future<void> generateFizzBuzzIsolate(IsolateSetupModel dataRecive) async {
  List<String> fizzBuzzList = [];

  int start = 1;
  while (start <= dataRecive.input!) {
    if (start % 5 == 0 && start % 3 == 0) {
      fizzBuzzList.add("FizzBuzz");
    } else if (start % 3 == 0) {
      fizzBuzzList.add("Fizz");
    } else if (start % 5 == 0) {
      fizzBuzzList.add("Buzz");
    } else {
      fizzBuzzList.add(
        start.toString(),
      );
    }
    start++;
  }

  Isolate.exit(dataRecive.sendPort, fizzBuzzList);
}
