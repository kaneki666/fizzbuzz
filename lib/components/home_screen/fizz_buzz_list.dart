import 'dart:ui';

import 'package:fizzbuzz/bussiness_logic/models/theme_model.dart';
import 'package:fizzbuzz/bussiness_logic/view_models/fizz_buzz_view_model.dart';
import 'package:fizzbuzz/bussiness_logic/view_models/theme_view_model.dart';
import 'package:fizzbuzz/components/common/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FizzBuzzList extends StatefulWidget {
  const FizzBuzzList({
    Key? key,
  }) : super(key: key);

  @override
  State<FizzBuzzList> createState() => _FizzBuzzListState();
}

class _FizzBuzzListState extends State<FizzBuzzList> {
  ScrollController controller = ScrollController();
  @override
  void initState() {
    super.initState();
    scrollToOldPosition();
  }

  void scrollToOldPosition() {
    ThemeViewModel provider =
        Provider.of<ThemeViewModel>(context, listen: false);

    controller.addListener(
      () {
        if (provider.getStartAniamtion == false) {
          if (controller.hasClients) {
            provider.setScrollPosition = controller.position.pixels;
          }
        }
      },
    );

    if (provider.getStartAniamtion == true && provider.getScrollPosition > 0) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) {
          if (controller.hasClients) {
            controller.jumpTo(provider.getScrollPosition);
          }
        },
      );
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FizzBuzzViewModel>(
      builder: (context, fizzBuzzProvider, child) =>
          fizzBuzzProvider.getIsLoading
              ? const CustomLoadingIndicator()
              : ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context).copyWith(
                    dragDevices: {
                      PointerDeviceKind.touch,
                      PointerDeviceKind.mouse,
                    },
                  ),
                  child: ListView.separated(
                    controller: controller,
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.only(
                      top: AppTheme.sizeM,
                      bottom: AppTheme.sizeM,
                    ),
                    itemBuilder: (context, index) => Consumer<ThemeViewModel>(
                      builder: (context, theme, child) => Text(
                        fizzBuzzProvider.getFizzBuzzList[index],
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    separatorBuilder: (context, index) => SizedBox(
                      height: AppTheme.sizeM,
                    ),
                    itemCount: fizzBuzzProvider.getFizzBuzzList.length,
                  ),
                ),
    );
  }
}
