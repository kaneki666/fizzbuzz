import 'package:fizzbuzz/bussiness_logic/service/helpers.dart';
import 'package:flutter/material.dart';

class FizzBuzzViewModel extends ChangeNotifier {
  //variable
  bool _loading = false;
  int _numberToGenrate = 0;
  List<String> fizzBuzzList = [];
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

//getter
  bool get getIsLoading => _loading;
  int get getNumberToGenerate => _numberToGenrate;
  List<String> get getFizzBuzzList => fizzBuzzList;
  GlobalKey<FormState> get getFormKey => _formkey;

//setter
  set setNumberToGenrate(String value) {
    _numberToGenrate = int.tryParse(value)!;
    notifyListeners();
  }

  //methods
  void setLoading() {
    _loading = !_loading;
    notifyListeners();
  }

  void generateFizzBuzz() async {
    setLoading();
    if (_formkey.currentState!.validate()) {
      fizzBuzzList = [];
      int start = 1;
      //implemmentation of mutithreadding
      //if _numberToGenrate greater than 10000 fizzBuzz function is run in another thread so ui thread stays smooth..
      if (_numberToGenrate > 10000) {
        fizzBuzzList = await fizzBuzzInIsolate(_numberToGenrate);
      } else {
        while (start <= _numberToGenrate) {
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
      }
    }

    setLoading();
    FocusManager.instance.primaryFocus?.unfocus();
    notifyListeners();
  }

  //for unit test can't acces forkey so made this method for testing
  void generateTestFizzBuzz() async {
    fizzBuzzList = [];

    int start = 1;
    //implemmentation of mutithreadding
    //if _numberToGenrate greater than 10000 fizzBuzz function is run in another thread so ui thread stays smooth..
    if (_numberToGenrate > 10000) {
      fizzBuzzList = await fizzBuzzInIsolate(_numberToGenrate);
    } else {
      while (start <= _numberToGenrate) {
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
    }
    FocusManager.instance.primaryFocus?.unfocus();
    notifyListeners();
  }
}
