import 'package:flutter/material.dart';
import 'package:front_end_mobile_20240117/features/controller/home_controller.dart';
import 'package:front_end_mobile_20240117/routes/routes.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Danh Sách Thiết Bị",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(AppRoutes.DETAIL_PAGE);
          },
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: controller.cartItems.length,
          itemBuilder: (BuildContext context, int index) {
            final cartItem = controller.cartItems[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: Card(
                child: ListTile(
                  title: Text(cartItem.product.name),
                  subtitle: Text('\$${cartItem.product.price.toStringAsFixed(2)}'),
                  trailing: Text('Quantity: ${cartItem.quantity.toString()}'),
                ),
              ),
            );
          },
        ));
  }
}
