import 'dart:isolate';

class IsolateSetupModel {
  SendPort? sendPort;
  int? input;

  IsolateSetupModel({
    this.input,
    this.sendPort,
  });
}
