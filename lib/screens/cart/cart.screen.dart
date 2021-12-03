import 'package:flutter/material.dart';
import 'package:fruit_store/models/cart_manager.dart';
import 'package:fruit_store/models/cart_product.dart';
import 'package:fruit_store/screens/cart/components/cart_tile.dart';
import 'package:fruit_store/utils/custom_colors.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho de Compras'),
        centerTitle: true,
      ),
      body: Consumer<CartManager>(
        builder: (_, cartManager, __) {
          return Column(
            children: cartManager.itens
                .map((cartProduct) => CartTile(
                      cartProduct: cartProduct,
                    ))
                .toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        foregroundColor: CColors.primary,
        onPressed: () {
          Navigator.of(context).pushNamed('/checkout');
        },
        child: Icon(Icons.document_scanner_rounded),
      ),
    );
  }
}
