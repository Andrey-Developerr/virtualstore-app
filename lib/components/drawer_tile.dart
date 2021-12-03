import 'package:flutter/material.dart';
import 'package:fruit_store/models/page_manager.dart';
import 'package:fruit_store/utils/custom_colors.dart';
import 'package:provider/provider.dart';

class DrawerTile extends StatelessWidget {
  final IconData iconData;
  final String title;
  final int page;
  const DrawerTile(
      {Key? key,
      required this.iconData,
      required this.title,
      required this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int currentPage = context.read<PageManager>().page;

    return InkWell(
      onTap: () {
        context.read<PageManager>().setPage(page);
      },
      child: SizedBox(
        height: 60,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Icon(
                iconData,
                size: 30,
                color: currentPage == page ? CColors.primary : Colors.grey,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: currentPage == page ? CColors.primary : Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
