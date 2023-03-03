import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dudhaganga_app/models/farmer.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:intl/intl.dart';

Future<bool> addMilkRecord(Farmer? farmer, double fat, double weight,
    String animal, double? snf, double? rate, double? value) async {
  print("$rate $weight $value");
  String path = "/Dairy/records/farmer/docs/${farmer?.phoneNumber}/";
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection(path);
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
    );
  } catch (e) {
    print("Error while adding farmer:$e");
    return false;
  }
  return true;
}

Future<bool> getMilkRecordsOfEachFarmer(String phoneNumber) async {
  String path = "/Dairy/records/farmer/docs/$phoneNumber/";
  print(path);
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection(path);
  try {
    QuerySnapshot querySnapshot = await collectionReference.get();

    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    print(json.encode(allData));
    print(allData);
  } catch (e) {
    print("getMilkRecordsOfEachFarmer() :$e");
    return false;
  }
  return true;
}
