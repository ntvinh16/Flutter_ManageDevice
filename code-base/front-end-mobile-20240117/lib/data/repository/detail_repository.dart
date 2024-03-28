import 'package:dio/dio.dart';
import 'package:front_end_mobile_20240117/core/connect_api/base_http_client.dart';
import 'package:front_end_mobile_20240117/data/common/toast_common.dart';
import 'package:front_end_mobile_20240117/data/response/detail__response.dart';

abstract class IDetailRepository {
  Future<List<UserResponse>> getAllUser();
}

class DetailRepositoryImpl extends IDetailRepository {
  final ApiHelper _apiHelper;

  DetailRepositoryImpl(this._apiHelper);

  @override
  Future<List<UserResponse>> getAllUser() async {
    try {
      final result = await _apiHelper.getAllUser();
      return UserResponse.convertToUserResponseList(result.data["data"]);
    } on DioException catch (err) {
      ToastCommon.errorMessage(err.message.toString());
      throw err;
    }
  }
}
