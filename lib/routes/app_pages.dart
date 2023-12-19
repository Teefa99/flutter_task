import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:task/pages/home/bindings/home_binding.dart';
import 'package:task/pages/home/presentation/views/home_view.dart';
import 'package:task/pages/login/bindings/login_binding.dart';
import 'package:task/pages/login/presentation/views/login_view.dart';
import 'package:task/pages/splash/bindings/splash_binding.dart';
import 'package:task/pages/splash/presentation/views/splash_view.dart';

part 'app_routes.dart';

// ignore: avoid_classes_with_only_static_members
class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
