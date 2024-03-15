import 'package:front_end_mobile_20240117/core/connect_api/base_http_client.dart';
import 'package:front_end_mobile_20240117/core/storage/get_storage.dart';
import 'package:front_end_mobile_20240117/core/storage/get_storage_impl.dart';
import 'package:front_end_mobile_20240117/data/repository/home_repository.dart';
import 'package:front_end_mobile_20240117/features/controller/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => BaseStorageRepo());
    Get.lazyPut(()=>StorageRepoImpl());
    Get.lazyPut(() => ApiHelper(Get.find()));
    Get.lazyPut(() => HomeRepositoryImpl(Get.find()));
    Get.lazyPut(() => HomeController());
  }
}
