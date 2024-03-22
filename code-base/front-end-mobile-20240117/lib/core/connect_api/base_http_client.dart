import 'package:dio/dio.dart';
import 'package:front_end_mobile_20240117/core/connect_api/base_dio_client.dart';
import 'package:front_end_mobile_20240117/core/connect_api/schema/app_response.dart';
import 'package:front_end_mobile_20240117/core/storage/get_storage_impl.dart';
import 'package:front_end_mobile_20240117/data/request/home_request.dart';
import 'package:front_end_mobile_20240117/flavor/flavor_config.dart';
import 'package:get/get.dart';

import '../../data/request/signup_request.dart';

class ApiHelper extends BaseApiClient {

  final Dio dio = Dio(

  );
  final StorageRepoImpl _storage;

  ApiHelper(this._storage);

  // @override
  // void onInit() {
  //   httpClient.baseUrl = AppConfig.shared.baseUrl;
  //   httpClient.timeout = Duration(seconds: AppConfig.timeOut);

  //   addRequestModifier();

  //   httpClient.addResponseModifier((request, response) {
  //     return response;
  //   });
  // }

  // void addRequestModifier() {
  //   httpClient.addRequestModifier<dynamic>((request) {
  //     if (_storage.hasData(_storage.TOKEN_KEY)) {
  //       request.headers['Authorization'] = _storage.getToken()!;
  //     }
  //     request.headers['content-type'] = 'application/json; charset=utf-8';

  //     return request;
  //   });
  // }

  Future<dynamic> getDataHome(HomeRequest requestBody) {
    return dio.get('albums/1');
  }

  Future<dynamic> signUp(SignUpRequest requestBody) {
    return dio.post('https://9241-2001-ee0-5367-98a0-2824-8e9b-13d5-8afb.ngrok-free.app/user/create', data: requestBody);
  }
  
  @override
  Map<String, dynamic>? getHeaders() {
    // TODO: implement getHeaders
    throw UnimplementedError();
  }
  
  @override
  void onTokenExpired() {
    // TODO: implement onTokenExpired
  }
}
