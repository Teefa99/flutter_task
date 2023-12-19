import 'dart:convert';

import 'package:task/consts/colors.dart';
import 'package:task/widgets/custom_snackbar.dart';

import 'api_error_response.dart';

class BaseRepository {
  String getErrorMessage(String apiResponse) {
    if (apiResponse.isNotEmpty) {
      print("BASE ${apiResponse}");
      customSnackBar(apiResponse, ColorCode.red);
      return apiResponse;
    } else {
      print("BASE ${apiResponse}");

      return "Something went wrong please try again later";
    }
  }
}
