import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:front_end_mobile_20240117/core/base_screen_view.dart';
import 'package:front_end_mobile_20240117/core/utils/common_util.dart';
import 'package:front_end_mobile_20240117/core/widget/label_widget.dart';
import 'package:front_end_mobile_20240117/data/enum/agency_enum.dart';
import 'package:front_end_mobile_20240117/data/enum/status_enum.dart';
import 'package:front_end_mobile_20240117/data/response/detail__response.dart';
import 'package:front_end_mobile_20240117/features/controller/detail_page.dart';
import 'package:get/get.dart';

class DetailPage extends GetView<DetailController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          "Quản lý thiết bị",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Obx(
        () => BaseScreenView(
          addSafeArea: true,
          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: SingleChildScrollView(
              child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LabelWidget(text: "Chi Nhánh"),
                            DropdownButton<AgencyEnum>(
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                fontSize: 12,
                              ),
                              value: controller.selectedItemAgency.value,
                              onChanged: (AgencyEnum? newValue) {
                                if (newValue != null) {
                                  controller.selectedItemAgency.value =
                                      newValue;
                                }
                              },
                              items: controller.items
                                  .map<DropdownMenuItem<AgencyEnum>>(
                                (AgencyEnum value) {
                                  return DropdownMenuItem<AgencyEnum>(
                                    value: value,
                                    child: Text(value.name),
                                  );
                                },
                              ).toList(),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LabelWidget(text: "Trạng Thái"),
                            DropdownButton<StatusEnum>(
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                fontSize: 12,
                              ),
                              value: controller.selectedItemStatus.value,
                              onChanged: (StatusEnum? newValue) {
                                if (newValue != null) {
                                  controller.selectedItemStatus.value =
                                      newValue;
                                }
                              },
                              items: controller.status
                                  .map<DropdownMenuItem<StatusEnum>>(
                                (StatusEnum value) {
                                  return DropdownMenuItem<StatusEnum>(
                                    value: value,
                                    child: Text(value.name),
                                  );
                                },
                              ).toList(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LabelWidget(text: "Phân Loại"),
                      TextField(
                        controller: null,
                        style:
                            const TextStyle(fontSize: 14, color: Colors.black),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.fromLTRB(6, 6, 6, 6),
                            errorText: null,
                            isCollapsed: true,
                            labelStyle: null),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LabelWidget(text: "Mã Thiết Bị"),
                      TextField(
                        controller: null,
                        style:
                            const TextStyle(fontSize: 14, color: Colors.black),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.fromLTRB(6, 6, 6, 6),
                            errorText: null,
                            isCollapsed: true,
                            labelStyle: const TextStyle(
                                color: Color(0xff888888), fontSize: 15)),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LabelWidget(text: "Tên Thiết Bị"),
                      TextField(
                        controller: null,
                        style:
                            const TextStyle(fontSize: 14, color: Colors.black),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.fromLTRB(6, 6, 6, 6),
                            errorText: null,
                            isCollapsed: true,
                            labelStyle: const TextStyle(
                                color: Color(0xff888888), fontSize: 15)),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LabelWidget(text: "Mô Tả"),
                      TextField(
                        minLines: 4,
                        maxLines: 4,
                        controller: null,
                        style:
                            const TextStyle(fontSize: 14, color: Colors.black),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.fromLTRB(6, 6, 6, 6),
                            errorText: null,
                            isCollapsed: true,
                            labelStyle: const TextStyle(
                                color: Color(0xff888888), fontSize: 15)),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              LabelWidget(text: "Người Đề Xuất"),
                              if (controller.selectedUserRequest.value != null)
                                DropdownButton<UserResponse>(
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                  value: controller.selectedUserRequest.value,
                                  onChanged: (UserResponse? newValue) {
                                    if (newValue != null) {
                                      controller.selectedUserRequest.value =
                                          newValue;
                                    }
                                  },
                                  items: controller.userRequests
                                      .map<DropdownMenuItem<UserResponse>>(
                                    (UserResponse value) {
                                      return DropdownMenuItem<UserResponse>(
                                        value: value,
                                        child: Text(value.fullname.toString()),
                                      );
                                    },
                                  ).toList(),
                                ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              LabelWidget(text: "Người Thụ Hưởng"),
                              if (controller.selectedUserBeneficiaries.value !=
                                  null)
                                DropdownButton<UserResponse>(
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                  value: controller
                                      .selectedUserBeneficiaries.value,
                                  onChanged: (UserResponse? newValue) {
                                    if (newValue != null) {
                                      controller.selectedUserBeneficiaries
                                          .value = newValue;
                                    }
                                  },
                                  items: controller.userRequests
                                      .map<DropdownMenuItem<UserResponse>>(
                                    (UserResponse value) {
                                      return DropdownMenuItem<UserResponse>(
                                        value: value,
                                        child: Text(value.fullname.toString()),
                                      );
                                    },
                                  ).toList(),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LabelWidget(text: "Giá Thành"),
                      TextField(
                        controller: null,
                        style:
                            const TextStyle(fontSize: 14, color: Colors.black),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(6, 6, 6, 6),
                          errorText: null,
                          isCollapsed: true,
                          prefixText: 'VNĐ:',
                          prefixStyle: TextStyle(color: Colors.blue),
                          labelStyle: const TextStyle(
                              color: Color(0xff888888), fontSize: 15),
                        ),
                        keyboardType:
                            TextInputType.number, // Đặt kiểu bàn phím là số
                        inputFormatters: [
                          FilteringTextInputFormatter
                              .digitsOnly, // Chỉ cho phép nhập số
                          LengthLimitingTextInputFormatter(10),
                          ThousandsSeparatorInputFormatter(), // Sử dụng hàm để thêm dấu phân tách
                          ZeroPrefixInputFormatter(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LabelWidget(text: "Hỗ Trợ"),
                      TextField(
                        controller: null,
                        style:
                            const TextStyle(fontSize: 14, color: Colors.black),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.fromLTRB(6, 6, 6, 6),
                            errorText: null,
                            isCollapsed: true,
                            labelStyle: const TextStyle(
                                color: Color(0xff888888), fontSize: 15)),
                      ),
                    ],
                  ),
                ),
              ),
              if (controller.selectedItemStatus.value.code == "3")
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.grey,
                            style: BorderStyle.solid,
                            width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text("Thông Tin Bàn Giao"),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: SizedBox(
                              width: double.infinity,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  LabelWidget(text: "Ngày Mua"),
                                  TextFormField(
                                    readOnly:
                                        true, // Đặt readOnly thành true để không cho phép người dùng chỉnh sửa trực tiếp
                                    controller: TextEditingController(
                                        text: controller
                                                    .selectedBuyDate.value !=
                                                null
                                            ? "${controller.selectedBuyDate.value!.day}/${controller.selectedBuyDate.value!.month}/${controller.selectedBuyDate.value!.year}"
                                            : ''),
                                    onTap: () async {
                                      final DateTime? pickedDate =
                                          await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2101),
                                      );
                                      if (pickedDate != null &&
                                          pickedDate !=
                                              controller
                                                  .selectedBuyDate.value) {
                                        controller.selectBuyDate(pickedDate);
                                      }
                                    },
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.black),
                                    decoration: InputDecoration(
                                      labelText: null,
                                      border: OutlineInputBorder(),
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          Icons.calendar_today,
                                          size: 24,
                                        ),
                                        onPressed: () async {
                                          final DateTime? pickedDate =
                                              await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(2000),
                                            lastDate: DateTime(2101),
                                          );
                                        },
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 10),
                                      errorText: null,
                                      isCollapsed: true,
                                      labelStyle: const TextStyle(
                                          color: Color(0xff888888),
                                          fontSize: 15),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: SizedBox(
                              width: double.infinity,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  LabelWidget(text: "Ngày Bàn Giao"),
                                  TextFormField(
                                    readOnly:
                                        true, // Đặt readOnly thành true để không cho phép người dùng chỉnh sửa trực tiếp
                                    controller: TextEditingController(
                                        text: controller
                                                    .selectedGiveDate.value !=
                                                null
                                            ? "${controller.selectedGiveDate.value!.day}/${controller.selectedGiveDate.value!.month}/${controller.selectedGiveDate.value!.year}"
                                            : ''),
                                    onTap: () async {
                                      final DateTime? pickedDate =
                                          await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2101),
                                      );
                                      if (pickedDate != null &&
                                          pickedDate !=
                                              controller
                                                  .selectedGiveDate.value) {
                                        controller.selectGiveDate(pickedDate);
                                      }
                                    },
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.black),
                                    decoration: InputDecoration(
                                      labelText: null,
                                      border: OutlineInputBorder(),
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          Icons.calendar_today,
                                          size: 24,
                                        ),
                                        onPressed: () async {
                                          final DateTime? pickedDate =
                                              await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(2000),
                                            lastDate: DateTime(2101),
                                          );
                                        },
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 10),
                                      errorText: null,
                                      isCollapsed: true,
                                      labelStyle: const TextStyle(
                                          color: Color(0xff888888),
                                          fontSize: 15),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: SizedBox(
                              width: double.infinity,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  LabelWidget(text: "Mã Biên Bản Bàn Giao"),
                                  TextField(
                                    controller: null,
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.black),
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        contentPadding:
                                            EdgeInsets.fromLTRB(6, 6, 6, 6),
                                        errorText: null,
                                        isCollapsed: true,
                                        labelStyle: const TextStyle(
                                            color: Color(0xff888888),
                                            fontSize: 15)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: SizedBox(
                              width: double.infinity,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  LabelWidget(text: "Ngày Thanh Toán"),
                                  TextFormField(
                                    readOnly:
                                        true, // Đặt readOnly thành true để không cho phép người dùng chỉnh sửa trực tiếp
                                    controller: TextEditingController(
                                        text: controller.selectedPaymentsDate
                                                    .value !=
                                                null
                                            ? "${controller.selectedPaymentsDate.value!.day}/${controller.selectedPaymentsDate.value!.month}/${controller.selectedPaymentsDate.value!.year}"
                                            : ''),
                                    onTap: () async {
                                      final DateTime? pickedDate =
                                          await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2101),
                                      );
                                      if (pickedDate != null &&
                                          pickedDate !=
                                              controller
                                                  .selectedPaymentsDate.value) {
                                        controller
                                            .selectPaymentsDate(pickedDate);
                                      }
                                    },
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.black),
                                    decoration: InputDecoration(
                                      labelText: null,
                                      border: OutlineInputBorder(),
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          Icons.calendar_today,
                                          size: 24,
                                        ),
                                        onPressed: () async {
                                          final DateTime? pickedDate =
                                              await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(2000),
                                            lastDate: DateTime(2101),
                                          );
                                        },
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 10),
                                      errorText: null,
                                      isCollapsed: true,
                                      labelStyle: const TextStyle(
                                          color: Color(0xff888888),
                                          fontSize: 15),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: () => null,
                      child: const Text(
                        "Lưu",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      )),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
