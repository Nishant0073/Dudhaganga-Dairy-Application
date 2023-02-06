import 'package:cloud_firestore/cloud_firestore.dart';

Future<bool> addNewMilkBuyer(
    String? name, String? phoneNumber, bool morning, bool evening) async {
  String path = "/Dairy/Dudhaganga/Milk_Buyer";
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection(path);
  try {
    await collectionReference.doc(phoneNumber).set(
      {
        "name": name,
        "phone_number": phoneNumber,
        "morning": morning,
        "evening": evening,
      },
    );
    return true;
  } catch (e) {
    print("Error while adding farmer:$e");
    return false;
  }
}
