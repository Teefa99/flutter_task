import 'package:task/base/api_end_points.dart';
import 'package:task/base/base_provider.dart';

class BaseAuthProvider extends BaseProvider {
  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = EndPoints.baseUrl;
  }
}
