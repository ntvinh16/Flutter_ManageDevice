import 'package:front_end_mobile_20240117/core/base_controller.dart';
import 'package:front_end_mobile_20240117/core/logger/app_logger.dart';
import 'package:front_end_mobile_20240117/data/repository/home_repository.dart';
import 'package:front_end_mobile_20240117/data/request/home_request.dart';
import 'package:front_end_mobile_20240117/data/response/home_response.dart';
import 'package:get/get.dart';

class HomeController extends BaseController {
final HomeRepositoryImpl _homeRepositoryImpl = Get.find();

  RxString data = RxString("Home Page");

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _getDataHome();
  }

  _getDataHome() async {
    HomeRequest homeRequest = HomeRequest();
    HomeResponse homeResponse = await _homeRepositoryImpl.getDataHome(homeRequest);
    AppLogger.i(homeResponse.title);
  }
}
