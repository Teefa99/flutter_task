import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/consts/colors.dart';
import 'package:task/consts/text_styles.dart';
import 'package:task/pages/login/presentation/controllers/login_controller.dart';
import 'package:task/resources/strings_generated.dart';
import 'package:task/widgets/custom_button.dart';
import 'package:task/widgets/custom_text.dart';
import 'package:task/widgets/custom_text_form_field.dart';
import 'package:task/widgets/gaps.dart';
import 'package:validators/validators.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCode.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: CustomText(
          AppStrings.login,
          textStyle: TextStyles.textLarge.copyWith(color: ColorCode.primary),
        ),
        toolbarHeight: 100.sp,
      ),
      body: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          children: [
            Expanded(
              child: Form(
                key: controller.formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Gaps.vGap64,
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: AppStrings.himam,
                              style: TextStyles.textLarge.copyWith(
                                  color: ColorCode.primary, fontSize: 30),
                            ),
                            TextSpan(
                              text: AppStrings.drive,
                              style: TextStyles.textLarge.copyWith(
                                  color: ColorCode.black, fontSize: 30),
                            ),
                          ],
                        ),
                      ),
                      Gaps.vGap84,
                      CustomTextFormField(
                        controller: controller.userPhoneController,
                        hint: AppStrings.phoneNumber,
                        inputType: TextInputType.phone,
                        suffixIcon: const Icon(
                          Icons.phone,
                          color: ColorCode.black,
                        ),
                        validator: (text) {
                          return controller.userPhoneController.text
                                  .toString()
                                  .isNotEmpty
                              ? null
                              : AppStrings.reqField;
                        },
                      ),
                      Gaps.vGap10,
                      Obx(
                        () => CustomTextFormField(
                          controller: controller.passwordController,
                          hint: AppStrings.password,
                          inputType: TextInputType.text,
                          suffixIcon: IconButton(
                            onPressed: () {
                              controller.changeIsHiddenPassword();
                              controller.update();
                            },
                            icon: controller.isHiddenPassword.value
                                ? const Icon(
                                    CupertinoIcons.eye_slash,
                                    color: Colors.black,
                                  )
                                : const Icon(
                                    CupertinoIcons.eye,
                                    color: Colors.black,
                                  ),
                          ),
                          validator: (text) {
                            return controller.passwordController.text
                                        .toString()
                                        .isNotEmpty ||
                                    isLength(controller.passwordController.text,
                                        6, 16)
                                ? null
                                : AppStrings.validPassword;
                          },
                          obscureText: controller.isHiddenPassword.value,
                        ),
                      ),
                      Gaps.vGap3,
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: CustomText(
                          AppStrings.forgotPassword,
                          textStyle: TextStyles.textMedium
                              .copyWith(color: Colors.black),
                        ),
                      ),
                      Gaps.vGap16,
                      controller.obx(
                        (state) {
                          return CustomButton(
                            child: controller.loginLoading
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : CustomText(
                                    AppStrings.login,
                                    textStyle: TextStyles.textMedium.copyWith(
                                      color: ColorCode.white,
                                    ),
                                  ),
                            onPressed: () {
                              if (controller.formKey.currentState!.validate()) {
                                controller.onLoginClicked(
                                    controller.userPhoneController.text);
                              }
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
