import 'package:flutter/material.dart';
import 'package:fruit_store/components/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const CustomDrawer(),
        appBar: AppBar(
          title: const Text('Produtos'),
          centerTitle: true,
        ));
  }
}
