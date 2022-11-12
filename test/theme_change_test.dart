import 'package:fizzbuzz/bussiness_logic/view_models/theme_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'Theme Provider group ',
    () {
      ThemeViewModel? themeprovider;

      setUp(
        () {
          themeprovider = ThemeViewModel();
        },
      );
      test(
        'Theme change test',
        () {
          themeprovider!.setDarkTheme = true;

          expect(themeprovider!.getDarkTheme, true);
        },
      );
      test(
        'Sharepreference saving theme test',
        () async {
          bool prefDarktheme =
              await themeprovider!.fizzBuzzPreferences.getTheme();

          expect(prefDarktheme, true);
        },
      );

      test(
        'Start animation test',
        () {
          themeprovider!.setAnimation = true;
          expect(themeprovider!.getStartAniamtion, true);
        },
      );

      test(
        'Is loading test',
        () {
          themeprovider!.setIsLoading = true;
          expect(themeprovider!.getIsLoading, true);
        },
      );
    },
  );

  tearDown(
    () {},
  );
}
