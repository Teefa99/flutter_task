import 'package:task/pages/splash/data/splash_repository.dart';
import 'package:task/routes/app_pages.dart';
import 'package:task/services/auth_service.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SplashController extends SuperController<dynamic> {
  SplashController({required this.splashRepository});

  final ISplashRepository splashRepository;
  @override
  void onInit() async {
    super.onInit();
    Future.delayed(const Duration(seconds: 2)).then((value) {
      final isLoggedIn = AuthService.to.isLoggedIn.value;
      final isSelectedLanguage = AuthService.to.isSelectedLanguage.value;
      print(
          "isLoggedIn ${isLoggedIn} isSelectedLanguage ${isSelectedLanguage}");
      if (isLoggedIn) {
        Get.offNamed(Routes.HOME);
      } else {
        Get.offNamed(Routes.LOGIN);
      }
    });
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
