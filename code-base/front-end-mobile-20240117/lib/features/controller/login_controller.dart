import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:front_end_mobile_20240117/core/base_controller.dart';
import 'package:front_end_mobile_20240117/data/common/toast_common.dart';
import 'package:front_end_mobile_20240117/data/repository/login_repository.dart';
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

  final LoginRepositoryImpl _loginRepositoryImpl = Get.find();

  void handleSignUp() {
    Get.offNamed(AppRoutes.HOME_PAGE);
  }

  void handleHome() {
    Get.offNamed(AppRoutes.DETAIL_PAGE);
  }

  void onTogglesShowPass() {
    showPass.value = !showPass.value;
  }

  void onSignInClicked(BuildContext context) async {
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

    if (!passInvalid.value && !userInvalid.value) {
      try {
        var result = await _loginRepositoryImpl.login(
            {"username": userController.text, "password": passController.text});
            print("123");
        if (result.data["statusCode"] == 200) {
          ToastCommon.successMessage(result.data["message"]);
          handleHome();
        } else {
          ToastCommon.errorMessage(result.data["message"]);
        }
      } on DioException catch (err) {
        print(err);
      }
    }
  }
}
