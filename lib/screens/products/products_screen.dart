import 'package:flutter/material.dart';
import 'package:fruit_store/components/custom_drawer.dart';
import 'package:fruit_store/components/product_list_tile.dart';
import 'package:fruit_store/components/search_dialog.dart';
import 'package:fruit_store/models/product.dart';
import 'package:fruit_store/models/product_manager.dart';
import 'package:fruit_store/utils/custom_colors.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key, this.product}) : super(key: key);

  final Product? product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: CustomDrawer(),
      appBar: AppBar(
        title: const Text('Produtos'),
        centerTitle: true,
        actions: [
          Consumer<ProductManager>(
            builder: (_, productManager, __) {
              if (productManager.search.isEmpty) {
                return IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () async {
                    final search = await showDialog<String>(
                        context: context, builder: (_) => const SearchDialog());
                    if (search != null) {
                      productManager.search = search;
                    }
                  },
                );
              } else {
                return IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () async {
                    productManager.search = '';
                  },
                );
              }
            },
          )
        ],
      ),
      body: Consumer<ProductManager>(
        builder: (_, productManager, __) {
          final filterProducts = productManager.filterProducts;
          return ListView.builder(
            itemCount: filterProducts.length,
            itemBuilder: (_, index) {
              return ProductListTile(
                product: filterProducts[index],
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: CColors.primary,
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.of(context).pushNamed('/cart');
        },
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}
