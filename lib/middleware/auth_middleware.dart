import 'package:get/get.dart';
import '../../services/auth_service.dart';
import '../routes/app_pages.dart';

class EnsureAuthMiddleware extends GetMiddleware {
  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
    if (!AuthService.to.isLoggedInValue) {
      final newRoute = Routes.  LOGIN_THEN(route.location!);
      return GetNavConfig.fromRoute(newRoute);
    }
    return await super.redirectDelegate(route);
  }
}

class EnsureNotAuthedMiddleware extends GetMiddleware {
  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
    if (AuthService.to.isLoggedInValue) {
      //NEVER navigate to auth screen, when user is already authed
      if(Get.previousRoute.isNotEmpty){
        return GetNavConfig.fromRoute(Get.previousRoute);
      }else {
        return GetNavConfig.fromRoute(Routes.HOME);
      }
    }
    return await super.redirectDelegate(route);
  }
}