import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/consts/colors.dart';
import 'package:task/consts/text_styles.dart';
import 'package:task/widgets/custom_text.dart';


void customSnackBar(String title, Color color) {
  Get.snackbar("", title ?? "",
      margin: const EdgeInsets.only(bottom: 70, right: 32, left: 32),
      titleText: const SizedBox(),
      messageText: CustomText(title ?? "",
          textAlign: TextAlign.center,
          textStyle: TextStyles.textSmall.copyWith(
            fontWeight: FontWeight.w400,
            color: ColorCode.white,
          ),
          maxLines: 10),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: color,
      duration: const Duration(milliseconds: 3000),
      colorText: ColorCode.white);
}
