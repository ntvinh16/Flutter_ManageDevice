import 'package:front_end_mobile_20240117/core/connect_api/base_http_client.dart';
import 'package:front_end_mobile_20240117/data/request/home_request.dart';
import 'package:front_end_mobile_20240117/data/response/home_response.dart';

abstract class IHomeRepository {
  Future<HomeResponse> getDataHome(HomeRequest requestBody);
}

class HomeRepositoryImpl extends IHomeRepository {
  final ApiHelper _apiHelper;

  HomeRepositoryImpl(this._apiHelper);

  @override
  Future<HomeResponse> getDataHome(HomeRequest requestBody) async {
    // TODO: implement getDataHome
    final data = await _apiHelper.getDataHome(requestBody);
    if (data.status.hasError) {
      return Future.error(data.hasError);
    } else {
      return homeResponseFromJson(data.bodyString!);
    }
  }
}
