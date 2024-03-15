import 'package:flutter/material.dart';
import 'package:front_end_mobile_20240117/features/controller/sign_controller.dart';
import 'package:get/get.dart';

class SignupPage extends GetView<SignupController> {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: const BoxConstraints.expand(),
        color: Colors.white,
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffd8d8d8),
                  ),
                  child: const FlutterLogo(),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 60),
                child: Text(
                  "Hello\nWelcome Back",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 30),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: TextField(
                  controller: controller.userController,
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                  decoration: InputDecoration(
                      labelText: "USERNAME",
                      errorText: controller.userInvalid.value
                          ? controller.userNameErr
                          : null,
                      labelStyle: const TextStyle(
                          color: Color(0xff888888), fontSize: 15)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: Stack(
                  alignment: AlignmentDirectional.centerEnd,
                  children: <Widget>[
                    TextField(
                      controller: controller.passController,
                      style: const TextStyle(fontSize: 18, color: Colors.black),
                      obscureText: !controller.showPass.value,
                      decoration: InputDecoration(
                          labelText: "PASSWORD",
                          errorText: controller.passInvalid.value
                              ? controller.passErr
                              : null,
                          labelStyle: const TextStyle(
                              color: Color(0xff888888), fontSize: 15)),
                    ),
                   GestureDetector(
                        onTap: controller.onTogglesShowPass,
                        child: controller.showPass.value
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: Stack(
                  alignment: AlignmentDirectional.centerEnd,
                  children: <Widget>[
                    TextField(
                      controller: controller.passConfirmController,
                      style: const TextStyle(fontSize: 18, color: Colors.black),
                      obscureText: !controller.showPassCofirm.value,
                      decoration: InputDecoration(
                          labelText: "CONFIRM PASSWORD",
                          errorText: controller.passConfirmInvalid.value
                              ? controller.passConfirmErr
                              : null,
                          labelStyle: const TextStyle(
                              color: Color(0xff888888), fontSize: 15)),
                    ),
                    GestureDetector(
                        onTap: controller.onTogglesShowPassConfirm,
                        child: controller.showPassCofirm.value
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: () => controller.onSignInClicked(context),
                      child: const Text(
                        "SIGN UP",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
