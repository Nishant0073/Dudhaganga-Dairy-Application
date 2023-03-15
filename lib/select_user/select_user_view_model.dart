import 'package:dudhaganga_app/collectorPages/loginPages/welcome_screen.dart';
import 'package:dudhaganga_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SelectUserViewModel extends BaseViewModel {
  String? selectedUser;
  List<String> users = <String>["Farmer", "Milk Collector", "Milk Buyer"];
  init(BuildContext context) {}

  void selectUser(value) {
    selectedUser = value;
    notifyListeners();
  }

  void onTap(BuildContext context) {
    print("Selected user: $selectedUser");
    if (selectedUser == "" || selectedUser == null) {
      snackbarService.showSnackbar(message: "Please select user type.");
      return;
    }
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return WelcomeScreen(
          userType: selectedUser,
        );
      },
    ));
  }
}
