import 'package:cloud_firestore/cloud_firestore.dart';

Future<double> getFarmerPendingAmount(String phoneNumber) async {
  // /Dairy/Dudhaganga/Milk_Buyer/8329060009/finance/amount/
  String path = "/Dairy/Dudhaganga/Farmers/$phoneNumber/finance/";
  try {
    final snapShot =
        await FirebaseFirestore.instance.collection(path).doc("amount").get();
    if (snapShot.exists) {
      print(snapShot.data());
      return snapShot["balance"].toDouble();
    }
  } catch (e) {
    print("getMilkRecordsOfEachFarmer() $e");
  }

  return 0;
}

Future<double> getMilkBuyerPendingAmount(String phoneNumber) async {
  String path = "/Dairy/Dudhaganga/Milk_Buyer/$phoneNumber/finance/";
  print("PATH $path");
  try {
    final snapShot =
        await FirebaseFirestore.instance.collection(path).doc("amount").get();
    if (snapShot.exists) {
      print(snapShot.data());
      print("HERE");
      return snapShot["balance"];
    }
  } catch (e) {
    print("getMilkBuyerPendingAmount() $e");
  }
  return 0;
}
