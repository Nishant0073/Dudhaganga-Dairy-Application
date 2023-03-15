import 'dart:async';

import 'package:dudhaganga_app/constants.dart';
import 'package:dudhaganga_app/customWidgets/c_elevated_button.dart';
import 'package:dudhaganga_app/customWidgets/ddd_loading.dart';
import 'package:dudhaganga_app/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stacked/stacked.dart';

import 'login_page_view_model.dart';

class WelcomeScreen extends StatefulWidget {
  final String? userType;
  const WelcomeScreen({this.userType, Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginPageViewModel>.reactive(
        viewModelBuilder: () => LoginPageViewModel(),
        onViewModelReady: (model) => model.init(widget.userType),
        builder: (context, model, child) => _body(context, model));
  }

  Padding signInScreen(BuildContext context, LoginPageViewModel model) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      child: Form(
        key: model.formKey,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InternationalPhoneNumberInput(
              onInputChanged: (PhoneNumber number) {
                model.phoneNumber = number.phoneNumber;
              },
              onInputValidated: (bool value) {
                if (kDebugMode) {
                  print(value);
                }
              },
              selectorConfig: const SelectorConfig(
                selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
              ),
              spaceBetweenSelectorAndTextField: 0,
              ignoreBlank: false,
              // autoValidateMode: AutovalidateMode.disabled,
              selectorTextStyle: const TextStyle(color: Colors.black),
              initialValue: PhoneNumber(isoCode: 'IN'),
              formatInput: true,

              keyboardType: const TextInputType.numberWithOptions(
                  signed: true, decimal: true),
              inputBorder: const OutlineInputBorder(),
            ),
            const SizedBox(
              height: 55,
            ),
            CElevatedButton(
                label: "Get OTP",
                onPress: () => model.verifyPhoneNumber(context)),
          ],
        ),
      ),
    );
  }

  SingleChildScrollView otpScreen(
      BuildContext context, LoginPageViewModel model) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
        child: Form(
          key: model.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  "Enter OTP",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 22.0,
                    letterSpacing: 1.05,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              AbsorbPointer(
                child: PinCodeTextField(
                  onSubmitted: (value) {
                    if (value.length != 6) {
                      Fluttertoast.showToast(msg: "Enter Complete OTP");
                      Future.delayed(const Duration(seconds: 2));
                    }
                  },
                  enableActiveFill: true,
                  autoDisposeControllers: false,
                  autoDismissKeyboard: false,
                  keyboardType: TextInputType.number,
                  appContext: context,
                  length: 6,
                  autoFocus: true,
                  obscureText: false,
                  hintCharacter: '0',
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(8),
                    borderWidth: 0,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  controller: model.otpEditingController,
                  onCompleted: (v) {
                    if (kDebugMode) {
                      print("Completed");
                    }
                  },
                  onChanged: (value) {},
                  beforeTextPaste: (text) {
                    // ignore: avoid_print
                    print("Allowing to paste $text");
                    return true;
                  },
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: () => model.verifyPhoneNumber(context),
                  child: const Text(
                    'Resend OTP?',
                    style: TextStyle(
                      fontSize: 15,
                      letterSpacing: 0.688,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: CElevatedButton(
                  label: "OK",
                  onPress: () {
                    if (model.otpEditingController.text.length == 6) {
                      model.signInWithPhoneNumber(context);
                    } else if (model.otpEditingController.text.length < 6) {
                      Fluttertoast.showToast(msg: "Enter complete otp");
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //Created AppBar
  PreferredSizeWidget createAppBar() {
    return AppBar(
      title: const Text("Dudhaganga Dairy"),
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

  Widget _body(BuildContext context, LoginPageViewModel model) {
    return Scaffold(
      appBar: createAppBar(),
      body: SafeArea(
        bottom: false,
        top: false,
        child: Stack(
          children: [
            welcomePage(context, model),
            DDLoader(
              loading: model.isOTPsending,
            ),
          ],
        ),
      ),
    );
  }

//Actual welcome Page.
  Widget welcomePage(BuildContext context, LoginPageViewModel model) {
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
            const SizedBox(
              height: 40.0,
            ),
            WillPopScope(
              onWillPop: () {
                setState(() {
                  model.showOtpScreen = false;
                });
                return Future.value(true);
              },
              child: model.showOtpScreen
                  ? model.otpScreen(context, model)
                  : signInScreen(context, model),
            ),
          ],
        ),
      ),
    );
  }
}
