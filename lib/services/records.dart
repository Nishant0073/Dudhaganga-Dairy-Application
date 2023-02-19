import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dudhaganga_app/models/farmer.dart';
import 'package:intl/intl.dart';

Future<bool> addMilkRecord(Farmer? farmer, double fat, double weight,
    String animal, double? snf, double? rate, double? value) async {
  print("$rate $weight $value");
  String path =
      "/Dairy/ Farmer/milkrecords/${farmer?.phoneNumber}/${DateFormat('dd-MM-yy').format(DateTime.now())}";
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection(path);
  try {
    print(DateFormat('dd/MM/yy').format(DateTime.now()));
    await collectionReference.doc(farmer?.phoneNumber).set(
      {
        "name": farmer?.name,
        "phoneNumber": farmer?.phoneNumber,
        "animal": animal,
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
