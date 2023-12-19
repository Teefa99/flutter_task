import 'package:task/pages/login/model/login_model.dart';
import 'package:task/routes/app_pages.dart';
import 'package:task/services/auth_service.dart';
import 'package:get/get.dart';

class BaseProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.addRequestModifier<dynamic>((request) {
      LoginModel? userInfo = AuthService.to.userInfo;
      final languageApp = AuthService.to.language;
      if (userInfo != null && userInfo.data!.userToken!.isNotEmpty) {
        request.headers.putIfAbsent(
            "usertoken", () => ('${userInfo.data!.userToken ?? ""}'));
      }
      print("url ${httpClient.baseUrl}");
      request.headers.putIfAbsent(
          "Accept-Language", () => AuthService.to.language ?? 'ar');

      return request;
    });

    httpClient.addResponseModifier((request, response) {
      printInfo(info: request.url.toString());
      printInfo(info: response.bodyString!);
      if (response.unauthorized || response.status.code == 401) {
        AuthService.to.logout();
        Get.offNamed(Routes.LOGIN);
      }
      return response;
    });
  }
}
