import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dudhaganga_app/models/farmer.dart';
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
