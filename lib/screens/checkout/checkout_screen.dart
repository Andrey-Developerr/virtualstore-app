import 'package:flutter/material.dart';
import 'package:fruit_store/models/cart_manager.dart';
import 'package:provider/src/provider.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartManager = context.watch<CartManager>();
    final productsPrice = cartManager.productsPrice;

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: 400,
        child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      const Text(
                        'Resumo do Pedido',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const Text('Subtotal'),
                          const Text('R\$ 25,00')
                          // Text('R\$ ${productsPrice.toStringAsFixed(2)}')
                        ],
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const Text(
                            'Total',
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                          Text(
                            'R\$ 50,00',
                            // 'R\$ ${productsPrice.toStringAsFixed(2)}',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 16,
                            ),
                          )
                        ],
                      )
                    ]))),
      ),
    );
  }
}
