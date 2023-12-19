import 'package:task/base/base_repositroy.dart';
import 'package:task/pages/home/model/markers_model.dart';
import 'home_api_provider.dart';

abstract class IHomeRepository {
  Future<MarkersModel> getMarkers();
}

class HomeRepository extends BaseRepository implements IHomeRepository {
  HomeRepository({required this.provider});
  final IHomeProvider provider;

  @override
  Future<MarkersModel> getMarkers() async {
    final apiResponse = await provider.getMarkers();
    if (apiResponse.isOk && apiResponse.body != null) {
      return apiResponse.body!;
    } else {
      throw (getErrorMessage(apiResponse.bodyString ?? ""));
    }
  }
}
