import 'package:fizzbuzz/bussiness_logic/models/theme_model.dart';
import 'package:fizzbuzz/bussiness_logic/view_models/theme_view_model.dart';
import 'package:fizzbuzz/components/common/background_screen.dart';
import 'package:fizzbuzz/components/home_screen/bottom.dart';
import 'package:fizzbuzz/components/home_screen/header.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? animation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    animation = CurvedAnimation(
      parent: animationController!,
      curve: Curves.easeIn,
    );
    animationController!.forward();
  }

  void onThemeChange(ThemeViewModel themeProvider) {
    themeProvider.setAnimation = true;
    themeProvider.setDarkTheme = !themeProvider.getDarkTheme;

    if (animationController!.status == AnimationStatus.forward ||
        animationController!.status == AnimationStatus.completed) {
      animationController!.reset();
      animationController!.forward();
    } else {
      animationController!.forward();
    }
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundScreen(
      childWidget: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
            left: AppTheme.sizeM,
            right: AppTheme.sizeM,
          ),
          child: Column(
            children: [
              HomeScreenHeader(onThemeChange: onThemeChange),
              const HomeScreenBottom()
            ],
          ),
        ),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      animation: animation,
    );
  }
}
