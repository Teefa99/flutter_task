import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:task/pages/login/data/login_repository.dart';
import 'package:task/resources/strings_generated.dart';
import 'package:task/routes/app_pages.dart';
import 'package:task/services/auth_service.dart';
import 'package:task/widgets/custom_snackbar.dart';

class LoginController extends SuperController<bool> {
  LoginController({required this.loginRepository});

  final ILoginRepository loginRepository;
  final GlobalKey<FormState> formKey = GlobalKey();
  RxBool isHiddenPassword = true.obs;
  bool isLoading = false;
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userPhoneController = TextEditingController();
  String notification = "";

  changeIsHiddenPassword() => isHiddenPassword.toggle();

  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.success());
  }

  changeLanguage() {
    if (AuthService.to.language == "en") {
      AuthService.to.selectLanguage("ar");
    } else {
      AuthService.to.selectLanguage("en");
    }
    update();
  }

  bool loginLoading = false;
  onLoginClicked(String phone) async {
    loginLoading = true;
    update();
    if (phone.startsWith("+2") && phone.length == 13) {
      phone = phone;
    } else if (phone.startsWith("0") && phone.length == 11) {
      phone = "+2$phone";
    } else if (phone.startsWith("1") && phone.length == 10) {
      phone = "+20$phone";
    }
    // else {
    //   customSnackBar(AppStrings.wrongNumber, ColorCode.red);
    // }
    await loginRepository.login(phone, passwordController.text, "").then(
      (value) {
        AuthService.to.login(value);
        Get.offNamed(Routes.HOME);
      },
    ).catchError((e) {
      loginLoading = false;
      customSnackBar(AppStrings.wrongData, Colors.red);
      update();
    });
    loginLoading = false;
    update();
  }

  @override
  void onDetached() {
    // TODO: implement onDetached
  }

  @override
  void onInactive() {
    // TODO: implement onInactive
  }

  @override
  void onPaused() {
    // TODO: implement onPaused
  }

  @override
  void onResumed() {
    // TODO: implement onResumed
  }
}
