import 'package:task/base/base_repositroy.dart';
import 'package:task/pages/login/model/login_model.dart';
import 'package:task/resources/strings_generated.dart';
import 'login_api_provider.dart';

abstract class ILoginRepository {
  Future<LoginModel> login(
      String userPhone, String password, String userFirebaseToken);
}

class LoginRepository extends BaseRepository implements ILoginRepository {
  LoginRepository({required this.provider});
  final ILoginProvider provider;

  @override
  Future<LoginModel> login(
      String userPhone, String password, String userFirebaseToken) async {
    final apiResponse =
        await provider.login(userPhone, password, userFirebaseToken);

    if (apiResponse.isOk && apiResponse.body != null) {
      return apiResponse.body!;
    } else {
      throw (getErrorMessage(apiResponse.bodyString ?? ""));
    }
  }
}
