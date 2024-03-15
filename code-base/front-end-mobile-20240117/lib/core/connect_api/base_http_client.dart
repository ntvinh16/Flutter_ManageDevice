import 'package:front_end_mobile_20240117/core/connect_api/schema/app_response.dart';
import 'package:front_end_mobile_20240117/core/storage/get_storage_impl.dart';
import 'package:front_end_mobile_20240117/data/request/home_request.dart';
import 'package:front_end_mobile_20240117/flavor/flavor_config.dart';
import 'package:get/get.dart';

class ApiHelper extends GetConnect with AppResponse {
  final StorageRepoImpl _storage;

  ApiHelper(this._storage);

  @override
  void onInit() {
    httpClient.baseUrl = AppConfig.shared.baseUrl;
    httpClient.timeout = Duration(seconds: AppConfig.timeOut);

    addRequestModifier();

    httpClient.addResponseModifier((request, response) {
      return response;
    });
  }

  void addRequestModifier() {
    httpClient.addRequestModifier<dynamic>((request) {
      if (_storage.hasData(_storage.TOKEN_KEY)) {
        request.headers['Authorization'] = _storage.getToken()!;
      }
      request.headers['content-type'] = 'application/json; charset=utf-8';

      return request;
    });
  }

  Future<Response> getDataHome(HomeRequest requestBody) {
    return get('albums/1');
  }
}
