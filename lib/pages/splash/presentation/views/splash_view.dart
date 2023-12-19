import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/consts/colors.dart';
import 'package:task/consts/text_styles.dart';
import 'package:task/pages/splash/presentation/controllers/splash_controller.dart';
import 'package:task/resources/strings_generated.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [ColorCode.grey5, ColorCode.grey10],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
          child: Center(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: AppStrings.himam,
                    style: TextStyles.textLarge
                        .copyWith(color: ColorCode.primary, fontSize: 40),
                  ),
                  TextSpan(
                    text: AppStrings.drive,
                    style: TextStyles.textLarge
                        .copyWith(color: ColorCode.black, fontSize: 40),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
