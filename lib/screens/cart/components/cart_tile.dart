import 'package:flutter/material.dart';
import 'package:fruit_store/components/custom_icon_button.dart';

import 'package:fruit_store/models/cart_product.dart';
import 'package:provider/provider.dart';

class CartTile extends StatelessWidget {
  const CartTile({Key? key, required this.cartProduct}) : super(key: key);

  final CartProduct cartProduct;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: cartProduct,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          child: Row(
            children: [
              SizedBox(
                height: 80,
                width: 80,
                child: Image.network(cartProduct.product!.image!),
              ),
              // ignore: prefer_const_constructors
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cartProduct.product!.name!,
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 25,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          'R\$' + cartProduct.product!.price!,
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 18,
                              fontWeight: FontWeight.w800),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Consumer<CartProduct>(
                builder: (_, cartProduct, __) {
                  return Column(children: [
                    CustomIconButton(
                      iconData: Icons.add,
                      color: Theme.of(context).primaryColor,
                      onTap: cartProduct.increment,
                    ),
                    Text(
                      '${cartProduct.quantity}',
                      style: TextStyle(fontSize: 20),
                    ),
                    CustomIconButton(
                      iconData: Icons.remove,
                      color: cartProduct.quantity > 1
                          ? Theme.of(context).primaryColor
                          : Colors.red,
                      onTap: cartProduct.decrement,
                    ),
                  ]);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
