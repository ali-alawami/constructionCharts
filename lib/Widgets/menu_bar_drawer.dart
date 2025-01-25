import 'package:constructioncharts/extension/extension_image.dart' as img;
import 'package:constructioncharts/helpers/setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../account.dart';
import '../helpers/theme_app.dart';

class MenuBarDrawer extends StatefulWidget {
  const MenuBarDrawer({super.key});
  @override
  State<MenuBarDrawer> createState() => _MenuBarDrawer();
}

class _MenuBarDrawer extends State<MenuBarDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage("logo2".png),
                fit: BoxFit.fill,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  bottom: 8.0,
                  right: 4.0,
                  child: Text(
                    '', // 'شركة أزاد للحلول التِقَنية',
                    style:
                        ThemeApp.styleSelected(color: Colors.white, size: 16.0),
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: Setting.account.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () => Get.to(Account(
                              accountName: Setting.account[index],
                            )),
                        child: ListTile(
                          title: Text(
                            Setting.account[index],
                            style: ThemeApp.styleSelected(
                                color: Colors.black, size: 16.0),
                          ),
                        ));
                    //  const Divider(color: Colors.black, endIndent: 5, indent: 5);
                  }))
        ],
      ),
    );
  }
}
