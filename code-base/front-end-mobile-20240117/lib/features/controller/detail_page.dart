import 'package:front_end_mobile_20240117/core/base_controller.dart';
import 'package:front_end_mobile_20240117/data/enum/agency_enum.dart';
import 'package:front_end_mobile_20240117/data/enum/status_enum.dart';
import 'package:front_end_mobile_20240117/data/repository/detail_repository.dart';
import 'package:front_end_mobile_20240117/data/response/detail__response.dart';
import 'package:get/get.dart';

class DetailController extends BaseController {
  final DetailRepositoryImpl _detailRepositoryImpl = Get.find();

  List<AgencyEnum> items = [
    AgencyEnum('1', 'Hà Nội'),
    AgencyEnum('2', 'Nha Trang'),
    AgencyEnum('3', 'Cần Thơ'),
  ];
  late Rx<AgencyEnum> selectedItemAgency;

  List<StatusEnum> status = [
    StatusEnum('1', 'Chờ duyệt'),
    StatusEnum('2', 'Đã duyệt'),
    StatusEnum('3', 'Đã mua'),
  ];
  late Rx<StatusEnum> selectedItemStatus;

  RxList<UserResponse> userRequests = RxList([]);
  Rx<UserResponse?> selectedUserRequest = Rx(null);
  Rx<UserResponse?> selectedUserBeneficiaries = Rx(null);

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    selectedItemAgency = Rx(items[0]);
    selectedItemStatus = Rx(status[0]);
    await getAllUser();
  }

  Future<void> getAllUser() async {
    userRequests.value = await _detailRepositoryImpl.getAllUser();
    if (userRequests.length > 0) {
      selectedUserRequest.value = userRequests[0];
      selectedUserBeneficiaries.value = userRequests[0];
    }
  }
}
