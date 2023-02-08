import 'package:dudhaganga_app/constants.dart';
import 'package:dudhaganga_app/main.dart';
import 'package:flutter/material.dart';

import '../../customWidgets/c_elevated_button.dart';
import '../../customWidgets/c_text_field.dart';
import '../home_page.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  PreferredSizeWidget createAppBar() {
    return AppBar(
      title: const Text('Register'),
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
          colorSchemeSeed: appBaseColor,
          useMaterial3: true,
          brightness: useLightMode ? Brightness.light : Brightness.dark);
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        if (constraints.maxWidth < narrowScreenWidthThreshold) {
          return Scaffold(appBar: createAppBar(), body: registrationPage());
        } else {
          return Scaffold(
            appBar: createAppBar(),
            body: SafeArea(
              bottom: false,
              top: false,
              child: registrationPage(),
            ),
          );
        }
      }),
    );
  }

//Actual welcome Page.
  Widget registrationPage() {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
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
            const CTextField(
              label: 'Name',
              hintText: 'Enter your name here...',
            ),
            const SizedBox(height: 20.0),
            const CTextField(
              label: 'Address',
              hintText: 'Enter your address here...',
            ),
            const SizedBox(height: 20.0),
            const CTextField(
              label: 'Password',
              hintText: 'Enter your password here...',
            ),
            const SizedBox(height: 20.0),
            CElevatedButton(
              label: 'Register',
              onPress: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const HomePage(
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
