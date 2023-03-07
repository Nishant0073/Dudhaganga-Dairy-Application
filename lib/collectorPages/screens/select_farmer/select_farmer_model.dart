import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

import '../../../constants.dart';
import '../../../models/farmer.dart';

//all functions releted to SelectFarmer is in this file.

class SelectFarmerModel extends BaseViewModel {
  List<Farmer> farmers = [];
  String? userPhoneNumber;
  init() async {
    listAllFarmers();
    userPhoneNumber = await getUserPhoneNumber();
    print("User contact number: $userPhoneNumber");
  }

  Future<void> listAllFarmers() async {
    setBusy(true);
    String path = "/Dairy/Dudhaganga/Farmers/";
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection(path).get();
    var list = querySnapshot.docs;
    for (var it in list) {
      Farmer fmr = Farmer(
        buffalo: it.get("buffalo") ?? "",
        name: it["name"],
        phoneNumber: it.data().toString().contains('phoneNumber')
            ? it.get("phoneNumber")
            : "0000000000",
        cow: it["cow"],
        evening: it["evening"],
        morning: it["morning"],
      );
      farmers.add(fmr);
    }
    //this is to set false loading screen.
    setBusy(false);
    notifyListeners();
  }

  Future<String?> getUserPhoneNumber() async {
    final mainPrefs = await SharedPreferences.getInstance();
    String? cn = mainPrefs.getString(userCn);
    return cn;
  }
}

class Firestore {}
