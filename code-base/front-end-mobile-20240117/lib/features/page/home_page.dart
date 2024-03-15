import 'package:flutter/material.dart';
import 'package:front_end_mobile_20240117/core/base_screen_view.dart';
import 'package:front_end_mobile_20240117/features/controller/home_controller.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: BaseScreenView(
        addSafeArea: true,
        child: Text(controller.data.value),
      ),
    );
  }
}
