import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:fizzbuzz/bussiness_logic/view_models/theme_view_model.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BackgroundScreen extends StatelessWidget {
  const BackgroundScreen({
    super.key,
    required this.childWidget,
    required this.animation,
  });

  final Widget childWidget;
  final Animation<double>? animation;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Consumer<ThemeViewModel>(
        builder: (context, themeProvider, child) =>
            themeProvider.getStartAniamtion
                ? CircularRevealAnimation(
                    centerOffset: Offset(size.width * 0.9, 50),
                    animation: animation!,
                    child: childWidget,
                  )
                : childWidget,
      ),
    );
  }
}
