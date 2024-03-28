import 'package:dio/dio.dart';
import 'package:front_end_mobile_20240117/core/connect_api/base_dio_client.dart';
import 'package:front_end_mobile_20240117/core/storage/get_storage_impl.dart';

class ApiHelper extends BaseApiClient {

  final Dio dio = Dio(

  );
  final StorageRepoImpl _storage;

  ApiHelper(this._storage);

  Future<dynamic> signUp(Map<String, dynamic> requestBody) {
    return dio.post('https://210f-2001-ee0-5362-b3d0-f57d-ac34-e146-6dfc.ngrok-free.app/user/create', data: requestBody);
  }

   Future<dynamic> login(Map<String, dynamic> requestBody) {
    return dio.post('https://210f-2001-ee0-5362-b3d0-f57d-ac34-e146-6dfc.ngrok-free.app/login', data: requestBody);
  }
  
   Future<dynamic> getAllUser() {
    return dio.get('https://210f-2001-ee0-5362-b3d0-f57d-ac34-e146-6dfc.ngrok-free.app/user/getAllUser');
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
