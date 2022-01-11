import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intesasoft_demo/app/components/search_bar.dart';
import 'package:intesasoft_demo/app/extensions/context/context_extensions_shelf.dart';
import 'package:intesasoft_demo/shared/app_colors.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: context.mediumSymmetric,
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: context.bottomLowMed,
                  child: AutoSizeText(
                    "Ahmet Aydın",
                    style: context.headline3.copyWith(color: customRed),
                  ),
                ),
              ],
            ),
            Padding(
              padding: context.bottomMedium,
              child: SearchBar(
                onChanged: (c) {},
                hintTextKey: "Ara",
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: drawerListItemName.length,
                  itemBuilder: (context, index) {
                    return DrawerListItem(
                        name: drawerListItemName[index],
                        icon: drawerListIconData[index]);
                  }),
            )
          ],
        ),
      ),
    );
  }
}

List<String> drawerListItemName = [
  "Ana Ekran",
  "Profilim",
  "Davet Et",
  "Şehir Listesi",
  "Ülkeler",
  "Ayarlar",
  "Çıkış"
];

List<IconData> drawerListIconData = [
  Icons.dashboard,
  Icons.camera_front_rounded,
  Icons.person_add,
  Icons.list_alt_sharp,
  Icons.album_outlined,
  Icons.settings,
  Icons.exit_to_app
];

class DrawerListItem extends StatelessWidget {
  final String name;
  final IconData icon;
  const DrawerListItem({
    Key? key,
    required this.name,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: context.lowMedEdgeInsets,
        child: Row(
          children: [
            Padding(
              padding: context.leftLowMed,
              child: Icon(
                icon,
                color: textColor,
              ),
            ),
            Padding(
              padding: context.horizontalLowMed,
              child: AutoSizeText(
                name,
                style: context.headline5.copyWith(color: textColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
