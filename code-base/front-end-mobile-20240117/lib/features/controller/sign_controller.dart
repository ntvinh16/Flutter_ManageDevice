import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:front_end_mobile_20240117/core/base_controller.dart';
import 'package:front_end_mobile_20240117/core/utils/validator_util.dart';
import 'package:front_end_mobile_20240117/data/common/toast_common.dart';
import 'package:front_end_mobile_20240117/data/enum/agency_enum.dart';
import 'package:front_end_mobile_20240117/data/repository/signup_repository.dart';
import 'package:front_end_mobile_20240117/routes/routes.dart';
import 'package:get/get.dart';

class SignupController extends BaseController {
  RxBool showPass = false.obs;
  RxBool showPassCofirm = false.obs;
  TextEditingController userController = TextEditingController();
  TextEditingController userFullController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController passConfirmController = TextEditingController();
  var userNameErr = "Tài khoản không hợp lệ";
  var userFullNameErr = "Họ và tên không được để trống";
  var passErr = "Mật khẩu phải trên 6 kí tự";
  var passConfirmErr = "Mật khẩu không hợp lệ";
  RxBool userInvalid = false.obs;
  RxBool userFullInvalid = false.obs;
  RxBool passInvalid = false.obs;
  RxBool passConfirmInvalid = false.obs;

  final SignUpRepositoryImpl _signUpRepositoryImpl = Get.find();

  List<AgencyEnum> items = [
    AgencyEnum('1', 'Hà Nội'),
    AgencyEnum('2', 'Nha Trang'),
    AgencyEnum('3', 'Cần Thơ'),
  ];
  late Rx<AgencyEnum> selectedItem;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    selectedItem = Rx(items[0]);
  }

  void handleSignIn() {
    Get.offNamed(AppRoutes.LOGIN_PAGE);
  }

  void onTogglesShowPass() {
    showPass.value = !showPass.value;
  }

  void onTogglesShowPassConfirm() {
    showPassCofirm.value = !showPassCofirm.value;
  }

  void onSignInClicked(BuildContext context) async {
    if (!ValidatorUtil.isEmail(userController.value.text)) {
      userInvalid.value = true;
    } else {
      userInvalid.value = false;
    }

    if (userFullController.text.length < 0) {
      userFullInvalid.value = true;
    } else {
      userFullInvalid.value = false;
    }

    if (passController.text.length < 6) {
      passInvalid.value = true;
    } else {
      passInvalid.value = false;
    }

    if (passConfirmController.text.length < 6 ||
        passConfirmController.text.length != passController.text.length) {
      passConfirmInvalid.value = true;
    } else {
      passConfirmInvalid.value = false;
    }

    try {
      if (!userInvalid.value &&
          !passInvalid.value &&
          !passConfirmInvalid.value) {
        final result = await _signUpRepositoryImpl.signUp({
          "fullname": userFullController.text,
          "username": userController.text,
          "password": passController.text,
          "userId": userController.text.split("@")[0],
          "officeId": selectedItem.value.code,
        });

        if (result.data["statusCode"] == 200) {
          ToastCommon.successMessage(result.data["message"]);
          handleSignIn();
        } else {
          ToastCommon.errorMessage(result.data["message"]);
        }
      }
    } on DioException catch (err) {
      print(err);
    }
  }
}
