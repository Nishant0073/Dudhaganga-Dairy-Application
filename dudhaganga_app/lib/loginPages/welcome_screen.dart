import 'dart:async';

import 'package:dudhaganga_app/constants.dart';
import 'package:dudhaganga_app/customWidgets/cElevatedButton.dart';
import 'package:dudhaganga_app/home_page.dart';
import 'package:dudhaganga_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

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
    if (_formKey.currentState!.validate()) {
      setState(() {
        loading = true;
      });
      PhoneVerificationCompleted verificationCompleted =
          (PhoneAuthCredential phoneAuthCredential) async {
        User? user;
        bool error = false;
        try {
          user = (await firebaseAuth.signInWithCredential(phoneAuthCredential))
              .user!;
        } catch (e) {
          print("Failed to sign in: " + e.toString());
          error = true;
        }
        if (!error && user != null) {
          String id = user.uid;
          //here you can store user data in backend
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => HomePage(userId: id)));
        }
      };

      PhoneVerificationFailed verificationFailed =
          (FirebaseAuthException authException) {
        Fluttertoast.showToast(msg: authException.message!);
      };
      PhoneCodeSent codeSent =
          (String? verificationId, [int? forceResendingToken]) async {
        Fluttertoast.showToast(
            msg: 'Please check your phone for the verification code.');
        this.forceResendingToken = forceResendingToken;
        _verificationId = verificationId;
      };
      PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
          (String verificationId) {
        _verificationId = verificationId;
      };
      try {
        await firebaseAuth.verifyPhoneNumber(
            phoneNumber: phoneNumber!,
            timeout: const Duration(seconds: 5),
            forceResendingToken:
                forceResendingToken != null ? forceResendingToken : null,
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
        verificationId: _verificationId!,
        smsCode: otpEditingController.text,
      );
      user = (await firebaseAuth.signInWithCredential(credential)).user!;
    } catch (e) {
      Fluttertoast.showToast(msg: "Failed to sign in: " + e.toString());
      error = true;
    }
    if (!error && user != null && user.uid != null) {
      String id = user.uid;
      //here you can store user data in backend
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => HomePage(userId: id)));
    }
    setState(() {
      loading = false;
    });
  }

  Padding signInScreen() {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
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
                print(value);
              },
              selectorConfig: SelectorConfig(
                selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
              ),
              spaceBetweenSelectorAndTextField: 0,
              ignoreBlank: false,
              // autoValidateMode: AutovalidateMode.disabled,
              // selectorTextStyle: TextStyle(color: Colors.black),
              initialValue: PhoneNumber(isoCode: 'IN'),
              formatInput: false,
              keyboardType:
                  TextInputType.numberWithOptions(signed: true, decimal: true),
              inputBorder: OutlineInputBorder(),
            ),
            SizedBox(
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
    FocusNode _focusNode = FocusNode();
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Enter OTP",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 22.0,
                    letterSpacing: 1.05,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              AbsorbPointer(
                child: PinCodeTextField(
                  onSubmitted: (value) {
                    if (value.length != 6) {
                      Fluttertoast.showToast(msg: "Enter Complete OTP");
                      Future.delayed(const Duration(seconds: 2));
                    }
                    _focusNode.requestFocus();
                  },
                  onTap: () {
                    _focusNode.requestFocus();
                  },
                  focusNode: _focusNode,
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
                  animationDuration: Duration(milliseconds: 300),
                  controller: otpEditingController,
                  onCompleted: (v) {
                    print("Completed");
                  },
                  onChanged: (value) {
                    print(value);
                  },
                  beforeTextPaste: (text) {
                    print("Allowing to paste $text");
                    return true;
                  },
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: () => verifyPhoneNumber(),
                  child: Container(
                    child: Text(
                      'Resend OTP?',
                      style: TextStyle(
                        fontSize: 15,
                        letterSpacing: 0.688,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
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
      title: const Text(appName),
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

  String? phone_number = null;

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
        child: Container(
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
              SizedBox(
                height: 40.0,
              ),
              Stack(
                children: [
                  showOtpScreen ? otpScreen() : signInScreen(),
                  loading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Container(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
