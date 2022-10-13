import 'package:dudhaganga_app/constants.dart';
import 'package:dudhaganga_app/customWidgets/cElevatedButton.dart';
import 'package:dudhaganga_app/customWidgets/cTextField.dart';
import 'package:dudhaganga_app/home_page.dart';
import 'package:dudhaganga_app/main.dart';
import 'package:flutter/material.dart';

class PasswordScreen extends StatefulWidget {
  PasswordScreen({Key? key}) : super(key: key);

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  //Created AppBar
  PreferredSizeWidget createAppBar() {
    return AppBar(
      title: const Text('Login'),
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
    return LayoutBuilder(
      builder: ((context, constraints) {
        if (constraints.maxWidth < narrowScreenWidthThreshold) {
          return Scaffold(appBar: createAppBar(), body: passwordPage());
        } else {
          return Scaffold(
            appBar: createAppBar(),
            body: SafeArea(
              bottom: false,
              top: false,
              child: passwordPage(),
            ),
          );
        }
      }),
    );
  }

//Actual welcome Page.
  Widget passwordPage() {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Container(
        margin: const EdgeInsets.fromLTRB(24.0, 8.0, 8.0, 24.0),
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
            CTextField(label: 'Enter Password:'),
            const SizedBox(height: 20.0),
            CElevatedButton(
              label: 'Login',
              onPress: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HomePage(
                          userId: '',
                        )));
              },
            ),
          ],
        ),
      ),
    );
  }
}
