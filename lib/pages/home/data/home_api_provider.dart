import 'dart:convert';

import 'package:task/base/api_end_points.dart';
import 'package:task/base/base_auth_provider.dart';
import 'package:get/get.dart';
import 'package:task/pages/home/model/markers_model.dart';

abstract class IHomeProvider {
  Future<Response<MarkersModel>> getMarkers();
}

class HomeProvider extends BaseAuthProvider implements IHomeProvider {
  @override
  Future<Response<MarkersModel>> getMarkers() async {
    return await post<MarkersModel>(
      EndPoints.getMarkers,
      {},
      decoder: (data) {
        print(data);
        return MarkersModel.fromJson(json.decode(data.toString()));
      },
    );
  }
}
