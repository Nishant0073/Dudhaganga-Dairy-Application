import 'package:dudhaganga_app/constants.dart';
import 'package:dudhaganga_app/customeWidgets/cElevatedButton.dart';
import 'package:dudhaganga_app/main.dart';
import 'package:flutter/material.dart';

import 'customeWidgets/cTextField.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  PreferredSizeWidget createAppBar() {
    return AppBar(
      title: Text(appName),
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
    return LayoutBuilder(
      builder: ((context, constraints) {
        if (constraints.maxWidth < narrowScreenWidthThreshold) {
          return Scaffold(appBar: createAppBar(), body: welcomePage());
        } else {
          return Scaffold(
            appBar: createAppBar(),
            body: SafeArea(
              bottom: false,
              top: false,
              child: welcomePage(),
            ),
          );
        }
      }),
    );
  }

  Widget welcomePage() {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Container(
        margin: EdgeInsets.fromLTRB(24.0, 8.0, 8.0, 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(16.0),
              child: Image.asset(
                'assets/images/DGLogo.png',
                width: 164.0,
              ),
            ),

            //used custom widgets
            CTextField(label: 'Enter Email ID:'),
            const SizedBox(height: 20.0),
            CElevatedButton(label: 'Login'),
          ],
        ),
      ),
    );
  }
}
