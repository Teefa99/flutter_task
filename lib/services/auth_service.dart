import 'package:task/consts/storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:task/pages/login/model/login_model.dart';
import 'package:task/routes/app_pages.dart';

class AuthService extends GetxService {
  static AuthService get to => Get.find();
  GetStorage box = GetStorage(StorageKeys.userDataBox);
  GetStorage box2 = GetStorage(StorageKeys.appLanguage);
  final isLoggedIn = false.obs;
  final isSelectedLanguage = false.obs;
  LoginModel? userInfo;
  String? language = Get.deviceLocale!.languageCode;
  bool get isLoggedInValue => isLoggedIn.value;

  @override
  void onInit() async {
    super.onInit();
    await GetStorage.init(StorageKeys.userDataBox);
    await GetStorage.init(StorageKeys.appLanguage);
    if (box.hasData(StorageKeys.userDataKey)) {
      isLoggedIn.value = true;
      userInfo = LoginModel.fromJson(box.read(StorageKeys.userDataKey));
    }

    if (box2.hasData(StorageKeys.language)) {
      isSelectedLanguage.value = true;
      language = box2.read(StorageKeys.language);
    }

    print("language ${language}");
  }

  void login(LoginModel userInfo) {
    isLoggedIn.value = true;
    this.userInfo = userInfo;
    box.write(StorageKeys.userDataKey, userInfo.toJson());
  }

  void logout() {
    isLoggedIn.value = false;
    userInfo = null;
    box.remove(StorageKeys.userDataKey);
    Get.offNamed(Routes.LOGIN);
  }

  void selectLanguage(lan) {
    isSelectedLanguage.value = true;
    Get.updateLocale(Locale(lan));
    language = lan;
    box2.write(StorageKeys.language, lan);
  }
}
