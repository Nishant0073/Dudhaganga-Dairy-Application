import 'package:dudhaganga_app/customWidgets/c_elevated_button.dart';
import 'package:dudhaganga_app/customWidgets/c_text_field.dart';
import 'package:dudhaganga_app/milk_buyerpages/home_buyer.dart';
import 'package:dudhaganga_app/main.dart';
import 'package:dudhaganga_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);
  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  PreferredSizeWidget createAppBar() {
    return AppBar(
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
          colorSchemeSeed: appBaseColor,
          useMaterial3: true,
          brightness: useLightMode ? Brightness.light : Brightness.dark);
    });
  }

  late String password;
  late String phoneNumber;
  //bool _passwordVisible = false;

  @override
  void initState() {
    setState(() {});

    //_passwordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //TextEditingController PhoneController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        // decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/login.png"))),
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 35, right: 35),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/DGLogo.png',
                          width: 164.0,
                        ),
                        const SizedBox(
                          height: 40, //<-- SEE HERE
                        ),
                        CTextField(
                          label: 'Enter Phone number'.tr,
                          hintText: 'Eg. 9192939495',
                          onChange: (value) {
                            phoneNumber = value;
                          },
                          validator: (String? value) {
                            String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                            RegExp regExp = RegExp(pattern);
                            if (value == null) {
                              return 'Please enter mobile number';
                            } else if (!regExp.hasMatch(value) ||
                                value.length != 10) {
                              return "phone_no".tr;
                            }
                            return null;
                          },
                          onSave: (value) {
                            phoneNumber = value;
                          },
                        ),
                        const SizedBox(height: 40.0),
                        CTextField(
                          label: "Password".tr,
                          validatorText: "Password".tr,
                          hintText: 'Password'.tr,
                          onChange: (value) {
                            password = value;
                          },
                          onSave: (value) {
                            password = value;
                          },
                        ),
                        const SizedBox(height: 20.0),
                        CElevatedButton(
                          label: 'Register',
                          onPress: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const BuyerHomePage()));
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
