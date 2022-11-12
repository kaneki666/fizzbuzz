import 'package:fizzbuzz/bussiness_logic/models/theme_model.dart';
import 'package:fizzbuzz/bussiness_logic/view_models/fizz_buzz_view_model.dart';
import 'package:fizzbuzz/bussiness_logic/view_models/theme_view_model.dart';
import 'package:fizzbuzz/components/common/custom_loading_indicator.dart';
import 'package:fizzbuzz/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeViewModel themeChangeProvider = ThemeViewModel();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    bool isDarkTheme = await themeChangeProvider.fizzBuzzPreferences.getTheme();
    themeChangeProvider.setDarkTheme = isDarkTheme;
    themeChangeProvider.setIsLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeViewModel>(
          create: (_) => themeChangeProvider,
        ),
        ChangeNotifierProvider<FizzBuzzViewModel>(
          create: (_) => FizzBuzzViewModel(),
        ),
      ],
      child: Consumer<ThemeViewModel>(
        builder: (context, model, child) => model.getIsLoading
            ? const CustomLoadingIndicator()
            : MaterialApp(
                theme: AppTheme.themeData(
                  model.getDarkTheme,
                ),
                debugShowCheckedModeBanner: false,
                title: 'FizzBuzz',
                home: const HomeScreen(),
              ),
      ),
    );
  }
}
