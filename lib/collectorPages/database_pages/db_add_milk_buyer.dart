import 'package:cloud_firestore/cloud_firestore.dart';

Future<bool> addNewMilkBuyer(
    String? name, String? phoneNumber, bool morning, bool evening) async {
  String path = "/Dairy/Dudhaganga/Milk_Buyer/";
  print("$name $phoneNumber $morning $evening");
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection(path);
  try {
    await collectionReference.doc(phoneNumber).set(
      {
        "name": name,
        "phoneNumber": phoneNumber,
        "morning": morning,
        "evening": evening,
      },
    );
    print("ADDED");
    return true;
  } catch (e) {
    print("Error while adding farmer:$e");
    print("NOT ADDED");
    return false;
  }
}
