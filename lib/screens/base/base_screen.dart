// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fruit_store/components/custom_drawer.dart';
import 'package:fruit_store/models/page_manager.dart';
import 'package:fruit_store/screens/login/login_screen.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatelessWidget {
  final PageController pageController = PageController();
  BaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => PageManager(pageController),
      child: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          LoginScreen(),
          Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(
              title: const Text("Home"),
            ),
          ),
          Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(
              title: const Text("Produtos"),
            ),
          ),
          Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(
              title: const Text("Meus pedidos"),
            ),
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.red,
          )
        ],
      ),
    );
  }
}
