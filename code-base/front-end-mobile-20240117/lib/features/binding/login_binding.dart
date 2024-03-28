import 'package:front_end_mobile_20240117/core/connect_api/base_http_client.dart';
import 'package:front_end_mobile_20240117/core/storage/get_storage.dart';
import 'package:front_end_mobile_20240117/core/storage/get_storage_impl.dart';
import 'package:front_end_mobile_20240117/data/repository/login_repository.dart';
import 'package:front_end_mobile_20240117/features/controller/login_controller.dart';
import 'package:get/get.dart';


class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>StorageRepoImpl());
    Get.lazyPut(() => BaseStorageRepo());
    Get.lazyPut(() => ApiHelper(Get.find()));
    Get.lazyPut(() => LoginRepositoryImpl(Get.find()));
    Get.lazyPut(() => LoginController());
  }
}
