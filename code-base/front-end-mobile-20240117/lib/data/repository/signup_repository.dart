import 'package:front_end_mobile_20240117/core/connect_api/base_http_client.dart';
import 'package:front_end_mobile_20240117/data/request/signup_request.dart';
import 'package:front_end_mobile_20240117/data/response/home_response.dart';

abstract class ISignUpRepository {
  Future<dynamic> signUp(Map<String, dynamic> requestBody);
}

class SignUpRepositoryImpl extends ISignUpRepository {
  final ApiHelper _apiHelper;

  SignUpRepositoryImpl(this._apiHelper);

  @override
  Future<dynamic> signUp(Map<String, dynamic> requestBody) async {
   return await _apiHelper.signUp(requestBody);
  }
}
