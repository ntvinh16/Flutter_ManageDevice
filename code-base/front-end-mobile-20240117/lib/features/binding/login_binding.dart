import 'package:front_end_mobile_20240117/core/storage/get_storage_impl.dart';
import 'package:front_end_mobile_20240117/features/controller/login_controller.dart';
import 'package:get/get.dart';


class LoginBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(()=>StorageRepoImpl());
    Get.lazyPut(() => LoginController());
  }
}
