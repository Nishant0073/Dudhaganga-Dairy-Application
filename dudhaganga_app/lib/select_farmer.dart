import 'package:dudhaganga_app/constants.dart';
import 'package:dudhaganga_app/main.dart';
import 'package:flutter/material.dart';

class SelectFarmer extends StatefulWidget {
  SelectFarmer({Key? key}) : super(key: key);

  @override
  State<SelectFarmer> createState() => _SelectFarmerState();
}

class _SelectFarmerState extends State<SelectFarmer> {
  PreferredSizeWidget createAppBar() {
    return AppBar(
      title: const Text('Select Farmer'),
      actions: [
        IconButton(
          icon: useLightMode
              ? const Icon(Icons.wb_sunny_outlined)
              : const Icon(Icons.wb_sunny),
          onPressed: handleThemeChange,
          tooltip: "Toggle brightness",
        ),
      ],
    );
  }

  //handles the theme of the app
  void handleThemeChange() {
    setState(() {
      //changing app theme using stream controller,
      useLightMode = !useLightMode;
      isLightTheme.add(useLightMode);
      themeData = ThemeData(
          colorSchemeSeed: app_base_color,
          useMaterial3: true,
          brightness: useLightMode ? Brightness.light : Brightness.dark);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text('Select Farmer'),
    ));
  }
}
