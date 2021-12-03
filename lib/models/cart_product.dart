import 'package:flutter/cupertino.dart';
import 'package:fruit_store/models/product.dart';

class CartProduct extends ChangeNotifier {
  CartProduct.fromProduct(this.product) {
    productId = product!.id;
    quantity = 1;
  }

  String? productId;
  late int quantity;

  Product? product;

  bool stackable(Product product) {
    return product.id == productId;
  }

  get unitPrice {
    return product?.price ?? 0;
  }

  get totalPrice => unitPrice * quantity;

  void increment() {
    quantity++;
    notifyListeners();
  }

  void decrement() {
    quantity--;
    notifyListeners();
  }
}
