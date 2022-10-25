import 'package:fizzbuzz/bussiness_logic/models/theme_model.dart';

import 'package:fizzbuzz/bussiness_logic/view_models/fizz_buzz_view_model.dart';
import 'package:fizzbuzz/components/home_screen/fizz_buzz_form.dart';
import 'package:fizzbuzz/components/home_screen/fizz_buzz_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreenBottom extends StatelessWidget {
  const HomeScreenBottom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 9,
      child: Consumer<FizzBuzzViewModel>(
        builder: (context, fizzBuzzProvider, child) => Column(
          children: [
            SizedBox(
              height: AppTheme.sizeS,
            ),
            const FizzBuzzForm(),
            const Expanded(
              flex: 1,
              child: FizzBuzzList(),
            )
          ],
        ),
      ),
    );
  }
}
