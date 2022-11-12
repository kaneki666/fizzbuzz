import 'package:flutter/material.dart';

class AppTheme {
//Sizes
  static double sizeXS = 5;
  static double sizeS = 10;
  static double sizeM = 15;
  static double sizeML = 17;
  static double sizeL = 20;
  static double sizeXL = 25;
  static double sizeXLM = 35;
  static double sizeXLL = 50;

  //colors
  static Color bgColorLight = const Color(0xfffbfbfb);
  static Color bgColorDark = const Color(0xff212121);
  static Color darkLight = const Color(0xff323232);
  static Color whiteLight = const Color(0xffe7e7e7);

  //text styles
  static TextTheme textThemeDark = TextTheme(
    bodyMedium: TextStyle(color: bgColorLight),
    bodyLarge: TextStyle(color: bgColorLight, fontFamily: "Silkscreen-Bold"),
    titleSmall: TextStyle(color: bgColorLight, fontSize: sizeML),
  );

  static TextTheme textThemeLight = TextTheme(
    bodyMedium: TextStyle(color: bgColorDark),
    bodyLarge: TextStyle(color: bgColorLight, fontFamily: "Silkscreen-Bold"),
    titleSmall: TextStyle(color: bgColorDark, fontSize: sizeML),
  );

  static TextStyle hintStyle(
    Color color,
  ) {
    return TextStyle(color: color);
  }

  ///button styles
  static ButtonStyle outlineButton = OutlinedButton.styleFrom(
    side: BorderSide(width: 1.0, color: bgColorDark),
  );

  //boxdecoration
  static BoxDecoration gradientButtonDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(AppTheme.sizeXS),
    gradient: LinearGradient(
      colors: [
        Colors.red.withOpacity(1),
        Colors.amber.withOpacity(0.8),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: const [0.15, 1.0],
      tileMode: TileMode.clamp,
    ),
  );

  //gradient

  static LinearGradient gradientText = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: const [0.45, 1],
    colors: [
      Colors.red.withOpacity(1),
      Colors.amber.withOpacity(0.8),
    ],
  );

  //themeapp
  static ThemeData themeData(
    bool isDarkTheme,
  ) {
    return ThemeData(
      fontFamily: "Silkscreen-Regular",
      primaryColor: isDarkTheme ? bgColorDark : bgColorLight,
      backgroundColor: isDarkTheme ? bgColorDark : bgColorLight,
      iconTheme: IconThemeData(
        color: isDarkTheme ? bgColorLight : bgColorDark,
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: isDarkTheme ? darkLight : whiteLight,
        focusedBorder: InputBorder.none,
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        labelStyle: isDarkTheme
            ? hintStyle(
                bgColorLight,
              )
            : hintStyle(
                bgColorDark,
              ),
      ),
      textTheme: isDarkTheme ? textThemeDark : textThemeLight,
    );
  }
}
