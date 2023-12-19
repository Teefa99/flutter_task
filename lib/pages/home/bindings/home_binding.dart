import 'package:get/get.dart';
import '../data/home_api_provider.dart';

import '../data/home_repository.dart';
import '../presentation/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IHomeProvider>(HomeProvider());
    Get.put<IHomeRepository>(HomeRepository(provider: Get.find()));
    Get.put(HomeController(homeRepository: Get.find()));
  }
}
