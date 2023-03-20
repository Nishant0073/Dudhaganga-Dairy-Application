import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dudhaganga_app/models/farmer.dart';
import 'package:fluttertoast/fluttertoast.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:intl/intl.dart';

import '../models/milk_record.dart';

Future<bool> addMilkRecord(Farmer? farmer, double fat, double weight,
    String animal, double? snf, double? rate, double? value) async {
  print("$rate $weight $value");
  String doc = "b";
  if (animal == "cow") doc = "c";
  if (DateTime.now().hour < 15) {
    doc += "m";
  } else {
    doc += "e";
  }

  String path = "/Dairy/records/farmer/$doc/${farmer?.phoneNumber}/";
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection(path);

  final snapShot = await FirebaseFirestore.instance
      .collection(path)
      .doc(DateFormat('dd-MM-yy').format(DateTime.now()))
      .get();
  if (snapShot.exists == true) {
    Fluttertoast.showToast(msg: "Data is already present!");
    return false;
  }

  try {
    print(DateFormat('dd/MM/yy').format(DateTime.now()));
    await collectionReference
        .doc(DateFormat('dd-MM-yy').format(DateTime.now()))
        .set(
      {
        "name": farmer?.name,
        "phoneNumber": farmer?.phoneNumber,
        "animal": animal,
        "date": DateFormat('dd-MM-yy').format(DateTime.now()),
        "time": DateTime.now().hour < 15 ? "morning" : "evening",
        "weight": weight,
        "fat": fat,
        "snf": snf,
        "rate": rate,
        "value": value
      },
      SetOptions(merge: false),
    );
    updateAmount(value ?? 0, farmer?.phoneNumber ?? "0");
  } catch (e) {
    print("Error while adding farmer:$e");
    return false;
  }
  return true;
}

void updateAmount(double value, String phoneNumber) async {
  String path = "/Dairy/Dudhaganga/Farmers/$phoneNumber/finance/";
  print(path);
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection(path);
  final snapShot =
      await FirebaseFirestore.instance.collection(path).doc("amount").get();
  if (snapShot.exists) {
    print(snapShot.data());
    double prevValue = snapShot["balance"].toDouble();
    print("VALUE IS: $value");
    await collectionReference.doc("amount").set(
      {
        "balance": value + prevValue,
      },
      SetOptions(merge: false),
    );
    print("Amount updated from $prevValue to ${value + prevValue}");
  }
}

Future<List<MilkRecord>?> getMilkRecordsOfEachFarmer(String phoneNumber) async {
  String path = "/Dairy/records/farmer/cm/$phoneNumber/";
  print(path);
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection(path);
  try {
    QuerySnapshot querySnapshot = await collectionReference.get();

    var allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    List<MilkRecord> milkData = [];
    for (var i in allData) {
      print(i);
      milkData.add(MilkRecord.fromJson(i as Map<String, dynamic>));
    }
    path = "/Dairy/records/farmer/bm/$phoneNumber/";
    collectionReference = FirebaseFirestore.instance.collection(path);
    querySnapshot = await collectionReference.get();

    allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    for (var i in allData) {
      print(i);
      milkData.add(MilkRecord.fromJson(i as Map<String, dynamic>));
    }

    path = "/Dairy/records/farmer/ce/$phoneNumber/";
    collectionReference = FirebaseFirestore.instance.collection(path);
    querySnapshot = await collectionReference.get();

    allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    for (var i in allData) {
      print(i);
      milkData.add(MilkRecord.fromJson(i as Map<String, dynamic>));
    }
    path = "/Dairy/records/farmer/be/$phoneNumber/";
    collectionReference = FirebaseFirestore.instance.collection(path);
    querySnapshot = await collectionReference.get();

    allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    for (var i in allData) {
      print(i);
      milkData.add(MilkRecord.fromJson(i as Map<String, dynamic>));
    }
    return milkData;
  } catch (e) {
    print("getMilkRecordsOfEachFarmer() :$e");
    return [];
  }
}

Future<List<SellRecord>?> getMilkRecordsOfEachBuyer(String phoneNumber) async {
  String path = "/Dairy/records/milk_buyer/m/$phoneNumber/";
  print(path);
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection(path);
  try {
    QuerySnapshot querySnapshot = await collectionReference.get();

    var allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    List<SellRecord> milkData = [];
    for (var i in allData) {
      print(i);
      milkData.add(SellRecord.fromJson(i as Map<String, dynamic>));
    }
    path = "/Dairy/records/milk_buyer/e/$phoneNumber/";
    collectionReference = FirebaseFirestore.instance.collection(path);
    querySnapshot = await collectionReference.get();

    allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    for (var i in allData) {
      print(i);
      milkData.add(SellRecord.fromJson(i as Map<String, dynamic>));
    }

    return milkData;
  } catch (e) {
    print("getMilkRecordsOfEachBuyer() :$e");
    return [];
  }
}

void updateSellMilkAmount(double value, String phoneNumber) async {
  String path = " /Dairy/Dudhaganga/Milk_Buyer/$phoneNumber/finance/";
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection(path);
final snapShot =
      await FirebaseFirestore.instance.collection(path).doc("amount").get();
  if (snapShot.exists) {
    print(snapShot.data());
    double prevValue = snapShot["balance"].toDouble();
    await collectionReference.doc("amount").set(
      {
        "balance": value + prevValue,
      },
      SetOptions(merge: false),
    );
    print("Amount updated from $prevValue to ${value + prevValue}");
  }
}
