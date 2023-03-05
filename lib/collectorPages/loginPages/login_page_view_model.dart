import 'dart:async';

import 'package:dudhaganga_app/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

import '../../farmerPages/farmer_home_page.dart';
import '../../milk_buyerpages/home_buyer.dart';
import '../home_page.dart';

class LoginPageViewModel extends BaseViewModel {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();
  String? phoneNumber;
  TextEditingController otpEditingController = TextEditingController();
  String? _verificationId;
  int? forceResendingToken;
  bool showOtpScreen = false;
  late StreamController<ErrorAnimationType> errorController;

  String? userType;

  void init(String? userTypeTmp) {
    userType = userTypeTmp;
    print(userType);
    errorController = StreamController<ErrorAnimationType>();
  }

  @override
  void dispose() {
    errorController.close();
    super.dispose();
  }

  void verifyPhoneNumber(BuildContext context) async {
    setBusy(true);
    if (formKey.currentState?.validate() ?? false) {
      notifyListeners();
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
        print(authException.message);
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
    }

    setBusy(false);
    notifyListeners();
  }

  void signInWithPhoneNumber(BuildContext context) async {
    bool error = false;
    User? user;
    AuthCredential credential;

    setBusy(true);
    notifyListeners();
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

      final mainPrefs = await SharedPreferences.getInstance();
      await mainPrefs.setString('user_id', id);
      await mainPrefs.setString(userCn, phoneNumber.toString().substring(3));
      await mainPrefs.setString(userTypeCn, userType.toString());

      // ["Farmer", "Milk Collector", "Milk Buyer"];
      print("Stored  user id: ${phoneNumber.toString().substring(3)}");
      if (context.mounted) {
        if (userType == "Milk Collector") {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => HomePage(userId: id)));
        } else if (userType == "Milk Buyer") {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => BuyerHomePage()));
        } else {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => FarmerHomePage()));
        }
      }
    }

    setBusy(false);
    notifyListeners();
  }
}
