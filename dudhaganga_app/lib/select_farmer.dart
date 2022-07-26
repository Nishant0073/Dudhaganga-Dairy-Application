import 'package:dudhaganga_app/constants.dart';
import 'package:dudhaganga_app/main.dart';
import 'package:dudhaganga_app/milk_reading.dart';
import 'package:flutter/material.dart';
import 'package:dudhaganga_app/customWidgets/cCard.dart';
import 'package:get/get.dart';

class SelectFarmer extends StatefulWidget {
  SelectFarmer({Key? key}) : super(key: key);

  @override
  State<SelectFarmer> createState() => _SelectFarmerState();
}

class _SelectFarmerState extends State<SelectFarmer> {
  PreferredSizeWidget createAppBar() {
    return AppBar(
      title: Text('select_farmer'.tr),
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
        title: Text('select_farmer'.tr),
      ),
      body: buildListView(context),
    );
  }

  ListView buildListView(BuildContext context) {
    return ListView.builder(
      itemCount: 15,
      itemBuilder: (_, index) {
        return cCard(
            child: ListTile(
          title: Text('select_farmer_name'.tr),
          subtitle: Text('9089763456'),
          leading: Icon(Icons.person),
          trailing: IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MilkReading(index)));
              }),
        ));
      },
    );
  }
}
