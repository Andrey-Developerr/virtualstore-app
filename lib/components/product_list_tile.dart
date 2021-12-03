// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fruit_store/models/cart_manager.dart';
import 'package:fruit_store/models/product.dart';
import 'package:provider/src/provider.dart';

class ProductListTile extends StatelessWidget {
  const ProductListTile({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        child: Container(
          height: 160,
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Image.network(product.image!),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      product.name!,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        'A partir de',
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Text(
                      'R\$ ' + product.price!,
                      style: const TextStyle(
                          fontSize: 25,
                          color: Colors.blue,
                          fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<CartManager>().addToCart(product);
                  Navigator.of(context).pushNamed('/cart');
                },
                style: ElevatedButton.styleFrom(primary: Colors.green),
                child: Wrap(
                  children: [
                    Icon(
                      Icons.monetization_on_outlined,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
