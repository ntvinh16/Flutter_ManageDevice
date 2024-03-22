import 'package:front_end_mobile_20240117/core/connect_api/base_http_client.dart';
import 'package:front_end_mobile_20240117/data/request/signup_request.dart';
import 'package:front_end_mobile_20240117/data/response/home_response.dart';

abstract class ISignUpRepository {
  Future signUp(SignUpRequest requestBody);
}

class SignUpRepositoryImpl extends ISignUpRepository {
  final ApiHelper _apiHelper;

  SignUpRepositoryImpl(this._apiHelper);

  @override
  Future signUp(SignUpRequest requestBody) async {
    // TODO: implement getDataHome
    print(requestBody);
    final data = await _apiHelper.signUp(requestBody);
    if (data.status.hasError) {
      return Future.error(data.hasError);
    } else {
      // return homeResponseFromJson(data.bodyString!);
    }
  }
}
