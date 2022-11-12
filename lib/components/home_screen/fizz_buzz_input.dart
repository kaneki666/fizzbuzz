import 'package:fizzbuzz/bussiness_logic/view_models/fizz_buzz_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class FizzBuzzInput extends StatelessWidget {
  const FizzBuzzInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FizzBuzzViewModel>(
      builder: (context, fizzBuzzProvider, child) => TextFormField(
        key: const Key('FizzBuzzInputKey'),
        inputFormatters: [
          FilteringTextInputFormatter.allow(
            RegExp(r'[0-9]'),
          ),
          FilteringTextInputFormatter.digitsOnly
        ],
        validator: (value) {
          if (value!.isEmpty) {
            return "Can't be empty";
            // } else {
            //   int number = int.tryParse(value)!;
            //   if (number > 10000000) {
            //     return "Must be less than 10000000";
            //   }
          }
          return null;
        },
        onChanged: (String value) {
          if (value.isNotEmpty) {
            fizzBuzzProvider.setNumberToGenrate = value;
          }
        },
        style: Theme.of(context).textTheme.bodyMedium,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          filled: true,
          labelText: "FizzBuzz Limit Number",
        ),
        maxLines: 1,
      ),
    );
  }
}
