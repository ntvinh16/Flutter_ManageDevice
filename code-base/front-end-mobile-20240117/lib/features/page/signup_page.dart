import 'package:flutter/material.dart';
import 'package:front_end_mobile_20240117/data/enum/agency_enum.dart';
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .center, // Đặt alignment của hàng là center
                  crossAxisAlignment:
                      CrossAxisAlignment.end, // Đặt alignment của cột là bottom
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 20), // Khoảng cách giữa 2 phần tử
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff007CC2),
                        ),
                        child: Image.asset(
                          'assets/Logo.png',
                          width: 60,
                          height: 60,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 0), // Khoảng cách giữa 2 phần tử
                      child: Text(
                        "Hello\nWelcome Back",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: TextField(
                  controller: controller.userFullController,
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                  decoration: InputDecoration(
                      labelText: "FULLNAME",
                      errorText: controller.userFullInvalid.value
                          ? controller.userFullNameErr
                          : null,
                      labelStyle: const TextStyle(
                          color: Color(0xff888888), fontSize: 15)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
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
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
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
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
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
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: DropdownButton<AgencyEnum>(
                    value: controller.selectedItem.value,
                    onChanged: (AgencyEnum? newValue) {
                      if (newValue != null) {
                        controller.selectedItem.value = newValue;
                      }
                    },
                    items: controller.items
                        .map<DropdownMenuItem<AgencyEnum>>((AgencyEnum value) {
                      return DropdownMenuItem<AgencyEnum>(
                        value: value,
                        child: Text(value.name),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
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
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: InkWell(
                  onTap: controller.handleSignIn,
                  child: Text("SIGN IN"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
