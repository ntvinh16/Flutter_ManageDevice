import 'package:flutter/material.dart';
import 'package:front_end_mobile_20240117/core/base_controller.dart';
import 'package:get/get.dart';

class BaseScreenView extends GetView<BaseController> {
  final Widget child;
  final bool addSafeArea, addBackgroundColor;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final Function? onRefresh;

  const BaseScreenView({Key? key,
    required this.child,
    this.addSafeArea = true,
    this.addBackgroundColor = true,
    this.padding,
    this.backgroundColor,
    this.onRefresh})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return addSafeArea ? SafeArea(child: widget) : widget;
  }

  Widget get widget =>
      RefreshIndicator(
        child: Container(
          width: double.infinity,
          height: Get.height,
          color: addBackgroundColor ? Colors.white : backgroundColor,
          padding: padding,
          child: child,
        ),
        onRefresh: () async {
          onRefresh!();
        },
      );
}
