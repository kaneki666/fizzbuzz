import 'package:fizzbuzz/bussiness_logic/view_models/theme_view_model.dart';
import 'package:fizzbuzz/components/common/gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreenHeader extends StatelessWidget {
  const HomeScreenHeader({Key? key, required this.onThemeChange})
      : super(key: key);

  final Function onThemeChange;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GradientText(
            "FizzBuzz",
            style: const TextStyle(fontSize: 35, fontFamily: "Silkscreen-Bold"),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0.45, 1],
              colors: [
                Colors.red.withOpacity(1),
                Colors.amber.withOpacity(0.8),
              ],
            ),
          ),
          Consumer<ThemeViewModel>(
            builder: (context, themeProvider, child) => GestureDetector(
              onTap: () => onThemeChange(themeProvider),
              child: themeProvider.getDarkTheme
                  ? const Icon(
                      Icons.sunny,
                    )
                  : const Icon(Icons.nightlight),
            ),
          ),
        ],
      ),
    );
  }
}
