import 'package:flutter/material.dart';
import 'package:fruit_store/components/custom_drawer_header.dart';
import 'package:fruit_store/components/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          CustomDrawerHeader(),
          const DrawerTile(
            iconData: Icons.home,
            title: "Início",
            page: 2,
          ),
          const DrawerTile(
            iconData: Icons.list,
            title: "Produtos",
            page: 3,
          ),
          const DrawerTile(
            iconData: Icons.playlist_add_check,
            title: "Meus Pedidos",
            page: 4,
          ),
        ],
      ),
    );
  }
}
