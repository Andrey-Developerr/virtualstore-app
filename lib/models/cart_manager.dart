import 'package:flutter/cupertino.dart';
import 'package:fruit_store/models/cart_product.dart';
import 'package:fruit_store/models/product.dart';
import 'package:fruit_store/models/user_login.dart';
import 'package:fruit_store/models/user_manager.dart';

class CartManager extends ChangeNotifier {
  List<CartProduct> itens = [];

  UserLogin? user;
  num productsPrice = 0.0;

  void updateUser(UserManager userManager) {}

  void addToCart(Product product) {
    try {
      final e = itens.firstWhere((p) => p.stackable(product));
      e.increment();
    } catch (e) {
      final cartProduct = CartProduct.fromProduct(product);

      itens.add(cartProduct);
      _onItemUpdated();
    }
  }

  void removeOfCart(CartProduct cartProduct) {
    itens.removeWhere((e) => e.productId == cartProduct.productId);
    cartProduct.removeListener(_onItemUpdated);
    notifyListeners();
  }

  void _onItemUpdated() {
    productsPrice = 0.0;

    for (int i = 0; i < itens.length; i++) {
      final cartProduct = itens[i];

      if (cartProduct.quantity == 0) {
        removeOfCart(cartProduct);
        i--;
        continue;
      }

      // productsPrice += cartProduct.totalPrice;

    }
  }
}
