import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:front_end_mobile_20240117/core/base_controller.dart';
import 'package:front_end_mobile_20240117/core/utils/validator_util.dart';
import 'package:front_end_mobile_20240117/routes/routes.dart';
import 'package:get/get.dart';

class SignupController extends BaseController {
  RxBool showPass = false.obs;
  RxBool showPassCofirm = false.obs;
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController passConfirmController = TextEditingController();
  var userNameErr = "Tài khoản không hợp lệ";
  var passErr = "Mật khẩu phải trên 6 kí tự";
  var passConfirmErr = "Mật khẩu không hợp lệ";
  RxBool userInvalid = false.obs;
  RxBool passInvalid = false.obs;
  RxBool passConfirmInvalid = false.obs;

  void onTogglesShowPass() {
    showPass.value = !showPass.value;
  }

  void onTogglesShowPassConfirm() {
    showPassCofirm.value = !showPassCofirm.value;
  }

  void onSignInClicked(BuildContext context) {
    if (!ValidatorUtil.isEmail(userController.value.text)) {
      userInvalid.value = true;
    } else {
      userInvalid.value = false;
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

    if (!userInvalid.value && !passInvalid.value && !passConfirmInvalid.value) {
      Get.offNamed(AppRoutes.LOGIN_PAGE);
    }
  }
}
