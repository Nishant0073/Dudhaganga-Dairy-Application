import 'package:cloud_firestore/cloud_firestore.dart';

Future<double> getFarmerPendingAmount(String phoneNumber) async {
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

  return -1;
}
