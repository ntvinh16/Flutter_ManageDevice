import 'package:front_end_mobile_20240117/core/base_controller.dart';

class Product {
  final String name;
  final double price;

  Product(this.name, this.price);
}

class CartItem {
  final Product product;
  final int quantity;

  CartItem(this.product, this.quantity);
}

class HomeController extends BaseController {

final List<CartItem> cartItems = [
    CartItem(Product('Product 1', 10.0), 2),
    CartItem(Product('Product 2', 20.0), 1),
    CartItem(Product('Product 3', 30.0), 3),
  ];
  
}
