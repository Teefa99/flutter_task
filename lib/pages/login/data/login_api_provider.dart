import 'dart:convert';

import 'package:task/base/api_end_points.dart';
import 'package:task/base/base_auth_provider.dart';
import 'package:get/get.dart';
import 'package:task/pages/login/model/login_model.dart';

abstract class ILoginProvider {
  Future<Response<LoginModel>> login(
      String userPhone, String password, String userFirebaseToken);
}

class LoginProvider extends BaseAuthProvider implements ILoginProvider {
  @override
  Future<Response<LoginModel>> login(
      String userPhone, String password, String userFirebaseToken) async {
    return await post<LoginModel>(
      EndPoints.login,
      {
        "UserPhone": userPhone,
        "Password": password,
        "UserFirebaseToken": userFirebaseToken,
      },
      decoder: (data) {
        print(data);
        return LoginModel.fromJson(json.decode(data.toString()));
      },
    );
  }
}
