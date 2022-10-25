import 'package:fizzbuzz/bussiness_logic/models/theme_model.dart';
import 'package:fizzbuzz/bussiness_logic/view_models/fizz_buzz_view_model.dart';
import 'package:fizzbuzz/components/home_screen/fizz_buzz_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FizzBuzzForm extends StatelessWidget {
  const FizzBuzzForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Consumer<FizzBuzzViewModel>(
      builder: (context, fizzBuzzProvider, child) => Form(
        key: fizzBuzzProvider.getFormKey,
        child: Column(
          children: [
            const FizzBuzzInput(),
            SizedBox(
              height: AppTheme.sizeXL,
            ),
            GestureDetector(
              key: const Key('FizzBuzzButtonKey'),
              onTap: fizzBuzzProvider.generateFizzBuzz,
              child: Container(
                height: 50,
                width: size.width * 0.5,
                decoration: AppTheme.gradientButtonDecoration,
                child: Center(
                  child: Text(
                    "Generate FizzBuzz",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
