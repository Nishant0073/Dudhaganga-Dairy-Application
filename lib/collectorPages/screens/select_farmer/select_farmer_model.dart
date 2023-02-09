import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stacked/stacked.dart';

import '../../../farmer.dart';

//all functions releted to SelectFarmer is in this file.

class SelectFarmerModel extends BaseViewModel {
  List<Farmer> farmers = [];
  init() {
    listAllFarmers();
  }

  Future<void> listAllFarmers() async {
    setBusy(true);
    String path = "/Dairy/Dudhaganga/Farmers/";
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection(path).get();
    var list = querySnapshot.docs;
    for (var it in list) {
      Farmer fmr = Farmer(
        buffalo: it["buffalo"],
        name: it["name"],
        phoneNumber: it["phoneNumber"].toString(),
        cow: it["cow"],
        evening: it["evening"],
        morning: it["morning"],
      );
      farmers.add(fmr);
    }
    setBusy(false);
    notifyListeners();
  }
}

class Firestore {}
