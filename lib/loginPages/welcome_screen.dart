 import 'dart:async';

import 'package:dudhaganga_app/constants.dart';
import 'package:dudhaganga_app/customWidgets/c_elevated_button.dart';
import 'package:dudhaganga_app/home_page.dart';
import 'package:dudhaganga_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  String? phoneNumber;
  TextEditingController otpEditingController = TextEditingController();
  String? _verificationId;
  int? forceResendingToken;
  bool showOtpScreen = false;
  late StreamController<ErrorAnimationType> errorController;
  bool loading = false;

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();
    super.dispose();
  }

  void verifyPhoneNumber() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        loading = true;
      });
      verificationCompleted(PhoneAuthCredential phoneAuthCredential) async {
        User? user;
        bool error = false;
        try {
          user = (await firebaseAuth.signInWithCredential(phoneAuthCredential))
              .user!;
        } catch (e) {
          if (kDebugMode) {
            print("Failed to sign in: $e");
          }
          error = true;
        }
        if (!error && user != null) {
          String id = user.uid;
          final mainPrefs = await SharedPreferences.getInstance();
          await mainPrefs.setString('user_id', id);
          //here you can store user data in backend
          // ignore: use_build_context_synchronously
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => HomePage(userId: id)));
        }
      }

      verificationFailed(FirebaseAuthException authException) {
        Fluttertoast.showToast(msg: authException.message!);
      }

      codeSent(String? verificationId, [int? forceResendingToken]) async {
        Fluttertoast.showToast(
            msg: 'Please check your phone for the verification code.');
        this.forceResendingToken = forceResendingToken;
        _verificationId = verificationId;
      }

      codeAutoRetrievalTimeout(String verificationId) {
        _verificationId = verificationId;
      }

      try {
        await firebaseAuth.verifyPhoneNumber(
            phoneNumber: phoneNumber!,
            timeout: const Duration(seconds: 5),
            forceResendingToken: forceResendingToken,
            verificationCompleted: verificationCompleted,
            verificationFailed: verificationFailed,
            codeSent: codeSent,
            codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
        showOtpScreen = true;
      } catch (e) {
        Fluttertoast.showToast(msg: "Failed to Verify Phone Number: $e");
        showOtpScreen = false;
      }
      setState(() {
        loading = false;
      });
    }
  }

  void signInWithPhoneNumber() async {
    bool error = false;
    User? user;
    AuthCredential credential;
    setState(() {
      loading = true;
    });
    try {
      credential = PhoneAuthProvider.credential(
        verificationId: _verificationId ?? "",
        smsCode: otpEditingController.text,
      );
      user = (await firebaseAuth.signInWithCredential(credential)).user;
    } catch (e) {
      Fluttertoast.showToast(msg: "Failed to sign in: $e");
      error = true;
    }
    if (!error && user != null) {
      String id = user.uid;
      //here you can store user data in backend
      // ignore: use_build_context_synchronously

      final mainPrefs = await SharedPreferences.getInstance();
      await mainPrefs.setString('user_id', id);
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => HomePage(userId: id)));
    }
    setState(() {
      loading = false;
    });
  }

  Padding signInScreen() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InternationalPhoneNumberInput(
              onInputChanged: (PhoneNumber number) {
                phoneNumber = number.phoneNumber;
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
                label: "Get OTP", onPress: () => verifyPhoneNumber()),
          ],
        ),
      ),
    );
  }

  SingleChildScrollView otpScreen() {
    FocusNode focusNode = FocusNode();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
        child: Form(
          key: _formKey,
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
                    focusNode.requestFocus();
                  },
                  onTap: () {
                    focusNode.requestFocus();
                  },
                  focusNode: focusNode,
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
                    // fieldHeight: 50,
                    // fieldWidth: 40,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  controller: otpEditingController,
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
                  onTap: () => verifyPhoneNumber(),
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
                    if (otpEditingController.text.length == 6) {
                      signInWithPhoneNumber();
                    } else if (otpEditingController.text.length < 6) {
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

//Actual welcome Page.
  Widget welcomePage() {
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
                  showOtpScreen = false;
                });
                return Future.value(true);
              },
              child: Stack(
                children: [
                  showOtpScreen ? otpScreen() : signInScreen(),
                  loading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
