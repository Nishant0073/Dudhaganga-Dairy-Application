import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dudhaganga_app/constants.dart';
import 'package:dudhaganga_app/services/sms.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../models/milk_buyer.dart';

Future<double> getMilkRate(String phoneNumber) async {
  String path = "/Dairy/";
  print(path);
  try {
    final snapShot = await FirebaseFirestore.instance
        .collection(path)
        .doc("Dudhaganga")
        .get();
    if (snapShot.exists) {
      print(snapShot.data());
      double mrate = double.parse(snapShot["mb_rate"].toString());
      return mrate;
    }
  } catch (e) {
    print("ERROR: getMilkRate: $e");
  }
  return 0;
}

Future<bool> updateMilkRate(String value) async {
  String path = "/Dairy/";
  print(path);

  try {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection(path);
    await collectionReference.doc("Dudhaganga").set(
      {
        "mb_rate": value,
      },
    );
    return true;
  } catch (e) {
    print("ERROR: updateMilkRate: $e");
  }
  return false;
}

// /Dairy/records/milk_buyer/m/83290600009/17-03-2023

Future<bool> sellMilkToBuyer(
    {String? phoneNumber,
    String? time,
    String? amount,
    String? rate,
    String? weight}) async {
  String path = "Dairy/records/milk_buyer/$time/$phoneNumber/";
  print(path);
  try {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection(path);
    final snapShot = await FirebaseFirestore.instance
        .collection(path)
        .doc(getFormatedDate(DateTime.now()))
        .get();
    if (snapShot.exists) {
      Fluttertoast.showToast(msg: "Milk is already selled to this buyer!");
      return false;
    } else {
      await collectionReference.doc(getFormatedDate(DateTime.now())).set(
        {
          "amount": amount,
          "date": getFormatedDate(DateTime.now()),
          "rate": rate,
          "time": time == 'm' ? 'morning' : 'evening',
          "weight": weight,
        },
      );

      await updateMilkBuyerAmount(
          double.parse(amount ?? "0"), phoneNumber ?? "8329060009");
      //       Future<bool> sendMilkSelledSMS(
      // {String? amount,
      // String? weight,
      // String? time,
      // String? rate,
      // String? contactNumber}
      bool sms = await sendMilkSelledSMS(
          amount: amount,
          weight: weight,
          time: time == 'm' ? 'morning' : 'evening',
          rate: rate,
          contactNumber: phoneNumber ?? "");
      if (sms) {
        print("SMS sent!");
      } else {
        print("Unable to send sms!");
      }
      return true;
    }
  } catch (e) {
    print("ERROR: sellMilkToBuyer() $e");
  }
  return false;
}

// /Dairy/Dudhaganga/Milk_Buyer/8329060000/finance/amount

Future<void> updateMilkBuyerAmount(double value, String phoneNumber) async {
  try {
    String path = "/Dairy/Dudhaganga/Milk_Buyer/$phoneNumber/finance/";
    print("path is: $path");
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection(path);
    final snapShot =
        await FirebaseFirestore.instance.collection(path).doc("amount").get();
    if (snapShot.exists) {
      print(snapShot.data());
      double prevValue = double.parse(snapShot["balance"]);
      print("VALUE IS: $value");
      await collectionReference.doc("amount").set(
        {
          "balance": getDoubleReDecimaled(value + prevValue).toString(),
        },
        SetOptions(merge: false),
      );
      print("Amount updated from $prevValue to ${value + prevValue}");
    }
  } catch (e) {
    print("ERROR: updateMilkBuyerAmount() $e");
  }
}

Future<MilkBuyer?> getMilkBuyer(String? phoneNumber) async {
  //8329060000
  String path = "/Dairy/Dudhaganga/Milk_Buyer/";
  print(path);
  try {
    final snapShot = await FirebaseFirestore.instance
        .collection(path)
        .doc("$phoneNumber")
        .get();
    if (snapShot.exists) {
      return MilkBuyer(
          evening: true,
          morning: true,
          name: snapShot["name"].toString(),
          phoneNumber: snapShot["phoneNumber"].toString());
    }
  } catch (e) {
    print("ERROR: getMilkRate: $e");
  }
  return null;
}
