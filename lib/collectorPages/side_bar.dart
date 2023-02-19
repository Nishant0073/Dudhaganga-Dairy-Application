import 'package:dudhaganga_app/constants.dart';
import 'package:dudhaganga_app/main.dart';
import 'package:flutter/material.dart';
import 'package:dudhaganga_app/customWidgets/c_card.dart';
import 'package:get/get.dart';

class SideNevigationBar extends StatefulWidget {
  const SideNevigationBar({super.key});

  @override
  State<SideNevigationBar> createState() => _SideNevigationBarState();
}

class _SideNevigationBarState extends State<SideNevigationBar> {
  final List language = [
    {'name': 'ENGLISH', 'locale': const Locale('en', 'US')},
    {'name': 'हिन्दी', 'locale': const Locale('hi', 'IN')},
    {'name': 'मराठी', 'locale': const Locale('mr', 'IN')}
  ];

  final List mode = [
    {'name': 'side_bar_dark_mode'.tr},
    {'name': 'side_bar_light_mode'.tr}
  ];

  updatelanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }

  builddialogForLang(BuildContext context, String textData, List listName) {
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            title: Text(textData),
            content: SizedBox(
              width: double.maxFinite,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                            onTap: () {
                              updatelanguage(language[index]['locale']);
                            },
                            child: Text(listName[index]['name'])));
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      color: Colors.white,
                    );
                  },
                  itemCount: listName.length),
            ),
          );
        });
  }

  //handles the theme of the app
  void handleThemeChange(int index) {
    bool useLightMode = index == 1;
    setState(() {
      //changing app theme using stream controller,
      isLightTheme.add(useLightMode);
      themeData = ThemeData(
          colorSchemeSeed: appBaseColor,
          useMaterial3: true,
          brightness: useLightMode ? Brightness.light : Brightness.dark);
    });
  }

  builddialogForTheme(BuildContext context, String textData, List listName) {
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            title: Text(textData),
            content: SizedBox(
              width: double.maxFinite,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                            onTap: () {
                              handleThemeChange(index);
                              Navigator.pop(context);
                            },
                            child: Text(listName[index]['name'])));
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      color: Colors.white,
                    );
                  },
                  itemCount: listName.length),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return HomeCard(
      child: Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildHeader(context),
              buildMenueItems(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) => Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
      );

  Widget buildMenueItems(BuildContext context) => Wrap(
        runSpacing: 16,
        children: [
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: Text('side_bar_home'.tr),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: Text('side_bar_language'.tr),
            onTap: () {
              builddialogForLang(
                  context, 'side_bar_choose_language'.tr, language);
            },
          ),
          ListTile(
            leading: const Icon(Icons.edit),
            title: Text("side_bar_profile".tr),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.change_circle_outlined),
            title: Text("side_bar_theme".tr),
            onTap: () {
              builddialogForTheme(context, 'side_bar_choose_theme'.tr, mode);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: Text('side_bar_logout'.tr),
            onTap: () {},
          )
        ],
      );
}
