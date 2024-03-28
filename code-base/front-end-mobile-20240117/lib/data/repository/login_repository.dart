import 'package:front_end_mobile_20240117/core/connect_api/base_http_client.dart';

abstract class ILoginRepository {
  Future<dynamic> login(Map<String, dynamic> requestBody);
}

class LoginRepositoryImpl extends ILoginRepository {
  final ApiHelper _apiHelper;

  LoginRepositoryImpl(this._apiHelper);

  @override
  Future<dynamic> login(Map<String, dynamic> requestBody) async {
   return await _apiHelper.login(requestBody);
  }
}
