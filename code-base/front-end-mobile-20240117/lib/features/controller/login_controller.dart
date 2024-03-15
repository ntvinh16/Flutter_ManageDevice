import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:front_end_mobile_20240117/core/base_controller.dart';
import 'package:front_end_mobile_20240117/routes/routes.dart';
import 'package:get/get.dart';

import '../../core/utils/validator_util.dart';

class LoginController extends BaseController {
  RxBool showPass = false.obs;
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();
  var userNameErr = "Tài khoản không hợp lệ";
  var passErr = "Mật khẩu phải trên 6 kí tự, không hợp lệ";
  RxBool userInvalid = false.obs;
  RxBool passInvalid = false.obs;

  void onTogglesShowPass() {
    showPass.value = !showPass.value;
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

    if(!passInvalid.value && !userInvalid.value){
      Get.offNamed(AppRoutes.HOME_PAGE);
    }
  }
}
